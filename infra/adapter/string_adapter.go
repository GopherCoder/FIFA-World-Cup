package adapter

import "strings"

func StringClear(str string) string {
	newStr := strings.TrimSpace(str)
	newReplacer := strings.NewReplacer("\n", "")
	return newReplacer.Replace(newStr)
}
