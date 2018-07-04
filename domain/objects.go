package domain

type MatchesInfo struct {
	Date         string
	GroupName    string
	Location     string
	CountryLeft  string
	CountryRight string
	Score        string
	MatchNumber  string
}

type TeamsInfo struct {
	Flag string
	Name string
}

type GroupInfo struct {
	GroupName   string
	TeamName    string
	MatchPlayed string
	WinNumber   string
	Draw        string
	Lost        string
	GoalFor     string
	GoalAgainst string
	DiffGoal    string
	Points      string
}

type PlayersInfo struct {
	Number   string
	Name     string
	Country  string
	Role     string
	ImageURL string
}

type CoachesInfo struct {
	CountryName string
	Name        string
	ImageURL    string
}

type GoalsScorersInfo struct {
	Rank                        string
	Player                      string
	GoalsScored                 string
	Assists                     string
	MinutesPlayed               string
	MatchesPlayed               string
	PenaltiesScored             string
	GoalsScoredWithTheLeftFoot  string
	GoalsScoredWithTheRightFoot string
	HeadedGoals                 string
}

type TopSavesInfo struct {
	Rank          string
	Player        string
	MatchesPlayed string
	MinutesPlayed string
	Saves         string
	SaveRate      string
}

type ShotsInfo struct {
	Rank              string
	Player            string
	MatchesPlayed     string
	MinutesPlayed     string
	Shots             string
	AttemptsOnTarget  string
	AttemptsOffTarget string
	ShotsBlocked      string
}

type DisciplinaryInfo struct {
	Rank                string
	Player              string
	MatchesPlayed       string
	YellowCards         string
	SecondYellowCards   string
	RedCards            string
	FoulsCommitted      string
	FoulsCausingPenalty string
}

type AwardsManOfTheMatchInfo struct {
	Name      string
	Country   string
	Date      string
	CountryVs string
	Score     string
}

type WorldCupArchiveInfo struct {
	URL         string
	Name        string
	Winner      string
	RunnersUp   string
	Third       string
	Fourth      string
	FinalResult string
	Age         string
}
