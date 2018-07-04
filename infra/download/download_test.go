package download

import (
	"fmt"
	"testing"
)

func TestDownloader(t *testing.T) {
	tests := []struct {
		url string
	}{
		{
			url: "https://www.fifa.com/worldcup/matches/?#groupphase",
		},
	}

	for _, test := range tests {
		doc, err := Downloader(test.url)
		newDoc, _ := doc.Html()
		fmt.Println(newDoc, err)
	}
}

func TestDownloaderBySelenium(t *testing.T) {
	tests := []struct {
		url string
	}{
		{
			url: "http://2018.sina.com.cn/schedule/group.shtml",
		},
	}

	for _, test := range tests {
		fmt.Println(DownloaderBySelenium(test.url))
	}
}
