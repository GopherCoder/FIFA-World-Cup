package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type WorldCupArchive struct {
	gorm.Model
	URL         string `gorm:"type:varchar(128);column:world_cup_url"`
	Name        string `gorm:"type:varchar(128);column:country_name"`
	Year        string `gorm:"type:varchar(64);column:year"`
	Winner      string `gorm:"type:varchar(64);column:winner_country"`
	RunnersUp   string `gorm:"type:varChar(64);column:runners_up_name"`
	Third       string `gorm:"type:varchar(64);column:third_name"`
	Fourth      string `gorm:"type:varchar(64);column:fourth_name"`
	FinalResult string `gorm:"type:varchar(128);column:final_result"`
	Title       string `gorm:"type:varchar(64);column:title"`
}

type WorldCupArchiveSerializer struct {
	ID          uint       `json:"id"`
	CreateAt    time.Time  `json:"create_at"`
	UpdateAt    time.Time  `json:"update_at"`
	DeleteAt    *time.Time `json:"delete_at"`
	URL         string     `json:"url"`
	Name        string     `json:"name"`
	Year        string     `json:"year"`
	Winner      string     `json:"winner"`
	RunnersUp   string     `json:"runners_up"`
	Third       string     `json:"third_name"`
	Fourth      string     `json:"fourth_name"`
	FinalResult string     `json:"final_result"`
	Title       string     `json:"title"`
}

func (w *WorldCupArchive) Serializer() WorldCupArchiveSerializer {
	return WorldCupArchiveSerializer{
		ID:          w.ID,
		CreateAt:    w.CreatedAt,
		UpdateAt:    w.UpdatedAt,
		DeleteAt:    w.DeletedAt,
		URL:         w.URL,
		Name:        w.Name,
		Year:        w.Year,
		Winner:      w.Winner,
		RunnersUp:   w.RunnersUp,
		Third:       w.Third,
		Fourth:      w.Fourth,
		FinalResult: w.FinalResult,
		Title:       w.Title,
	}
}
