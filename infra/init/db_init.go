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
		panic("connect postgres failed")
	}
	fmt.Println("Login postgres database success!")
	POSTGRES = connect

}
