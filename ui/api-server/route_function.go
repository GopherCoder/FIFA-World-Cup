package api_server

import (
	"FIFA-World-Cup/domain"
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"github.com/gin-gonic/gin"
	"net/http"
)

// index ...
func HelloWorld(c *gin.Context) {
	c.JSON(
		http.StatusOK, gin.H{
			"message": "Hello World! FIFA world Cup 2018"},
	)
}

// match
func GroupPhase(c *gin.Context) {
	// db.create

	// model.serializer
	docTemp, _ := download.Downloader(config.MatchesURLGroupPhase)
	domain.MatchesGroupPhase(docTemp)

	//var match model.Match
	c.JSON(
		http.StatusOK,
		"12",
	)

}

func KnockOutPhase(c *gin.Context) {}

// teams ...
func TeamList(c *gin.Context) {

}

// groups ...

func GroupsList(c *gin.Context) {}

// players ...

func PlayersList(c *gin.Context) {

}

// coaches ...

func CoachesList(c *gin.Context) {

}

// statistics

func StatisticsPlayerGoal(c *gin.Context) {}

func StatisticsPlayerTop(c *gin.Context) {}

func StatisticsPlayerShots(c *gin.Context) {}

func StatisticsPlayerDisciplinary(c *gin.Context) {}

// awards ...

func AwardsList(c *gin.Context) {}

// classic ...

func ClassicLists(c *gin.Context) {}

func ClassicListbyYear(c *gin.Context) {}
