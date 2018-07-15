package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"github.com/PuerkitoBio/goquery"
	"testing"
)

func TestHistories(t *testing.T) {

	doc, _ := download.Downloader(config.HistoryURL)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		//fmt.Println(test.doc.Html())
		Histories(test.doc)
	}
}
