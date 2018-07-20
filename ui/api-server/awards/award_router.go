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

// ShowAwardHandler will list Awards
// @Summary List Awards
// @Accept json
// @Tags Awards
// @Security Bearer
// @Produce  json
// @Param awardID path string true "award id"
// @Resource Awards
// @Router /awards/{id} [get]
// @Success 200 {object} model.AwardSerializer
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

// ShowAllAwardHandler will list Awards
// @Summary List Awards
// @Accept json
// @Tags Awards
// @Security Bearer
// @Produce  json
// @Param search path string false "award_name"
// @param return path string false "return = all_list"
// @Resource Awards
// @Router /awards [get]
// @Success 200 {array} model.AwardSerializer
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
