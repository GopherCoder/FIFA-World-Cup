package api_server

import (
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

func APIServerInit(r *gin.Engine) {
	// docs
	r.GET("/docs/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	v1 := r.Group("/api")

	indexRegistry(v1)
	matchesRegistry(v1)
	teamsRegistry(v1)
	groupsRegistry(v1)
	playerRegistry(v1)
	coachesRegistry(v1)
	statisticsRegistry(v1)
	awardsRegistry(v1)
	classicRegistry(v1)

}

func indexRegistry(index *gin.RouterGroup) {
	index.GET("", HelloWorld)

}

func matchesRegistry(matches *gin.RouterGroup) {
	matches.GET("/matches/group", GroupPhase)
	matches.GET("/matches/knockout", KnockOutPhase)

}

func teamsRegistry(teams *gin.RouterGroup) {
	teams.GET("/teams/lists", TeamList)
}

func groupsRegistry(groups *gin.RouterGroup) {
	groups.GET("/groups/lists", GroupsList)

}

func playerRegistry(player *gin.RouterGroup) {
	player.GET("/players/lists")
}

func coachesRegistry(coaches *gin.RouterGroup) {
	coaches.GET("/coaches/lists", CoachesList)
}

func statisticsRegistry(statistics *gin.RouterGroup) {
	statistics.GET("/statistics/players/goals", StatisticsPlayerGoal)
	statistics.GET("/statistics/players/saves", StatisticsPlayerTop)
	statistics.GET("/statistics/players/shots", StatisticsPlayerShots)
	statistics.GET("/statistics/players/disciplinary", StatisticsPlayerDisciplinary)
}

func awardsRegistry(awards *gin.RouterGroup) {
	awards.GET("/awards/lists", AwardsList)
}

func classicRegistry(classic *gin.RouterGroup) {
	classic.GET("/classic/lists/:year", ClassicListbyYear)
	classic.GET("/classic/lists", ClassicLists)

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
