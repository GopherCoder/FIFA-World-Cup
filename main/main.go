package main

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/ui/api-server"
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
		panic("connect postGre failed")
	}
	defer POSTGRES.Close()

}

func main() {
	api_server.New().Start()
}
