package download

import (
	"FIFA-World-Cup/infra/config"
	"errors"
	"net/http"

	"fmt"

	"github.com/PuerkitoBio/goquery"
	"github.com/tebeka/selenium"
	"github.com/tebeka/selenium/chrome"
)

var (
	ErrDownloader      = errors.New("download html failed")
	ErrSeleniumService = errors.New("selenium service failed")
	ErrWebDriver       = errors.New("web driver failed")
	ErrWebDriverGet    = errors.New("web driver get url failed")
)

func Downloader(url string) (*goquery.Document, error) {
	request, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, ErrDownloader
	}

	request.Header.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36")
	client := http.DefaultClient

	response, err := client.Do(request)
	if err != nil {
		return nil, ErrDownloader
	}

	defer response.Body.Close()
	return goquery.NewDocumentFromReader(response.Body)
}

func DownloaderBySelenium(url string) (string, error) {
	caps := selenium.Capabilities{
		"browserName": "chrome",
	}

	imageCaps := map[string]interface{}{
		"profile.managed_default_content_settings.images": 2,
	}
	chromeCaps := chrome.Capabilities{
		Prefs: imageCaps,
		Path:  "",
		Args: []string{
			"--headless",
			"--no-sandbox",
			"--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/604.4.7 (KHTML, like Gecko) Version/11.0.2 Safari/604.4.7",
		},
	}
	caps.AddChrome(chromeCaps)

	service, err := selenium.NewChromeDriverService(
		config.ChromeDriverPath, 9515,
	)
	defer service.Stop()

	if err != nil {
		fmt.Println(ErrSeleniumService)
		return "", ErrSeleniumService
	}
	webDriver, err := selenium.NewRemote(caps, fmt.Sprintf("http://localhost:%d/wd/hub", 9515))

	if err != nil {
		fmt.Println(ErrWebDriver)
		return "", ErrWebDriver
	}

	err = webDriver.Get(url)

	if err != nil {
		fmt.Println(ErrWebDriverGet)
		return "", ErrWebDriverGet
	}
	return webDriver.PageSource()

}
