package matches

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"strconv"
)

var (
	ErrorMatchNumber = errors.New("number not allow")
)

// MatchHandler will list one match
// @Summary List Match
// @Accept json
// @Tags Match
// @Security Bearer
// @Produce  json
// @Param matchID query string false "matchID"
// @Resource Match
// @Router /matches/:matchID [get]
// @Success 200 {object} model.MatchSerializer
func MatchHandler(c *gin.Context) {
	id := c.Param("matchID")

	number, _ := strconv.Atoi(id)

	if number > 32 || number < 0 {
		c.AbortWithError(400, ErrorMatchNumber)
		return
	}

	var match model.Match
	if dbError := initiator.POSTGRES.Where("id = ?", id).First(&match).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(200, match.Serializer())

}

type ListMatchParam struct {
	Search  string `form:"search"`
	Return  string `form:"return"`
	Match   string `form:"match_number"`
	Country string `form:"country_name"`
	Group   string `form:"group_name"`
}

func ListMatchHandler(c *gin.Context) {
	var param ListMatchParam
	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, err)
		return
	}

	var matches []model.Match

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("country_left LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&matches).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&matches).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Match != "" {
		if dbError := initiator.POSTGRES.Where("match_number = ?", param.Match).Find(&matches).Error; dbError != nil {

			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Group != "" {
		if dbError := initiator.POSTGRES.Where("group_name LIKE ?", fmt.Sprintf("%%%s%%", param.Group)).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.MatchSerializer, len(matches))

	for index, match := range matches {
		result[index] = match.Serializer()
	}

	c.JSON(200, result)
}
