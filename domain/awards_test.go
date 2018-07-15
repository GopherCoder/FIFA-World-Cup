package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"testing"
)

func TestAwards(t *testing.T) {
	doc, _ := download.Downloader(config.AwardsURL)
	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		Awards(test.doc)
	}
}

func TestRegexp(t *testing.T) {

	tests := []struct {
		value string
	}{
		{
			value: "2010: Thomas Muller (Germany ) 5 Goals",
		},
		{
			value: "1962: Florian Albert (Hungary), Valentin Ivanov (Soviet Union), Drazen Jerkovic (Yugoslavia), Leonel Sanchez (Chile), Vava (Brazil), Garrincha (Brazil) - All 4 Goal",
		},
		{
			value: "2010: Diego Forlan (Uruguay)",
		},
		{
			value: "2006: Gianluigi Buffon (ITA) *",
		},
	}

	for _, test := range tests {
		fmt.Println(test.value)
		//RegularAward(test.value)

	}
}
