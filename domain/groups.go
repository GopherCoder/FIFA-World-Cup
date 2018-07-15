package domain

import (
	"FIFA-World-Cup/infra/adapter"
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/pkg/errors"
	"strconv"
)

var (
	ErrorGroup = errors.New("groups ")
)

func Groups(doc *goquery.Document) error {
	count := 0

	groupsList := make([]string, 0, 0)

	doc.Find("div.fi-standings-list table caption").Each(func(i int, selection *goquery.Selection) {
		group := selection.Find("p").Eq(0).Text()
		groupsList = append(groupsList, group)
	})

	doc.Find("div.fi-standings-list table tbody tr").Each(func(i int, selection *goquery.Selection) {
		//index := 0
		if _, ok := selection.Attr("data-team-id"); ok != true {
			return
		}
		GN := groupsList[count/4]
		CN := adapter.StringClear(selection.Find("tbody tr td.fi-table__teamname.teamname-nolink div div.fi-t__n").Find("span").Eq(0).Text())
		MP, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__matchplayed span").Text())
		W, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__win span").Text())
		D, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__draw span").Text())
		L, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__lost span").Text())
		GF, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__goalfor span").Text())
		GA, _ := strconv.Atoi(selection.Find("tbody tr tb.fi-table__goalagainst span").Text())
		DG, _ := strconv.Atoi(selection.Find("tbody tr tb.fi-table__diffgoal span").Text())
		PTS, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__pts span").Text())
		fmt.Println(GN, CN, MP, W, D, L, GF, GA, DG, PTS)

		oneGroup := model.Group{
			GroupName:   GN,
			TeamName:    CN,
			MatchPlayed: MP,
			WinNumber:   W,
			Lost:        L,
			Draw:        D,
			GoalFor:     GF,
			GoalAgainst: GA,
			DiffGoal:    DG,
			Points:      PTS,
		}
		fmt.Println(oneGroup)
		count++
		// push data into db
		initiator.POSTGRES.Save(&oneGroup)

	})
	fmt.Println(count)
	return nil

}
