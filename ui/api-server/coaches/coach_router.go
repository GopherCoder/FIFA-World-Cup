package coaches

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
	ErrorCoachID    = errors.New("coach id is not allow")
	ErrorCoachParam = errors.New("coach param wrong")
)

func ShowCoachHandler(c *gin.Context) {
	id := c.Param("coachID")

	number, _ := strconv.Atoi(id)

	if number > 32 || number < 0 {
		c.AbortWithError(400, ErrorCoachID)
		return
	}

	var coach model.Coach
	if dbError := initiator.POSTGRES.Where("id = ?", id).First(&coach).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, coach.Serializer())
}

type ListCoachParam struct {
	Search  string `form:"search"`
	Return  string `form:"return"`
	Country string `form:"country"`
}

func ShowAllCoachHandler(c *gin.Context) {

	var param ListCoachParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorCoachParam)
		return
	}

	var coaches []model.Coach

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("name LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&coaches).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&coaches).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Country != "" {
		if dbError := initiator.POSTGRES.Where("country LIKE ?", fmt.Sprintf("%%%s%%", param.Country)).Find(&coaches).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.CoachSerializer, len(coaches))

	for index, coach := range coaches {
		result[index] = coach.Serializer()
	}

	c.JSON(http.StatusOK, result)
}
