package controllers

import (
	"fmt"
	"time"
	"errors"
	"strconv"
	"net/http"
	"encoding/json"
	"io/ioutil"
	"myapi/models"
	"github.com/astaxie/beego"
	"myapi/utils"
)

// Operations about Users
type UserController struct {
	beego.Controller
}

type wxAuth struct {
	Openid string `json:"openid"`
	Session_key string `json:"session_key"`
	Expires_in int	`json:"expires_in"`
	Unionid string	`json:"unionid"`
}

type wxAuthData struct {
	Token	string `json:"token"`
	Uid	string `json:"uid"`
	Roleid	int `json:"roleid"`
}

type wxAuthResp struct {
	Code int `json:"code"`
	Data wxAuthData `json:"data"`
}

// @router / [post]
func (u *UserController) Post() {
	u.Data["json"] = map[string]string{"uid": "999"}
	u.ServeJSON()
}

// @Title GetAll
// @Description get all Users
// @Success 200 {object} models.User
// @router / [get]
func (u *UserController) GetAll() {
	token := u.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if token == ""{
			err = errors.New("Parameter errors")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}

		objs, err1 := models.GetAllUsers()
		if err1 != nil {
			err = err1
			break
	 	}

		ret["code"] = 0
		ret["data"] = objs
		ret["msg"] = ""

		break
	}
	
	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	u.Data["json"] = ret
	u.ServeJSON()
}

// @Title Get
// @Description get user by uid
// @Param	uid		path 	string	true		"The key for staticblock"
// @Success 200 {object} models.User
// @Failure 403 :uid is empty
// @router /:uid [get]
func (u *UserController) Get() {
	token := u.GetString("token")
	uid := u.GetString(":uid")
	ret := make(map[string]interface{})
	var err error
	for {
		if uid == "" || token == ""{
			err = errors.New("Parameter errors")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}
		
		obj, err1 := models.GetUser(uid)
		if err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = obj
		ret["msg"] = ""

		break
	}

	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}	

	u.Data["json"] = ret	
	u.ServeJSON()
}

// @router /search [get]
func (u *UserController) SearchByPhone() {
	phone := u.GetString("key")
	token := u.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if phone == "" || token == ""{
			err = errors.New("Parameter errors")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}

		objs, err1 := models.GetUsersByMobile(phone)
		if err1 != nil {
			err = err1
			break
		}
		b, err1 := json.Marshal(&objs)
		if err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = string(b)
		ret["msg"] = ""

		break
	}
	
	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}
	u.Data["json"] = ret	
	u.ServeJSON()
}

// @Title Delete
// @Description delete the user
// @Param	uid		path 	string	true		"The uid you want to delete"
// @Success 200 {string} delete success!
// @Failure 403 uid is empty
// @router /:uid [delete]
func (u *UserController) Delete() {
	u.Data["json"] = "delete success!"
	u.ServeJSON()
}

