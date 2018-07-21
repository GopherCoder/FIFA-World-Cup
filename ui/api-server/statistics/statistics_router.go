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

// ShowPlayerGoalHandler will list statistics of player goal
// @Summary List Goal
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/players/goals/{rank} [get]
// @Success 200 {object} model.PlayersStatisticWithGoalsScoredSerializer
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

// ShowPlayerGoalSearchHandler will list statistics of player goal
// @Summary List Goal
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "player name"
// @Param goal path string false "goals scored"
// @Resource Statistics
// @Router /statistics/players/goals [get]
// @Success 200 {array} model.PlayersStatisticWithGoalsScoredSerializer
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

// ShowPlayerShotHandler will list statistics of player shot
// @Summary List Shot
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/players/shots/{rank} [get]
// @Success 200 {object} model.PlayersStatisticWithShotSerializer
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

// ShowPlayerShotSearchHandler will list statistics of player shot
// @Summary List Shot
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "name"
// @Resource Statistics
// @Router /statistics/players/shots [get]
// @Success 200 {object} model.PlayersStatisticWithShotSerializer
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

// ShowPlayerTopHandler will list statistics of player top saves
// @Summary List Saves
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/players/saves/{rank} [get]
// @Success 200 {object} model.PlayersStatisticWithTopSaveSerializer
func ShowPlayerTopHandler(c *gin.Context) {
	rank := c.Param("rank")

	var topSave model.PlayersStatisticWithTopSave
	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&topSave).Error; dbError != nil {
		c.AbortWithError(400, dbError)
		return
	}

	c.JSON(http.StatusOK, topSave.Serializer())

}

// ShowPlayerTopSearchHandler will list statistics of player top saves
// @Summary List Saves
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "name"
// @Resource Statistics
// @Router /statistics/players/saves [get]
// @Success 200 {object} model.PlayersStatisticWithTopSaveSerializer
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

// ShowPlayerDisciplinaryHandler will list statistics of player disciplinary
// @Summary List Disciplinary
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/players/disciplinary/{rank} [get]
// @Success 200 {object} model.PlayersStatisticWithDisciplinarySerializer
func ShowPlayerDisciplinaryHandler(c *gin.Context) {

	rank := c.Param("rank")

	var disciplinary model.PlayersStatisticWithDisciplinary

	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&disciplinary).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}
	c.JSON(http.StatusOK, disciplinary.Serializer())
}

type PlayerDisciplinaryParam struct {
	Data struct {
		Name string `json:"name" binding:"required"`
	} `json:"disciplinary" binding:"required"`
}

// ShowPlayerDisciplinarySearchHandler will list statistics of player disciplinary
// @Summary List Disciplinary
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "player name"
// @Resource Statistics
// @Router /statistics/players/disciplinary [get]
// @Success 200 {object} model.PlayersStatisticWithDisciplinarySerializer
func ShowPlayerDisciplinarySearchHandler(c *gin.Context) {

	var param PlayerDisciplinaryParam
	if err := c.ShouldBindQuery(&param); err != nil {
		c.JSON(400, c.AbortWithError(400, err))
		return
	}

	var disciplinary model.PlayersStatisticWithDisciplinary

	if dbError := initiator.POSTGRES.Where("player_name LIKE ?", fmt.Sprintf("%%%s%%", param.Data.Name)).First(&disciplinary).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, disciplinary.Serializer())

}

// ShowTeamGoalHandler will list statistics of team goal
// @Summary List Goal
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/teams/goals/{rank} [get]
// @Success 200 {object} model.TeamsStatisticWithTopGoalSerializer
func ShowTeamGoalHandler(c *gin.Context) {
	rank := c.Param("rank")

	var goal model.TeamStatisticWithTopGoal
	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&goal).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(200, goal.Serializer())

}

type TeamGoalParam struct {
	Data struct {
		Name string `json:"name" binding:"required"`
	} `json:"goal" binding:"required"`
}

