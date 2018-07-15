package model

import (
	"github.com/jinzhu/gorm"
	"time"
)

type Player struct {
	gorm.Model
	Number   int    `gorm:"type: integer; not null; column:number"`
	Name     string `gorm:"type: varchar(64); not null; column:name"`
	Country  string `gorm:"type: varchar(64); not null; column:country"`
	Role     string `gorm:"type: varchar(64); not null; column:role"`
	ImageURL string `gorm:"type: varchar(128); not null; column:image_address"`
}

type PlaySerializer struct {
	ID       uint       `json:"id"`
	CreateAt time.Time  `json:"create_at"`
	UpdateAt time.Time  `json:"update_at"`
	DeleteAt *time.Time `json:"delete_at"`
	Number   int        `json:"number"`
	Name     string     `json:"name"`
	Country  string     `json:"country"`
	Role     string     `json:"role"`
	ImageURL string     `json:"image_address"`
}

func (p *Player) Serializer() PlaySerializer {
	return PlaySerializer{
		ID:       p.ID,
		CreateAt: p.CreatedAt,
		UpdateAt: p.UpdatedAt,
		DeleteAt: p.DeletedAt,
		Number:   p.Number,
		Name:     p.Name,
		Country:  p.Country,
		Role:     p.Role,
		ImageURL: p.ImageURL,
	}
}

type Coach struct {
	gorm.Model
	CountryName string `gorm:"type:varchar(64); not null; column:country_name"`
	Name        string `gorm:"type:varchar(64); not null; column:name"`
	ImageURL    string `gorm:"type:varchar(128); not null; column:image_address"`
}

type CoachSerializer struct {
	ID          uint       `json:"id"`
	CreateAt    time.Time  `json:"create_at"`
	UpdateAt    time.Time  `json:"update_at"`
	DeleteAt    *time.Time `json:"delete_at"`
	CountryName string     `json:"country_name"`
	Name        string     `json:"name"`
	ImageURL    string     `json:"image_url"`
}

func (c *Coach) Serializer() CoachSerializer {

	return CoachSerializer{
		ID:          c.ID,
		CreateAt:    c.CreatedAt,
		UpdateAt:    c.UpdatedAt,
		DeleteAt:    c.DeletedAt,
		CountryName: c.CountryName,
		Name:        c.Name,
		ImageURL:    c.ImageURL,
	}
}
