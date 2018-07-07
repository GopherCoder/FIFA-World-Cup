package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type Award struct {
	gorm.Model
	AwardName string `gorm:"type: varchar(64); not null; column: award_name"`
	Year      int    `gorm:"type: integer; not null; column: year"`
	Name      string `gorm:"type: varchar(12); column: name"`
	Country   string `gorm:"type: varchar(12); column: country"`
	Score     int    `gorm:"type: integer; column: score"`
}

type AwardSerializer struct {
	ID        uint       `json:"id"`
	CreateAt  time.Time  `json:"create_at"`
	UpdateAt  time.Time  `json:"update_at"`
	DeleteAt  *time.Time `json:"delete_at"`
	AwardName string     `json:"award_name"`
	Year      int        `json:"year"`
	Name      string     `json:"name"`
	Country   string     `json:"country"`
	Score     int        `json:"score"`
}

func (a *Award) Serializer() AwardSerializer {
	return AwardSerializer{
		ID:        a.ID,
		CreateAt:  a.CreatedAt,
		UpdateAt:  a.UpdatedAt,
		DeleteAt:  a.DeletedAt,
		AwardName: a.AwardName,
		Year:      a.Year,
		Name:      a.Name,
		Country:   a.Country,
		Score:     a.Score,
	}
}
