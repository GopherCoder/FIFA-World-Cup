# Makefile for FIFA World Cup of 2018


APP_NAME = "fwc"

default:
	go build -o ${APP_NAME} main.go

install:
	govendor sync -v

dev:
	fresh -c configs/development.conf

clean:
	if [ -f ${APP_NAME} ]; then rm ${APP_NAME}; fi




