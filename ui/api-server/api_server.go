package api_server

import (
	_ "FIFA-World-Cup/docs"
	"FIFA-World-Cup/ui/api-server/awards"
	"FIFA-World-Cup/ui/api-server/classic"
	"FIFA-World-Cup/ui/api-server/coaches"
	"FIFA-World-Cup/ui/api-server/groups"
	"FIFA-World-Cup/ui/api-server/matches"
	"FIFA-World-Cup/ui/api-server/players"
	"FIFA-World-Cup/ui/api-server/statistics"
	"FIFA-World-Cup/ui/api-server/teams"
	"fmt"
	"net/http"

	"FIFA-World-Cup/ui/api-server/admins"
	"FIFA-World-Cup/ui/api-server/controller"
	"github.com/gin-gonic/gin"
	"github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
)

type APIServer struct {
	engine *gin.Engine
}

func (a *APIServer) registry() {
	APIServerInit(a.engine)

}

func (a *APIServer) init() {

}

type Welcome struct {
	Greet string `json:"greet" binding:"required"`
	Words string `json:"words" binding:"required"`
}

func APIServerInit(r *gin.Engine) {
	// docs
	r.GET("/docs/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	r.POST("/welcome", func(context *gin.Context) {
		var welcome Welcome
		if err := context.ShouldBindJSON(&welcome); err == nil {
			if welcome.Greet == "FIFA-World-Cup" && welcome.Words == "Hello World" {
				context.SecureJSON(
					http.StatusOK,
					gin.H{
						"status": fmt.Sprintf("%s : %s", welcome.Words, welcome.Greet),
					},
				)
			} else {
				context.JSON(
					http.StatusAccepted,
					gin.H{
						"err": err.Error(),
					},
				)
			}
		}
	})
	v1 := r.Group("/v1/api")
	indexRegistry(v1)
	adminsRegistry(v1)

	v1.Use(controller.AuthRequired())
	{
		matchesRegistry(v1)
		teamsRegistry(v1)
		groupsRegistry(v1)
		playerRegistry(v1)
		coachesRegistry(v1)
		statisticsRegistry(v1)
		awardsRegistry(v1)
		classicRegistry(v1)

	}

}

func indexRegistry(r *gin.RouterGroup) {
	r.GET("", HelloWorld)

}

func HelloWorld(c *gin.Context) {
	c.JSON(
		http.StatusOK,
		gin.H{
			"message": "Hello World! FIFA world Cup 2018"},
	)
}

func adminsRegistry(r *gin.RouterGroup) {
	r.POST("/admins/sign_in", admins.SignIn)
	r.POST("/admins/sign_up", admins.SignUp)

}

func matchesRegistry(r *gin.RouterGroup) {
	r.GET("/matches/:matchID", matches.MatchHandler)
	r.GET("/matches", matches.ListMatchHandler)

}

func teamsRegistry(r *gin.RouterGroup) {
	r.GET("/teams", teams.TeamListHandler)
	r.GET("/teams/:teamID", teams.TeamHandler)
}

func groupsRegistry(r *gin.RouterGroup) {
	r.GET("/groups/:groupID", groups.GroupPhaseHandler)
	r.GET("/groups", groups.ListGroupPhaseHandler)

}

func playerRegistry(r *gin.RouterGroup) {
	r.GET("/players", players.ShowAllPlayersHandler)
	r.GET("/players/:playerID", players.ShowPlayersHandler)
}

func coachesRegistry(r *gin.RouterGroup) {
	r.GET("/coaches", coaches.ShowAllCoachHandler)
	r.GET("/coaches/:coachID", coaches.ShowCoachHandler)
}

func statisticsRegistry(r *gin.RouterGroup) {
	r.GET("/statistics/players/goals/:rank", statistics.ShowPlayerGoalHandler)
	r.GET("/statistics/players/goals", statistics.ShowPlayerGoalSearchHandler)
	r.GET("/statistics/players/saves/:rank", statistics.ShowPlayerTopHandler)
	r.GET("/statistics/players/saves", statistics.ShowPlayerTopSearchHandler)
	r.GET("/statistics/players/shots/:rank", statistics.ShowPlayerShotHandler)
	r.GET("/statistics/players/shots", statistics.ShowPlayerShotSearchHandler)
	r.GET("/statistics/players/disciplinary/:rank", statistics.ShowPlayerDisciplinaryHandler)
	r.GET("/statistics/players/disciplinary", statistics.ShowPlayerDisciplinarySearchHandler)
	r.GET("/statistics/teams/goals/:rank", statistics.ShowTeamGoalHandler)
	r.GET("/statistics/teams/goals", statistics.ShowTeamGoalSearchHandler)
	r.GET("/statistics/teams/attempts/:rank", statistics.ShowTeamAttemptsHandler)
	r.GET("/statistics/teams/attempts", statistics.ShowTeamAttemptsSearchHandler)
	r.GET("/statistics/teams/disciplinary/:rank", statistics.ShowTeamDisciplinaryHandler)
	r.GET("/statistics/teams/disciplinary", statistics.ShowTeamDisciplinarySearchHandler)
}

func awardsRegistry(r *gin.RouterGroup) {
	r.GET("/awards", awards.ShowAllAwardHandler)
	r.GET("/awards/:awardID", awards.ShowAwardHandler)
}

func classicRegistry(r *gin.RouterGroup) {
	r.GET("/classic/lists/:year", classic.ShowClassicHandler)
	r.GET("/classic/lists", classic.ShowAllClassicHandler)

}

func (a *APIServer) Start() {
	a.registry()
	a.engine.Run(":5000")
}

func New() *APIServer {
	return &APIServer{
		engine: gin.Default(),
	}
}
