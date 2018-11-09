package utils

import (
	"errors"
	"fmt"
	"strings"
	"github.com/dgrijalva/jwt-go"
	"log"
)

type EasyToken struct {
	Openid		string
	Unionid		string
	SessionKey	string
	ExpiresAt	int64
}

var (
	verifyKey  string = "bGciOi1NiIsIn6IkpeyJR5cCIJhXVCJ9IUzI"
	ErrAbsent  = "token absent"  // 令牌不存在
	ErrInvalid = "token invalid" // 令牌无效
	ErrExpired = "token expired" // 令牌过期
	ErrOther   = "other error"   // 其他错误
)


func (e EasyToken) GetToken() (string, error) {
	token := jwt.New(jwt.SigningMethodHS256)
	claims := make(jwt.MapClaims)
	// Set claims
	claims["openid"] = e.Openid
	claims["unionid"] = e.Unionid
	claims["sessionkey"] = e.SessionKey
	claims["expiresat"] = e.ExpiresAt

	token.Claims = claims
	tokenString, err := token.SignedString([]byte(verifyKey))
	if err != nil {
		log.Println(err)
	}
	return tokenString, err
}

func (e EasyToken) ValidateToken(tokenString string) (bool, error) {
	if tokenString == "" {
		return false, errors.New(ErrAbsent)
	}
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		return []byte(verifyKey), nil
	})
	if token == nil {
		return false, errors.New(ErrInvalid)
	}
	if token.Valid {
		return true, nil
	} else if ve, ok := err.(*jwt.ValidationError); ok {
		if ve.Errors&jwt.ValidationErrorMalformed != 0 {
			return false, errors.New(ErrInvalid)
		} else if ve.Errors&(jwt.ValidationErrorExpired|jwt.ValidationErrorNotValidYet) != 0 {
			return false, errors.New(ErrExpired)
		} else {
			return false, errors.New(ErrOther)
		}
	} else {
		return false, errors.New(ErrOther)
	}
}

func parseToken(tokenString string, key string) (interface{}, bool){
    	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
        	if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
            		return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
        	}
       		return []byte(key), nil
   	})
	if err != nil {
		return nil, false
	}
    	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
        	return claims, true
    	} else {
        	return nil, false
    	}
}

func (e EasyToken) GetTokenKey(tokenString, key string) (string, error) {
	if tokenString == "" {
		return "", errors.New(ErrAbsent)
	}
	claims, ok := parseToken(tokenString, verifyKey)
	if ok {
		key = strings.ToLower(key)
		switch tmp := claims.(jwt.MapClaims)[key].(type) {
		case string:
			return tmp, nil
		default:
			return "", errors.New(fmt.Sprintf("type:%v is wrong.", tmp))
		}
    	}else {
		return "", errors.New(ErrAbsent)
    	}
}

func IsTokenOk(token string) bool {
	et := EasyToken{}
	ok, _ := et.ValidateToken(token)
	return ok
}
