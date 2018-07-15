package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/pkg/errors"
	"strings"
)

var (
	ErrorAwardUrl        = errors.New("get award url fail")
	ErrorAwardDownloader = errors.New("download award source fail")
)

func Awards(doc *goquery.Document) error {
	var err error
	doc.Find("div.fi-module-latest-news__carousel div div.d3-o-media-object--vertical.fi-o-media-object__teaser").Each(func(i int, selection *goquery.Selection) {
		url, ok := selection.Find("div div a").Attr("href")
		if ok != true {
			err = ErrorAwardUrl
			return
		}
		completeAwardURl := config.RootURL + url
		if !strings.Contains(url, "golden") {
			return
		}
		doc, err := download.Downloader(completeAwardURl)
		if err != nil {
			err = ErrorAwardDownloader
			return
		}
		// db save
		awards := callBack(completeAwardURl, doc)
		for _, award := range awards {
			fmt.Println(award)
			// push data into db

		}
	})

	return err
}

func callBack(url string, doc *goquery.Document) []model.Award {

	allAwardInfo := make([]model.Award, 0, 0)

	awardName := doc.Find("h1").Eq(2).Text()

	doc.Find("div p").Each(func(i int, selection *goquery.Selection) {

		if i > 6 {

			awardInfo := selection.Text()
			if strings.HasPrefix(awardInfo, "*") {
				return
			}
			oneAward := model.Award{}
			oneAward.URL = url
			oneAward.AwardName = awardName
			oneAward.Info = awardInfo
			allAwardInfo = append(allAwardInfo, oneAward)
		}

	})
	return allAwardInfo
}
