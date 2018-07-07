package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type WorldCupArchive struct {
	gorm.Model
	URL         string `gorm:"type: varchar(128); not null; column: world_cup_url"`
	Name        string `gorm:"type: varchar(32); not null; column: country_name"`
	Winner      string `gorm:"type: varchar(32); not null; column: winner_country"`
	RunnersUp   string `gorm:"type: varChar(32); not null; column: runners_up_name"`
	Third       string `gorm:"type: varchar(32); not null; column: third_name"`
	Fourth      string `gorm:"type: varchar(32); not null; column: fourth_name"`
	FinalResult string `gorm:"type: varchar(12); not null; column: final_result"`
	Year        int    `gorm:"type: integer; not null; column: age"`
}

type WorldCupArchiveSerializer struct {
	ID          uint       `json:"id"`
	CreateAt    time.Time  `json:"create_at"`
	UpdateAt    time.Time  `json:"update_at"`
	DeleteAt    *time.Time `json:"delete_at"`
	URL         string     `json:"url"`
	Name        string     `json:"name"`
	Winner      string     `json:"winner"`
	RunnersUp   string     `json:"runners_up"`
	Third       string     `json:"third_name"`
	Fourth      string     `json:"fourth_name"`
	FinalResult string     `json:"final_result"`
	Year        int        `json:"year"`
}

func (w *WorldCupArchive) Serializer() WorldCupArchiveSerializer {
	return WorldCupArchiveSerializer{
		ID:          w.ID,
		CreateAt:    w.CreatedAt,
		UpdateAt:    w.UpdatedAt,
		DeleteAt:    w.DeletedAt,
		URL:         w.URL,
		Name:        w.Name,
		Winner:      w.Winner,
		RunnersUp:   w.RunnersUp,
		Third:       w.Third,
		Fourth:      w.Fourth,
		FinalResult: w.FinalResult,
		Year:        w.Year,
	}
}
