package model

type Award struct {
	ID        uint   `gorm:"primary_key;column:id"`
	AwardName string `gorm:"type:varchar(64);not null;column:award_name"`
	URL       string `gorm:"type:varchar(128);not null;column:url"`
	Info      string `gorm:"type:varchar(128);not null;column:info"`
}

type AwardSerializer struct {
	ID        uint   `json:"id"`
	AwardName string `json:"award_name"`
	Info      string `json:"info"`
	URL       string `json:"url"`
}

func (a *Award) Serializer() AwardSerializer {
	return AwardSerializer{
		ID:        a.ID,
		AwardName: a.AwardName,
		Info:      a.Info,
		URL:       a.URL,
	}
}
