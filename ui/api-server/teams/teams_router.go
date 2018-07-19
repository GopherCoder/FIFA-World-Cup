package teams

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
	ErrorTeam      = errors.New("not found record")
	ErrorTeamId    = errors.New("id is not allow")
	ErrorTeamParam = errors.New("list team param error")
)

type ListTeamParam struct {
	Search string `form:"search"`
	Return string `form:"return"`
}

// teams ...
func TeamListHandler(c *gin.Context) {

	var param ListTeamParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorTeamParam)
		return
	}

	var teams []model.Team

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("search LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&teams).Error; dbError != nil {
			c.AbortWithError(404, ErrorTeam)
			return
		}
	}

	if param.Return == "all_list" {
		if dbError := initiator.POSTGRES.Find(&teams).Error; dbError != nil {
			c.AbortWithError(404, ErrorTeam)
			return
		}
	}

	result := make([]model.TeamSerializer, len(teams))
	for index, team := range teams {
		result[index] = team.Serializer()

	}
	c.JSON(
		http.StatusOK,
		result,
	)

}

func TeamHandler(c *gin.Context) {
	id := c.Param("teamID")

	number, _ := strconv.Atoi(id)

	if number <= 0 || number > 32 {
		c.AbortWithError(400, ErrorTeamId)
		return
	}

	var team model.Team
	if dbError := initiator.POSTGRES.Where("id = ?", id).First(&team).Error; dbError != nil {
		c.AbortWithError(400, ErrorTeam)
		return
	}

	c.JSON(200, team.Serializer())

}
