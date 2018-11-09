package utils

import (
	"fmt"
	"os"
	"io"
	"bufio"
	"strings"
)

const UNICODE_HANZI_START = 0x4E00 
const UNICODE_HANZI_END	= 0x9FA5

func Unicode2PinYin(uni string) (pinyin string, err error) {
	if uni == "" {
		return "", nil
	}

	//read unicode pinyin table
	f, err :=  os.Open("./conf/res/uni2pinyin.dat")
	if err != nil {
		return "", err
	}
	defer f.Close()

	rd := bufio.NewReader(f)

	pairs := make(map[string]string, 20435)
	for {

		line, err := rd.ReadString('\n')
		if err != nil  || io.EOF == err {
			break
		}
		line = strings.TrimSpace(line)
		if len(line) <= 0 {
			continue
		}
			
		if strings.HasPrefix(line, "#") {
			continue
		}

		strs := strings.Fields(line)
		if len(strs) > 1 {
			pairs[strs[0]] = strs[1]
		}
	}

	var ret string
	rs := []rune(uni)
	for _, v := range rs {
		if v < UNICODE_HANZI_START || v > UNICODE_HANZI_END {
			ret += fmt.Sprintf("%c", v)
			continue
		}
		tmp := fmt.Sprintf("%x", v)
		tmp = strings.ToUpper(tmp)
		if vs, ok := pairs[tmp]; ok {
			if len(vs) > 1 {
				ret += vs[:1]
			}
		}
	}
	
	ret = strings.ToUpper(ret)
	return ret, nil
}
/*
func main() {
	fmt.Println("start to convert")

	text := "中华人民共和国"

	fmt.Println(text)

	asc := strconv.QuoteToASCII(text)

	fmt.Println(asc)
	fmt.Println(Unicode2pinyin(text))


}
*/
