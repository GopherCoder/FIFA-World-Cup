package domain

import (
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
	ErrorAwardUrl        = errors.New("get award url fail")
	ErrorAwardDownloader = errors.New("download award source fail")
)

func Awards(doc *goquery.Document) error {
	var err error
	count := 0
	urlList := make([]string, 0, 0)
	urlList = append(urlList, "/worldcup/awards/golden-boot/")
	urlList = append(urlList, "/worldcup/awards/golden-glove/")
	urlList = append(urlList, "/worldcup/awards/golden-ball/")
	for _, url := range urlList {
		completeAwardURl := config.RootURL + url
		doc, err := download.Downloader(completeAwardURl)
		if err != nil {
			err = ErrorAwardDownloader
			break
		}
		// db save
		awards := callBack(completeAwardURl, doc)
		fmt.Println(completeAwardURl)
		for _, award := range awards {
			fmt.Println(award)
			count++
			// push data into db
			initiator.POSTGRES.Save(&award)

		}
	}
	fmt.Println(count)

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
