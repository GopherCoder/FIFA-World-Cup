package api_server

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
)

var (
	ErrorTeam = errors.New("not found record")
)

// teams ...
func TeamList(c *gin.Context) {

	teams := make([]model.Team, 0)

	if dbError := initiator.POSTGRES.Find(&teams).Error; dbError != nil {
		c.AbortWithError(404, ErrorTeam)
		return
	}
	fmt.Println()

	result := make([]model.TeamSerializer, len(teams))
	for index, team := range teams {
		result[index] = team.Serializer()

	}
	c.JSON(
		http.StatusOK,
		result,
	)

}
