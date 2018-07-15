package domain

import (
	"FIFA-World-Cup/infra/adapter"
	"FIFA-World-Cup/infra/init"
	"FIFA-World-Cup/infra/model"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"strconv"
)

func Players(doc *goquery.Document) error {
	count := 0
	doc.Find("div.row").Find("div.fi-p--hub").Find("div a div.fi-p").Each(func(i int, selection *goquery.Selection) {
		textOne := selection.Find("div.fi-p__picture").Find("div.fi-p__jerseyNum ").Find("span")

		textTwo := selection.Find("div.fi-p__wrapper-text")

		number := textOne.Text()
		numberInt, _ := strconv.Atoi(number)
		imageUrl, ok := selection.Find("div").Eq(0).Find("svg image").Attr("href")
		if ok != true {
			return
		}
		name := adapter.StringClear(textTwo.Find("div.fi-p__name").Text())
		country := adapter.StringClear(textTwo.Find("div.fi-p__country").Text())
		role := adapter.StringClear(textTwo.Find("div.fi-p__role").Text())

		onePlayer := model.Player{
			Number:   numberInt,
			ImageURL: imageUrl,
			Name:     name,
			Country:  country,
			Role:     role,
		}
		count++
		fmt.Println(onePlayer)
		// push data into db
		initiator.POSTGRES.Save(&onePlayer)
	})
	fmt.Println(count)

	return nil
}

func Coaches(doc *goquery.Document) error {
	count := 0
	doc.Find("div.row div.fi-p--hub div a div.fi-p").Each(func(i int, selection *goquery.Selection) {
		imageUrl, ok := selection.Find("div").Eq(0).Find("svg image").Attr("href")
		if ok != true {
			return
		}
		name := adapter.StringClear(selection.Find("div.fi-p__wrapper-text").Find("div.fi-p__name").Text())
		country := adapter.StringClear(selection.Find("div.fi-p__wrapper-text").Find("div.fi-p__country").Text())

		oneCoach := model.Coach{
			ImageURL:    imageUrl,
			Name:        name,
			CountryName: country,
		}
		count++
		fmt.Println(oneCoach)
		// push data into db
		initiator.POSTGRES.Save(&oneCoach)

	})
	fmt.Println(count)
	return nil
}
