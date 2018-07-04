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
