package groups

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
)

// groups ...

var (
	ErrorId = errors.New("id should less than 32")
)

type ListGroup struct {
	Search string `form:"search"`
	Return string `form:"return"`
	Group  string `form:"group_name"`
}

// ListGroupPhaseHandler will list  groups
// @Summary List Groups
// @Accept json
// @Tags Groups
// @Security Bearer
// @Produce  json
// @Param search path string false "group id"
// @Param return path string false "return=all_list"
// @Param group_name path string false "group_name"
// @Resource Groups
// @Router /groups [get]
// @Success 200 {array} model.GroupSerializer
func ListGroupPhaseHandler(c *gin.Context) {

	var params ListGroup
	if err := c.ShouldBindQuery(&params); err != nil {
		return
	}
	fmt.Println(params)
	var groups []model.Group
	if params.Search != "" {
		if dbError := initiator.POSTGRES.Where("team_name LIKE ?", fmt.Sprintf("%%%s%%", params.Search)).Find(&groups).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}

	}

	if params.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&groups).Error; dbError != nil {
			c.JSON(400, c.AbortWithError(400, dbError))
			return
		}
	}

	if params.Group != "" {
		if dbError := initiator.POSTGRES.Where("group_name LIKE ?", fmt.Sprintf("%%%s%%", params.Group)).Find(&groups).Error; dbError != nil {
			c.JSON(400, c.AbortWithError(400, dbError))
			return
		}
	}

	var result []model.GroupSerializer

	for _, group := range groups {
		result = append(result, group.Serializer())
	}
	c.JSON(200, result)

}

// GroupPhaseHandler will list a group
// @Summary List Group
// @Accept json
// @Tags Groups
// @Security Bearer
// @Produce  json
// @Param groupID path string true "group id"
// @Resource Groups
// @Router /groups/{id} [get]
// @Success 200 {object} model.GroupSerializer
func GroupPhaseHandler(c *gin.Context) {

	number, _ := strconv.Atoi(c.Param("groupID"))

	if number > 32 && number < 0 {
		c.JSON(400, c.AbortWithError(404, ErrorId))
		return
	}

	var group model.Group

	if dbError := initiator.POSTGRES.Where("id = ?", number).First(&group).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(404, dbError))
		return
	}

	c.JSON(
		http.StatusOK,
		group.Serializer(),
	)

}
