package domain

import (
	"FIFA-World-Cup/infra/adapter"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/pkg/errors"
)

var (
	ErrorTeamFlag = errors.New("get team flag fail")
)

func Teams(doc *goquery.Document) error {

	var err error

	doc.Find("div.fi-teams-list div").Each(func(i int, selection *goquery.Selection) {
		team := model.Team{}
		imageSrc, ok := selection.Find("a div.fi-team-card__flag img").Attr("src")
		//fmt.Println(imageSrc, ok)
		if ok != true {
			//fmt.Println("get team flag fail")
			err = ErrorTeamFlag
			return
		}
		team.Flag = imageSrc

		teamName := adapter.StringClear(selection.Find("a div.fi-team-card__name").Text())
		team.Name = teamName

		fmt.Println(team)
	})
	return err

}
