package config

import (
	"fmt"
	"github.com/spf13/viper"
)

var (
	MatchesURLGroupPhase          = "https://www.fifa.com/worldcup/matches/?#groupphase"
	MatchesURLKnockOutPhase       = "https://www.fifa.com/worldcup/matches/?#knockoutphase"
	TeamsURL                      = "https://www.fifa.com/worldcup/teams/"
	GroupsURL                     = "https://www.fifa.com/worldcup/groups/"
	PlayersURL                    = "https://www.fifa.com/worldcup/players/browser/"
	PlayersURLList                = "https://www.fifa.com/worldcup/players/_libraries/byposition/all/_players-list"
	CoachesURL                    = "https://www.fifa.com/worldcup/players/coaches/"
	StatisticsURL                 = "https://www.fifa.com/worldcup/statistics/"
	StatisticsTeamGoalURL         = "https://www.fifa.com/worldcup/statistics/teams/goal-scored"
	StatisticsTeamShots           = "https://www.fifa.com/worldcup/statistics/teams/shots"
	StatisticsTeamDisciplinary    = "https://www.fifa.com/worldcup/statistics/teams/disciplinary"
	StatisticsPlayerGoalScoredURL = "https://www.fifa.com/worldcup/statistics/players/goal-scored"
	StatisticsPlayerSaves         = "https://www.fifa.com/worldcup/statistics/players/saves"
	StatisticsPlayerShots         = "https://www.fifa.com/worldcup/statistics/players/shots"
	StatisticsPlayerDisciplinary  = "https://www.fifa.com/worldcup/statistics/players/disciplinary"
	AwardsURL                     = "https://www.fifa.com/worldcup/awards/"
	HistoryURL                    = "https://www.fifa.com/worldcup/classic/"
)

var (
	RootURL = "https://www.fifa.com"
)

var ChromeDriverPath = "D:\\1_System\\1_Package\\chromedriver_win32\\chromedriver"

func init() {
	viper.SetConfigName("settings")
	viper.AddConfigPath("$GOPATH/src/FIFA-World-Cup/infra/config")
	viper.SetConfigType("yml")
	err := viper.ReadInConfig()
	if err != nil {
		panic(fmt.Errorf("Fatal error config file: %s \n", err))
	}
}

func GetPostGreConfig() string {

	var (
		dbName   string
		port     string
		user     string
		sslMode  string
		password string
		host     string
	)

	dbName = viper.GetString("db.dbname")
	port = viper.GetString("db.port")
	user = viper.GetString("db.user")
	sslMode = viper.GetString("db.sslmode")
	password = viper.GetString("db.password")
	host = viper.GetString("db.host")

	return fmt.Sprintf("host=%s user=%s dbname=%s port=%s sslmode=%s password=%s", host, user, dbName, port, sslMode, password)

}
