package statistics

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
)

var (
	ErrorStatisticsPlayerGoalParam = errors.New("statistics player goal param wrong")
)

func ShowPlayerGoalHandler(c *gin.Context) {

	rank := c.Param("rank")

	var goal model.PlayersStatisticWithGoalsScored
	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&goal).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, goal.Serializer())

}

type ListPlayerGoal struct {
	Name string `form:"name"`
	Goal string `form:"goal"`
}

func ShowPlayerGoalSearchHandler(c *gin.Context) {

	var param ListPlayerGoal

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, ErrorStatisticsPlayerGoalParam)
		return
	}

	var goals []model.PlayersStatisticWithGoalsScored

	if param.Name != "" {
		if dbError := initiator.POSTGRES.Where("player_name LIKE ?", fmt.Sprintf("%%%s%%", param.Name)).Find(&goals).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	if param.Goal != "" {
		if dbError := initiator.POSTGRES.Where("goals_scored = ?", param.Goal).Find(&goals).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	var result = make([]model.PlayersStatisticWithGoalsScoredSerializer, len(goals))

	for index, goal := range goals {
		result[index] = goal.Serializer()
	}

	c.JSON(http.StatusOK, result)

}

func ShowPlayerShotHandler(c *gin.Context) {

	rank := c.Param("rank")

	var shot model.PlayersStatisticWithShot

	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&shot).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, shot.Serializer())
}

type FormParam struct {
	Name string `form:"name"`
}

func ShowPlayerShotSearchHandler(c *gin.Context) {
	var param FormParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, err)
		return
	}

	var shot model.PlayersStatisticWithShot

	if param.Name != "" {
		if dbError := initiator.POSTGRES.Where("name LIKE ?", fmt.Sprintf("%%%s%%", param.Name)).First(&shot).Error; dbError != nil {
			c.AbortWithError(400, dbError)
			return
		}
	}

	c.JSON(http.StatusOK, shot.Serializer())

}

func ShowPlayerTopHandler(c *gin.Context) {
	rank := c.Param("rank")

	var topSave model.PlayersStatisticWithTopSave
	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&topSave).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, topSave.Serializer())

}

func ShowPlayerTopSearchHandler(c *gin.Context) {

	var param FormParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.AbortWithError(400, err)
		return
	}

	var topSave model.PlayersStatisticWithTopSave
	if dbError := initiator.POSTGRES.Where("name LIKE ?", fmt.Sprintf("%%%s%%", param.Name)).First(&topSave).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, topSave.Serializer())
}

func ShowPlayerDisciplinaryHandler(c *gin.Context) {}

func ShowPlayerDisciplinarySearchHandler(c *gin.Context) {}

func ShowTeamGoalHandler(c *gin.Context) {}

func ShowTeamGoalSearchHandler(c *gin.Context) {}

func ShowTeamShotHandler(c *gin.Context) {}

func ShowTeamShotSearchHandler(c *gin.Context) {}

func ShowTeamDisciplinaryHandler(c *gin.Context) {}

func ShowTeamDisciplinarySearchHandler(c *gin.Context) {}
