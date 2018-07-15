package initiator

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

var POSTGRES *gorm.DB

func init() {
	//db init
	connectString := config.GetPostGreConfig()
	fmt.Println(connectString)
	POSTGRES, err := gorm.Open(
		"postgres",
		connectString,
	)

	if err != nil {
		fmt.Println(err)
		panic("connect postGre failed")
	}
	defer POSTGRES.Close()
	//start()

}

func start() {
	POSTGRES.AutoMigrate(
		&model.Match{},
		&model.Award{},
		&model.Coach{},
		&model.Group{},
		&model.Team{},
		&model.Player{},
		&model.WorldCupArchive{},
		&model.TeamsStatisticWithTopGoal{},
		&model.TeamStatisticWithAttempts{},
		&model.TeamStatisticWithDisciplinary{},
		&model.PlayersStatisticWithGoalsScored{},
		&model.PlayersStatisticWithTopSave{},
		&model.PlayersStatisticWithShot{},
		&model.PlayersStatisticWithDisciplinary{},
	)
}
