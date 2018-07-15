# Makefile for FIFA World Cup of 2018


APP_NAME = "fwc"

default:
    go build -o ${APP_NAME} $GOPATH/FIFA-World-Cup/main/main.go

install:
    govendor sync -v

dev:
    fresh -c $GOPATH/FIFA-World-Cup/configs/development.conf

clean:
    if [ -f ${APP_NAME} ]; then rm ${APP_NAME}; fi




