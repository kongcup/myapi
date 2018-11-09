package utils

import (
	"time"
	"strconv"
	"errors"
)

func GetDayRangeBySeconds(t string) (tBegin, tEnd int, err error) {
	if t == ""{
		return 0, 0, errors.New("Parameter is empty")
	}
	
	var tInt int
	if tInt, err = strconv.Atoi(t); err != nil {
		return 0, 0, errors.New("Parameter error")
	}
	tTime := time.Unix(int64(tInt), 0)
	y,m,d := tTime.Date()
	tTime = time.Date(y,m,d,0,0,0,0,tTime.Location())
	tBegin = int(tTime.Unix())
	tEnd = tBegin + 24 * 3600 - 1
	return
}
