package players

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
	"strconv"
)

var (
	ErrorPlayerId    = errors.New("player id not allow")
	ErrorPlayerParam = errors.New("player param is not correct")
)

// ShowPlayersHandler will list a Player
// @Summary List Player
// @Accept json
// @Tags Players
// @Security Bearer
// @Produce  json
// @Param playerID path string true "player id"
// @Resource Players
// @Router /players/{id} [get]
// @Success 200 {object} model.PlaySerializer
func ShowPlayersHandler(c *gin.Context) {
	id := c.Param("playerID")
	number, _ := strconv.Atoi(id)

	if number > 736 || number < 0 {
		c.AbortWithError(400, ErrorPlayerId)
		return
	}

	var player model.Player

	if dbError := initiator.POSTGRES.Where("id = ?", id).Find(&player).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, player.Serializer())

}

type ListPlayerParam struct {
	Search  string `form:"search"`
	Return  string `form:"return"`
	Country string `form:"country"`
	Role    string `form:"role"`
	Number  string `form:"number"`
}

// ShowAllPlayersHandler will list Player
// @Summary List Players
// @Accept json
// @Tags Players
// @Security Bearer
// @Produce  json
// @Param search path string false " player name"
// @Param return path string false "return= all_list"
// @Param country path string false "country name"
// @Param role path string false "role name"
// @Param number path string false "number"
// @Resource Players
// @Router /players [get]
// @Success 200 {array} model.PlaySerializer
func ShowAllPlayersHandler(c *gin.Context) {

	var param ListPlayerParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorPlayerParam)
		return
	}

	var players []model.Player

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("name LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&players).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&players).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Number != "" {
		if dbError := initiator.POSTGRES.Where("number = ?", param.Number).Find(&players).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Role != "" {
		if dbError := initiator.POSTGRES.Where("role = ?", param.Role).Find(&players).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Country != "" {
		if dbError := initiator.POSTGRES.Where("country LIKE ?", fmt.Sprintf("%%%s%%", param.Country)).Find(&players).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.PlaySerializer, len(players))

	for index, player := range players {
		result[index] = player.Serializer()
	}

	c.JSON(http.StatusOK, result)
}
