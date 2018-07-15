package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type Team struct {
	gorm.Model
	Flag string `gorm:"type:varchar(128); not null; column:flag_address"`
	Name string `gorm:"type:varchar(64); not null; column:team_name"`
}

type TeamSerializer struct {
	ID       uint       `json:"id"`
	CreateAt time.Time  `json:"create_at"`
	UpdateAt time.Time  `json:"update_at"`
	DeleteAt *time.Time `json:"delete_at"`
	Flag     string     `json:"flag"`
	Name     string     `json:"name"`
}

func (t *Team) Serializer() TeamSerializer {
	return TeamSerializer{
		ID:       t.ID,
		CreateAt: t.CreatedAt,
		UpdateAt: t.CreatedAt,
		DeleteAt: t.DeletedAt,
		Flag:     t.Flag,
		Name:     t.Name,
	}
}
