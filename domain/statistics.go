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
	ErrorTeamTopGoals = errors.New("error team top goal fail")
)

func TeamsTopGoals(doc *goquery.Document) error {
	doc.Find("table#goal-scored tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank span").Text()))
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text()))
		GF, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text()))
		GS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text()))
		GA, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text()))
		PEN, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text()))
		OGF, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text()))
		OPG, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text()))
		SPG, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(7).Find("span").Text()))

		fmt.Println(rank, teamName, MP, GF, GS, GA, PEN, OGF, OPG, SPG)
		oneTeamTopGoals := model.TeamStatisticWithTopGoal{
			Rank:          rank,
			TeamName:      teamName,
			MatchPlayed:   MP,
			GoalsFor:      GF,
			GoalsScored:   GS,
			GoalsAgainst:  GA,
			PenaltyGoal:   PEN,
			OwnGoals:      OGF,
			OpenPlayGoals: OPG,
			SetPieceGoals: SPG,
		}
		fmt.Println(oneTeamTopGoals)
		// push data into db
		initiator.POSTGRES.Save(&oneTeamTopGoals)
	})

	return nil
}

func TeamsShots(doc *goquery.Document) error {
	doc.Find("table#attacks tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank span").Text()))
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text()))
		S, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text()))
		ON, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text()))
		OFF, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text()))
		SB, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text()))

		//fmt.Println(rank, teamName, MP, S, ON, OFF, SB)
		oneTeamsShot := model.TeamStatisticWithAttempts{
			Rank:              rank,
			TeamName:          teamName,
			MatchPlayed:       MP,
			Shots:             S,
			AttemptsOnTarget:  ON,
			AttemptsOffTarget: OFF,
			ShotsBlocked:      SB,
		}
		fmt.Println(oneTeamsShot)
		// push data into db
		initiator.POSTGRES.Save(&oneTeamsShot)

	})
	return nil
}

func TeamsDisciplinary(doc *goquery.Document) error {
	doc.Find("table#top-cards tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank span").Text()))
		teamName := adapter.StringClear(selection.Find("td.fi-table__teamname").Find("a div div.fi-t__n span").Eq(0).Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text()))
		YC, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text()))
		IRC, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text()))
		DRC, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text()))
		FC, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text()))
		FS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text()))
		FCP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text()))
		fmt.Println(rank, teamName, MP, YC, IRC, DRC, FC, FS, FCP)
		oneTeamsDisciplinary := model.TeamStatisticWithDisciplinary{
			Rank:                rank,
			TeamName:            teamName,
			MatchPlayed:         MP,
			YellowCards:         YC,
			SecondYellow:        IRC,
			RedCards:            DRC,
			FoulsCommitted:      FC,
			FoulsSuffered:       FS,
			FoulsCausingPenalty: FCP,
		}
		fmt.Println(oneTeamsDisciplinary)
		// push data into db
		initiator.POSTGRES.Save(&oneTeamsDisciplinary)

	})
	return nil
}

func PlayersGoalScored(doc *goquery.Document) error {

	doc.Find("table#goal-scored tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank").Text()))
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		GS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Find("span").Text()))
		ASS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Find("span").Text()))
		MINP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Find("span").Text()))
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Find("span").Text()))
		PENS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Find("span").Text()))
		LEFT, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Find("span").Text()))
		RIGHT, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Find("span").Text()))
		HEAD, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(7).Find("span").Text()))

		fmt.Println(rank, name, GS, ASS, MINP, MP, PENS, LEFT, RIGHT, HEAD)

		onePlayerGoalsScored := model.PlayersStatisticWithGoalsScored{
			Rank:             rank,
			PlayerName:       name,
			GoalsScored:      GS,
			Assists:          ASS,
			MinutesPlayed:    MINP,
			MatchesPlayed:    MP,
			PenaltiesScored:  PENS,
			GoalsScoredLeft:  LEFT,
			GoalsScoredRight: RIGHT,
			HeadedGoals:      HEAD,
		}
		// push data into db
		initiator.POSTGRES.Save(&onePlayerGoalsScored)
		//fmt.Println(onePlayerGoalsScored)
	})

	return nil
}

func PlayersTopSaves(doc *goquery.Document) error {

	count := 0

	doc.Find("table#savers tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank").Text()))
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Text()))
		MINP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Text()))
		SAV, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Text()))
		SR := adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Text())

		//fmt.Println(rank, name, MP, MINP, SAV, SR)

		onePlayersTopSaves := model.PlayersStatisticWithTopSave{
			Rank:          rank,
			PlayerName:    name,
			MatchedPlayed: MP,
			MinutesPlayed: MINP,
			Saves:         SAV,
			SaveRate:      SR,
		}
		count++
		fmt.Println(onePlayersTopSaves)
		// push data into db
		initiator.POSTGRES.Save(&onePlayersTopSaves)
	})
	fmt.Println(count)
	return nil
}

func PlayersShots(doc *goquery.Document) error {

	count := 0

	doc.Find("table#attempts tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank").Text()))
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Text()))
		MINP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Text()))
		S, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Text()))
		AONT, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Text()))
		AOFFT, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Text()))
		SB, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Text()))

		fmt.Println(rank, name, MP, MINP, S, AONT, AOFFT, SB)
		onePlayerShots := model.PlayersStatisticWithShot{
			Rank:              rank,
			Player:            name,
			MatchesPlayed:     MP,
			MinutesPlayed:     MINP,
			Shots:             S,
			AttemptsOnTarget:  AONT,
			AttemptsOffTarget: AOFFT,
			ShotsBlocked:      SB,
		}
		count++
		//push data into db
		initiator.POSTGRES.Save(&onePlayerShots)

	})
	fmt.Println(count)

	return nil
}

func PlayersDisciplinary(doc *goquery.Document) error {
	count := 0
	doc.Find("table#cards tbody tr").Each(func(i int, selection *goquery.Selection) {
		rank, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__rank").Text()))
		name := adapter.StringClear(selection.Find("td.fi-table__playername.teamname-nolink").Find("a div div.fi-p__wrapper-text div.fi-p__name").Text())
		MP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(0).Text()))
		Y, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(1).Text()))
		FIA, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(2).Text()))
		FDA, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(3).Text()))
		FC, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(4).Text()))
		FS, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(5).Text()))
		FCP, _ := strconv.Atoi(adapter.StringClear(selection.Find("td.fi-table__td").Eq(6).Text()))

		fmt.Println(rank, name, MP, Y, FIA, FDA, FC, FS, FCP)

		onePlayerDisciplinary := model.PlayersStatisticWithDisciplinary{
			Rank:                rank,
			PlayerName:          name,
			MatchPlayed:         MP,
			YellowCards:         Y,
			SecondYellow:        FIA,
			RedCards:            FDA,
			FoulsCommitted:      FC,
			FoulsSuffered:       FS,
			FoulsCausingPenalty: FCP,
		}
		count++
		// push data into db
		initiator.POSTGRES.Save(&onePlayerDisciplinary)

	})
	fmt.Println(count)

	return nil
}
