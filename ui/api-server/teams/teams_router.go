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

// TeamListHandler will list  teams
// @Summary List Teams
// @Accept json
// @Tags Teams
// @Security Bearer
// @Produce  json
// @Param search query string false "country home name"
// @Param return query string false "all_list will return all teams"
// @Resource Teams
// @Router /teams [get]
// @Success 200 {array} model.TeamSerializer
func TeamListHandler(c *gin.Context) {

	var param ListTeamParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorTeamParam)
		return
	}

	var teams []model.Team

	if param.Search != "" {
		if dbError := initiator.POSTGRES.Where("team_name LIKE ?", fmt.Sprintf("%%%s%%", param.Search)).Find(&teams).Error; dbError != nil {
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

// TeamHandler will list a team
// @Summary List Team
// @Accept json
// @Tags Teams
// @Security Bearer
// @Produce  json
// @Param teamID path string true "team id"
// @Resource Teams
// @Router /teams/{id} [get]
// @Success 200 {object} model.TeamSerializer
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
