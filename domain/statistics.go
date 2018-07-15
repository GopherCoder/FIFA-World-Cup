package domain

import (
	"FIFA-World-Cup/infra/adapter"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/pkg/errors"
)

var (
	ErrorTeamsTopGoals = errors.New("error team top goal fail")
)

func TeamsTopGoals(doc *goquery.Document) error {
	doc.Find("table#goal-scored tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank := adapter.StringClear(selection.Find("td.fi-table__rank.sorting_1 span").Text())
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text())
		GF := adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text())
		GS := adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text())
		GA := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text())
		PEN := adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text())
		OGF := adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text())
		OPG := adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text())
		SPG := adapter.StringClear(selection.Find("td.fi-table__td").Eq(7).Find("span").Text())

		fmt.Println(rank, teamName, MP, GF, GS, GA, PEN, OGF, OPG, SPG)
	})

	return nil
}

func TeamsShots(doc *goquery.Document) error {
	doc.Find("table#attacks tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank := adapter.StringClear(selection.Find("td.fi-table__rank.sorting_1 span").Text())
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text())
		S := adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text())
		ON := adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text())
		OFF := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text())
		SB := adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text())

		fmt.Println(rank, teamName, MP, S, ON, OFF, SB)
	})
	return nil
}

func TeamsDisciplinary(doc *goquery.Document) error {
	doc.Find("table#top-cards tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank := adapter.StringClear(selection.Find("td.fi-table__rank.sorting_1 span").Text())
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text())
		YC := adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text())
		IRC := adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text())
		DRC := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text())
		FC := adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text())
		FS := adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text())
		FCP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text())
		fmt.Println(rank, teamName, MP, YC, IRC, DRC, FC, FS, FCP)

	})
	return nil
}

func PlayersGoalScored(doc *goquery.Document) error {

	doc.Find("table#goal-scored tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank := adapter.StringClear(selection.Find("td.fi-table__rank").Text())
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		GS := adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text())
		ASS := adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text())
		MINP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text())
		MP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text())
		PENS := adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text())
		LEFT := adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text())
		RIGHT := adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text())
		HEAD := adapter.StringClear(selection.Find("td.fi-table__td").Eq(7).Find("span").Text())

		fmt.Println(rank, name, GS, ASS, MINP, MP, PENS, LEFT, RIGHT, HEAD)
	})

	return nil
}

func PlayersTopSaves(doc *goquery.Document) error {

	doc.Find("table#savers tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank := adapter.StringClear(selection.Find("td.fi-table__rank").Text())
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		MP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Text())
		MINP := adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Text())
		SAV := adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Text())
		SR := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Text())

		fmt.Println(rank, name, MP, MINP, SAV, SR)
	})

	return nil
}
