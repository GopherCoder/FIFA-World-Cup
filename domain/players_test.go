package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"testing"
)

func TestPlayers(t *testing.T) {

	doc, _ := download.Downloader(config.PlayersURLList)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		fmt.Println(doc.Html())
		Players(test.doc)
	}
}

func TestCoaches(t *testing.T) {
	doc, _ := download.Downloader(config.CoachesURL)
	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		Coaches(test.doc)
	}
}
