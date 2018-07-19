package awards

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
)

var (
	ErrorAwardParam = errors.New("award param is not correct")
)

func ShowAwardHandler(c *gin.Context) {

	id := c.Param("awardID")

	var award model.Award
	if dbError := initiator.POSTGRES.Where("info LIKE ?", fmt.Sprintf("%%%s%%", id)).First(&award).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}
	c.JSON(http.StatusOK, award.Serializer())

}

type ListAwardParam struct {
	Search string `form:"search"`
	Return string `form:"return"`
}

func ShowAllAwardHandler(c *gin.Context) {

	var param ListAwardParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorAwardParam)
		return
	}

	var awards []model.Award

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("award_name LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&awards).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&awards).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.AwardSerializer, len(awards))

	for index, award := range awards {
		result[index] = award.Serializer()
	}
	c.JSON(http.StatusOK, result)
}
