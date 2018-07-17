package api_server

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"net/http"
	"strconv"
)

var (
	ErrorId = errors.New("id should less than 64")
)

// match
func GroupPhase(c *gin.Context) {

	number, _ := strconv.Atoi(c.Param("id"))

	fmt.Println(1, 2, 3, number, c.Param("id"))
	if number > 64 && number < 0 {
		c.AbortWithError(404, ErrorId)
		return
	}

	//var match model.Match

	var matches model.Match

	if dbError := initiator.POSTGRES.Where("match_number = ?", number).Find(&matches).Error; dbError != nil {
		c.AbortWithError(404, dbError)
		return
	}

	c.JSON(
		http.StatusOK,
		matches.Serializer(),
	)

}
