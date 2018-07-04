package domain

import (
	"fmt"

	"FIFA-World-Cup/infra/adapter"

	"github.com/PuerkitoBio/goquery"
)

func MatchesGroupPhase(doc *goquery.Document) (string, error) {
	// body > div.content-wrap.fi-basic-template > div > div:nth-child(5) > section > div:nth-child(2) > div.fi-matchlist > div:nth-child(2)
	doc.Find("div.fi-matchlist div.fi-mu-list").Each(func(i int, selection *goquery.Selection) {
		data := selection.Find("a div.fi-mu__info").Text()
		fmt.Println(adapter.StringClear(data))
		countryInfo := selection.Find("a div.fi-mu__m").Text()
		fmt.Println(adapter.StringClear(countryInfo))
	})
	return "", nil
}
