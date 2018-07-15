package domain

import (
	"FIFA-World-Cup/infra/config"
	"FIFA-World-Cup/infra/download"
	"github.com/PuerkitoBio/goquery"
	"testing"
)

func TestTeamsTopGoals(t *testing.T) {

	doc, _ := download.Downloader(config.StatisticsTeamGoalURL)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		TeamsTopGoals(test.doc)
	}
}

func TestTeamsShots(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsTeamShots)
	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		TeamsShots(test.doc)
	}
}

func TestTeamsDisciplinary(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsTeamDisciplinary)
	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		TeamsDisciplinary(test.doc)
	}
}

func TestPlayersGoalScored(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsPlayerGoalScoredURL)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		PlayersGoalScored(test.doc)
	}
}

func TestPlayersTopSaves(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsPlayerSaves)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}
	for _, test := range tests {
		PlayersTopSaves(test.doc)
	}
}

func TestPlayersShots(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsPlayerShots)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		PlayersShots(test.doc)
	}
}

func TestPlayersDisciplinary(t *testing.T) {
	doc, _ := download.Downloader(config.StatisticsPlayerDisciplinary)

	tests := []struct {
		doc *goquery.Document
	}{
		{
			doc: doc,
		},
	}

	for _, test := range tests {
		PlayersDisciplinary(test.doc)
	}
}
