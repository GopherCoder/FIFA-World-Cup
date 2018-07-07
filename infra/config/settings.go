package config

import (
	"fmt"
	"github.com/spf13/viper"
)

var (
	MatchesURLGroupPhase    = "https://www.fifa.com/worldcup/matches/?#groupphase"
	MatchesURLKnockOutPhase = "https://www.fifa.com/worldcup/matches/?#knockoutphase"
	TeamsURL                = "https://www.fifa.com/worldcup/teams/"
	GroupsURL               = "https://www.fifa.com/worldcup/groups/"
	PlayersURL              = "https://www.fifa.com/worldcup/players/browser/"
	CoachesURL              = "https://www.fifa.com/worldcup/players/coaches/"
	StatisticsURL           = "https://www.fifa.com/worldcup/statistics/"
	GoalScoredURL           = "https://www.fifa.com/worldcup/statistics/players/goal-scored"
	AwardsURL               = "https://www.fifa.com/worldcup/awards/man-of-the-match/"
	HistoryURL              = "https://www.fifa.com/worldcup/classic/"
)

var ChromeDriverPath = "D:\\1_System\\1_Package\\chromedriver_win32\\chromedriver"

func init() {
	viper.SetConfigName("settings")
	viper.AddConfigPath("./FIFA-World-Cup/infra/config")
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
