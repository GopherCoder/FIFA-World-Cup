package classic

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
)

var (
	ErrorClassicParam = errors.New("classic param is not correct")
)

func ShowClassicHandler(c *gin.Context) {

	year := c.Param("year")

	var classic model.WorldCupArchive
	if dbError := initiator.POSTGRES.Where("year = ?", year).First(&classic).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, classic.Serializer())

}

type ListClassicParam struct {
	Search  string `form:"search"`
	Return  string `form:"return"`
	Country string `form:"country_name"`
	Title   string `form:"title"`
}

func ShowAllClassicHandler(c *gin.Context) {

	var param ListClassicParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorClassicParam)
		return
	}

	var classics []model.WorldCupArchive
	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("final_result LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&classics).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&classics).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Country != "" {
		if dbError := initiator.POSTGRES.Where("country_name LIKE ?", fmt.Sprintf("%%%s%%", param.Country)).Find(&classics).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Title != "" {
		if dbError := initiator.POSTGRES.Where("info LIKE ?", fmt.Sprintf("%%%s%%", param.Title)).Find(&classics).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.WorldCupArchiveSerializer, len(classics))

	for index, archive := range classics {
		result[index] = archive.Serializer()
	}

	c.JSON(http.StatusOK, result)
}
