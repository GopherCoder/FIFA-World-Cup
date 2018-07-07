package api_server

import "github.com/gin-gonic/gin"

type APIServer struct {
	engine *gin.Engine
}

func (a *APIServer) registry() {

	index := a.engine.Group("")
	{
		index.GET("", HelloWorld)
	}

	matches := a.engine.Group("/api/matches")
	{
		matches.GET("/group", GroupPhase)
		matches.GET("/knockout", KnockOutPhase)

	}

	teams := a.engine.Group("/api/teams")
	{
		teams.GET("/lists", TeamList)

	}

	groups := a.engine.Group("/api/groups")
	{
		groups.GET("/lists", GroupsList)

	}

	player := a.engine.Group("/api/players")
	{
		player.GET("/lists")
	}

	coaches := a.engine.Group("api/coaches")
	{
		coaches.GET("/lists", CoachesList)

	}

	statistics := a.engine.Group("/api/statistics")
	{
		statistics.GET("/players/goals", StatisticsPlayerGoal)
		statistics.GET("/players/saves", StatisticsPlayerTop)
		statistics.GET("/players/shots", StatisticsPlayerShots)
		statistics.GET("/players/disciplinary", StatisticsPlayerDisciplinary)
	}

	awards := a.engine.Group("/api/awards")
	{
		awards.GET("/lists", AwardsList)
	}

	classic := a.engine.Group("/api/classic")
	{
		classic.GET("/lists", ClassicLists)
		classic.GET("/lists/:year", ClassicListbyYear)
	}

}

func (a *APIServer) init() {

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
