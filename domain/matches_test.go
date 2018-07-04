package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"testing"

	"github.com/PuerkitoBio/goquery"
)

func TestMatchesGroupPhase(t *testing.T) {
	docTemp, _ := download.Downloader(config.MatchesURLGroupPhase)
	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: docTemp,
		},
	}
	for _, test := range tests {
		MatchesGroupPhase(test.doc)
	}
}