// ShowTeamGoalSearchHandler will list statistics of team goal
// @Summary List Goal
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "team name"
// @Resource Statistics
// @Router /statistics/teams/goals [get]
// @Success 200 {object} model.TeamsStatisticWithTopGoalSerializer
func ShowTeamGoalSearchHandler(c *gin.Context) {

	var param TeamGoalParam
	if err := c.ShouldBindQuery(param); err != nil {
		c.JSON(400, c.AbortWithError(400, err))
		return
	}
	var goal model.TeamStatisticWithTopGoal

	if dbError := initiator.POSTGRES.Where("team_name Like ?", fmt.Sprintf("%%%s%%", param.Data.Name)).First(&goal).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, goal.Serializer())
}

// ShowTeamAttemptsHandler will list statistics of team attempts
// @Summary List Attempts
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "team name"
// @Resource Statistics
// @Router /statistics/teams/attempts/{rank} [get]
// @Success 200 {object} model.TeamStatisticWithAttemptsSerializer
func ShowTeamAttemptsHandler(c *gin.Context) {
	rank := c.Param("rank")

	var attempt model.TeamStatisticWithAttempts
	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&attempt).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, attempt.Serializer())
}

type TeamAttemptsParam struct {
	Data struct {
		Name string `json:"name" binding:"required"`
	} `json:"attempts" binding:"required"`
}

// ShowTeamAttemptsSearchHandler will list statistics of team attempts
// @Summary List Attempts
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "team name"
// @Resource Statistics
// @Router /statistics/teams/attempts [get]
// @Success 200 {object} model.TeamStatisticWithAttemptsSerializer
func ShowTeamAttemptsSearchHandler(c *gin.Context) {
	var param TeamAttemptsParam

	if err := c.ShouldBindQuery(param); err != nil {
		c.JSON(400, c.AbortWithError(400, err))
		return
	}

	var attempts model.TeamStatisticWithAttempts
	if dbError := initiator.POSTGRES.Where("team_name LIKE ?", fmt.Sprintf("%%%s%%", param.Data.Name)).First(&attempts).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, attempts.Serializer())
}

// ShowTeamDisciplinaryHandler will list statistics of team disciplinary
// @Summary List Disciplinary
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param rank path string true "rank number"
// @Resource Statistics
// @Router /statistics/teams/disciplinary/{rank} [get]
// @Success 200 {object} model.TeamStatisticWithDisciplinarySerializer
func ShowTeamDisciplinaryHandler(c *gin.Context) {
	rank := c.Param("rank")

	var disciplinary model.TeamStatisticWithDisciplinary

	if dbError := initiator.POSTGRES.Where("rank = ?", rank).First(&disciplinary).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, disciplinary.Serializer())
}

type TeamDisciplinaryParam struct {
	Data struct {
		Name string `json:"name" binding:"required"`
	} `json:"disciplinary" binding:"required"`
}

// ShowTeamDisciplinarySearchHandler will list statistics of team disciplinary
// @Summary List Disciplinary
// @Accept json
// @Tags Statistics
// @Security Bearer
// @Produce  json
// @Param name path string false "team name"
// @Resource Statistics
// @Router /statistics/teams/disciplinary [get]
// @Success 200 {object} model.TeamStatisticWithDisciplinarySerializer
func ShowTeamDisciplinarySearchHandler(c *gin.Context) {
	var param TeamDisciplinaryParam

	if err := c.ShouldBindQuery(&param); err != nil {
		c.JSON(400, c.AbortWithError(400, err))
		return
	}

	var disciplinary model.TeamStatisticWithDisciplinary
	if dbError := initiator.POSTGRES.Where("team_name LIKE ?", param.Data.Name).First(&disciplinary).Error; dbError != nil {
		c.JSON(400, c.AbortWithError(400, dbError))
		return
	}

	c.JSON(http.StatusOK, disciplinary.Serializer())

}
