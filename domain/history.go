package domain

import (
	"FIFA-World-Cup/infra/adapter"
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/pkg/errors"
	"strings"
)

var (
	ErrorHistoryURL = errors.New("get archive url fail")
)

func Histories(doc *goquery.Document) error {

	var err error
	count := 0

	doc.Find("div.d3-o-media-object__body.fi-o-media-object__body").Each(func(i int, selection *goquery.Selection) {
		if selection.Find("span").Length() != 1 {
			return
		}
		Name := selection.Find("p").Eq(0).Text()
		Url, ok := selection.Find("a").Attr("href")
		if ok != true {
			err = ErrorHistoryURL
			return
		}
		completeURL := config.RootURL + Url
		doc, _ := download.Downloader(completeURL)
		oneArchive := model.WorldCupArchive{}
		oneArchive = callBackForHistories(completeURL, Name, doc)
		//fmt.Println(callBackForHistories(completeURL, Name, doc))

		// push data into db
		fmt.Println(oneArchive)
		initiator.POSTGRES.Save(&oneArchive)
		count++
	})

	fmt.Println(count)
	return nil
}

func callBackForHistories(url string, pageTitle string, doc *goquery.Document) model.WorldCupArchive {

	name, year := strings.Split(pageTitle, " ")[0], strings.Split(pageTitle, " ")[1]

	title := adapter.StringClear(doc.Find("h1.title a").Text())

	finalResult := doc.Find("div.matches div div a div.mu-m")
	homeCountry := finalResult.Find("div.t.home div").Eq(1).Find("span").Eq(0).Text()
	awayCountry := finalResult.Find("div.t.away div").Eq(1).Find("span").Eq(0).Text()
	score := finalResult.Find("div.s div div").Eq(2).Find("span").Text()

	finalScore := fmt.Sprintf("%s vs %s : score : %s", homeCountry, awayCountry, score)

	awards := make([]string, 0, 0)
	doc.Find("div.c-winner div.c-team-rank ul li").Each(func(i int, selection *goquery.Selection) {
		if selection.Length() != 1 {
			return
		}
		winnerInfo := selection.Find("div.t div.t-n").Find("span").Eq(0).Text()
		awards = append(awards, winnerInfo)
	})
	//fmt.Println(url, title, homeCountry, awayCountry, score, awards[0], awards[1], awards[2], awards[3])
	oneWorldCupArchive := model.WorldCupArchive{
		URL:         url,
		Name:        name,
		Year:        year,
		FinalResult: finalScore,
		Winner:      awards[0],
		RunnersUp:   awards[1],
		Third:       awards[2],
		Fourth:      awards[3],
		Title:       title,
	}
	return oneWorldCupArchive
}
