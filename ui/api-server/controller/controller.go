package controller

import (
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"strings"
)

var (
	ErrorAuth      = errors.New("please add token: 'Authorization: Bearer xxxx'")
	ErrorAuthWrong = errors.New("token is not right，example: Bearer xxxx")
)

func AuthRequired() gin.HandlerFunc {
	return func(c *gin.Context) {
		// Step 0: check is readsense app or not
		if vendor := c.Request.Header.Get("X-Requested-With"); vendor != "" {
			c.Set("X-Requested-With", vendor)
		}

		// Step 1: check Authorization
		header := c.Request.Header.Get("Authorization")
		if header == "" {
			c.AbortWithError(400, ErrorAuth)
			return
		}

		// Step 2: check Bearer
		authHeader := strings.Split(header, " ")

		if len(authHeader) != 2 {
			c.AbortWithError(400, ErrorAuthWrong)
			return
		}

		// Step 3: check auth_token
		token := authHeader[1]

		var admin model.Admin
		fmt.Println(token)
		if dbError := initiator.POSTGRES.Where("auth_token = ?", token).First(&admin).Error; dbError != nil {
			c.AbortWithError(400, dbError)
		} else {
			c.Set("current_admin", admin)
			c.Next()
		}
	}
}
