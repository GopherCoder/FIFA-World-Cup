package api_server

import (
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
