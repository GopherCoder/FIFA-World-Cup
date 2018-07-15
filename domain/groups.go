package domain

import (
	"FIFA-World-Cup/infra/adapter"
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
	doc.Find("div.fi-standings-list table").Each(func(i int, selection *goquery.Selection) {
		if _, ok := selection.Find("tbody tr").Attr("data-team-id"); ok != true {
			return
		}
		GN := selection.Find("caption p").Eq(0).Text()
		CN := adapter.StringClear(selection.Find("tbody tr td.fi-table__teamname.teamname-nolink div div").Eq(1).Find("span").Eq(0).Text())
		MP, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__matchplayed span").Text())
		W, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__win span").Text())
		D, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__draw span").Text())
		L, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__lost span").Text())
		GF, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__goalfor span").Text())
		GA, _ := strconv.Atoi(selection.Find("tbody tr tb.fi-table__goalagainst span").Text())
		DG, _ := strconv.Atoi(selection.Find("tbody tr tb.fi-table__diffgoal span").Text())
		PTS, _ := strconv.Atoi(selection.Find("tbody tr td.fi-table__pts span").Text())
		//fmt.Println(CN, MP, W, D, L, GF, GA, DG, PTS)

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
		// push data into db

	})
	return nil

}
