package main

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/ui/api-server"
)

func main() {

	// 1. create table by gorm aut migrate
	initiator.StartTable()
	defer initiator.POSTGRES.Close()

	// 2. push data into db

	PushDataIntoDB()

	// 3. start http server
	api_server.New().Start()
}

func PushDataIntoDB() {
	// 1. matches

	//urlMatches := config.MatchesURLGroupPhase
	//docMatches, _ := download.Downloader(urlMatches)
	//domain.MatchesGroupPhase(docMatches)

	// 2. teams

	//urlTeams := config.TeamsURL
	//docTeams, _ := download.Downloader(urlTeams)
	//domain.Teams(docTeams)

	// 3. groups

	//urlGroups := config.GroupsURL
	//docGroups, _ := download.Downloader(urlGroups)
	//domain.Groups(docGroups)

	// 4. players

	//urlPlayers := config.PlayersURLList
	//docPlayers, _ := download.Downloader(urlPlayers)
	//domain.Players(docPlayers)

	//urlCoaches := config.CoachesURL
	//docCoaches, _ := download.Downloader(urlCoaches)
	//domain.Coaches(docCoaches)

	// 5. statistics
	//urlTeamsTopGoals := config.StatisticsTeamGoalURL
	//docTeamsTopGoals, _ := download.Downloader(urlTeamsTopGoals)
	//domain.TeamsTopGoals(docTeamsTopGoals)

	//urlTeamsAttempts := config.StatisticsTeamShots
	//docTeamShots, _ := download.Downloader(urlTeamsAttempts)
	//domain.TeamsShots(docTeamShots)

	//urlTeamsDisciplinary := config.StatisticsTeamDisciplinary
	//docTeamsDisciplinary, _ := download.Downloader(urlTeamsDisciplinary)
	//domain.TeamsDisciplinary(docTeamsDisciplinary)

	//urlPlayerGoalsScored := config.StatisticsPlayerGoalScoredURL
	//docPlayerGoalsScore, _ := download.Downloader(urlPlayerGoalsScored)
	//domain.PlayersGoalScored(docPlayerGoalsScore) // 缺少数据，注意下

	//urlPlayersTopSaves := config.StatisticsPlayerSaves
	//docPlayersTopSaves, _ := download.Downloader(urlPlayersTopSaves)
	//domain.PlayersTopSaves(docPlayersTopSaves)

	//urlPlayerShot := config.StatisticsPlayerShots
	//docPlayerShot, _ := download.Downloader(urlPlayerShot)
	//domain.PlayersShots(docPlayerShot)

	//urlPlayerDisciplinary := config.StatisticsPlayerDisciplinary
	//docPlayerDisciplinary, _ := download.Downloader(urlPlayerDisciplinary)
	//domain.PlayersDisciplinary(docPlayerDisciplinary)
	// 6. awards
	//urlAward := config.AwardsURL
	//docAward, _ := download.Downloader(urlAward)
	//domain.Awards(docAward)

	// 7. classic
	//urlClassic := config.HistoryURL
	//docClassic, _ := download.Downloader(urlClassic)
	//domain.Histories(docClassic)

}
