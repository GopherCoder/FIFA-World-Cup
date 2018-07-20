package initiator

import (
	"FIFA-World-Cup/infra/config"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

var POSTGRES *gorm.DB

func init() {
	//db init
	connectString := config.GetPostGreConfig()
	fmt.Println(connectString)
	connect, err := gorm.Open(
		"postgres",
		connectString,
	)
	connect.LogMode(true)
	if err != nil {
		fmt.Println(err)
		panic("connect postGre failed")
	}
	fmt.Println("Login postgre database success!")
	POSTGRES = connect

}