// @Title Login
// @Description Logs user into the system
// @Param	username		query 	string	true		"The username for login"
// @Param	password		query 	string	true		"The password for login"
// @Success 200 {string} login success
// @Failure 403 user not exist
// @router /login [get]
func (u *UserController) Login() {
	code := u.GetString("code")
	fmt.Printf("Login Parameter is %s\n",code) 
	url := fmt.Sprintf("https://api.weixin.qq.com/sns/jscode2session?appid=wx23184fba2182f49f&secret=6b847aff3b7aac7475a368d472dd2971&js_code=%s&grant_type=authorization_code", code)
	fmt.Printf("request url:%s\n", url)
	resp, err := http.Get(url)
	if err != nil || resp.StatusCode != http.StatusOK {
		u.Data["json"] = err.Error()
		u.ServeJSON()
		return
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		u.Data["json"] = err.Error()
		u.ServeJSON()
		return
	}
	var wxinfo = wxAuth{}
	err = json.Unmarshal(body, &wxinfo)
	if err != nil {
		u.Data["json"] = err.Error()
		u.ServeJSON()
		return
	}

	fmt.Printf("Response is %s\n", body)
	fmt.Printf("openid is :%s  session_key:%s in:%d uid:%s", wxinfo.Openid, wxinfo.Session_key, wxinfo.Expires_in, wxinfo.Unionid)
	et := utils.EasyToken{
		Openid:		wxinfo.Openid,
		Unionid:	wxinfo.Unionid,
		SessionKey:	wxinfo.Session_key,
		ExpiresAt:  time.Now().Unix() + 2 * 3600,
	}
	token, err := et.GetToken()
	if token == "" || err != nil {
		u.Data["json"] = "user token error"
		u.ServeJSON()
		return
	}
	user, err := models.GetUserByOpenid(wxinfo.Openid)
	if err != nil {
		user = &models.User{}
		user.Role_id = 1
	}
	fmt.Println("Get User is:", user)
	user.Wxopenid = wxinfo.Openid
	user.Wxsessionkey = wxinfo.Session_key
	user.Wxunionid = wxinfo.Unionid
	user.Token = token
	if user.Id > 0 {	
		err = models.UpdateUser(user)
	} else {
		err = models.AddUser(user)
	}
	if err != nil {
		u.Data["json"] = map[string]interface{}{"code":1,"data":"", "msg":"update user failed"}
		u.ServeJSON()
		return
	}
	wxResp := wxAuthResp{}
	wxResp.Code = 0
	wxResp.Data.Token = token
	wxResp.Data.Roleid = user.Role_id
	//wxResp.Data.Uid = "uuuuuuuiiiiiiiddddddd"
	u.Data["json"] = wxResp
	u.ServeJSON()
}

// @router /checktoken [get]
func (u *UserController) CheckToken() {
	token := u.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if  token == ""{
			err = errors.New("Parameter errors")
			break
		}
		
		fmt.Printf("CheckToken Parameter is %s\n", token) 
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}

		ret["code"] = 0
		ret["data"] = token
		ret["msg"] = ""

		break
	}	
	
	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	u.Data["json"] = ret
	u.ServeJSON()
}

// @router /updateinfo [get]
func (u *UserController) UpdateInfo() {
	token := u.GetString("token")
	iv := u.GetString("iv")
	nick := u.GetString("nick")
	ava := u.GetString("ava")
	encryptedData := u.GetString("encryptedData")

	ret := make(map[string]interface{})
	var err error
	for {
		if iv == "" || nick == "" || ava == "" || encryptedData == "" || token == "" {
			err = errors.New("Parameter errors")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}
		 
		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}

		user.Nickname = nick
		user.Avatar = ava
		if err1 := models.UpdateUser(user); err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = user
		ret["msg"] = ""

		break
	}

	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	
	u.Data["json"] = ret
	u.ServeJSON()
}

// @router /updaterole [get]
func (u *UserController) UpdateRole() {
	token := u.GetString("token")
	rid := u.GetString("rid")

	ret := make(map[string]interface{})
	var err error
	for {
		if rid == "" || token == "" {
			err = errors.New("Parameter errors")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}
		 
		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}

		vrid, err1 := strconv.Atoi(rid)
		if err1 != nil {
			err = err1
		}

		user.Role_id = vrid
		if err1 := models.UpdateUser(user); err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = user
		ret["msg"] = ""

		break
	}

	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	
	u.Data["json"] = ret
	u.ServeJSON()
}
// @router /save [get]
func (u *UserController) Save() {
	token := u.GetString("token")
	realname := u.GetString("realname")
	nickname := u.GetString("nickname")
	cellphone := u.GetString("cellphone")
	roleid := u.GetString("roleid")

	ret := make(map[string]interface{})
	var err error
	for {
		if realname == "" || nickname == "" || cellphone == "" || roleid == "" || token == "" {
			err = errors.New("Parameter errors")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}
		 
		rid, err1 := strconv.Atoi(roleid)
		if err1 != nil {
			err = err1
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}

		user.Realname = realname
		user.Nickname = nickname
		user.Mobile = cellphone
		user.Role_id = rid
	
		if err1 := models.UpdateUser(user); err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = ""
		ret["msg"] = ""
		
		break
	}

	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	u.Data["json"] = ret
	u.ServeJSON()
}

// @router /test [get]
func (u *UserController) TestServer() {
	u.Data["json"] = "Server is ok."
	u.ServeJSON()
}

// @router /logout [get]
func (u *UserController) Logout() {
	u.Data["json"] = "Logout success."
	u.ServeJSON()
}
