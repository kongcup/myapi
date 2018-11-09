package controllers

import (
	"strconv"
	"errors"
	"fmt"
	"encoding/json"
	 "myapi/models"
	"github.com/astaxie/beego"
)

// Operations about friends
type FriendController struct {
	beego.Controller
}

// @router /add [get]
func (this *FriendController) AddFriend() {
	var obj models.Friend
	fid := this.GetString("fid")
	cls := this.GetString("cls")
	token := this.GetString("token")
	fmt.Println("add fried token is:", token)
	ret := make(map[string]interface{})
	var err error
	for {
		if fid == "" || cls == "" {
			err = errors.New("Parameters error.")
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			break
		}
		
		obj.Master_id = user.Id 

		vfid, err1 := strconv.Atoi(fid)
		if err1 != nil {
			err = err1
			break
		} 
	
		obj.Friend_id = vfid

		vcls, err1 := strconv.Atoi(cls)
		if err1 != nil {
			err = err1
			break
		}
		
		obj.Class = int8(vcls)

		bExist, err1 := models.IsFriendExist(fmt.Sprintf("%d", obj.Master_id), fid, cls)
		if err1 != nil {
			err = err1
			break
		}

		if bExist {
			err = errors.New("请勿重复添加")
			break
		}

		_, err1 = models.AddFriend(&obj)
		if err1 != nil {
			err = err1
			break
		}
	
		b, err1 := json.Marshal(&obj)
		if err1 != nil {
			err = err1
			break
		}
		//add friend relation resvers
		obj2 := models.Friend{}
		obj2.Master_id = obj.Friend_id
		obj2.Friend_id = obj.Master_id
		if obj.Class == 1 {
			obj2.Class = 2
		} else {
			obj2.Class = 1
		}
		//no care result
		models.AddFriend(&obj2)

		ret["code"] = 0
		ret["data"] = string(b)
		ret["msg"] = "添加成功"
		
		break
	}

	if err != nil {
		ret["code"] = 1
		ret["data"] = ""
		ret["msg"] = err.Error()
	}

	this.Data["json"] = ret
	this.ServeJSON()
}

// @router /delete [get]
func (this *FriendController) DeleteOne() {
	id := this.GetString("id")
    	intid, err := strconv.Atoi(id)
	if err != nil {
		this.Data["json"] = map[string]interface{}{"code":1,"data":"", "msg":err.Error()}
		this.ServeJSON()
		return
	}
	err = models.DeleteFriend(intid)
	if err != nil {
		this.Data["json"] = map[string]interface{}{"code":1,"data":"", "msg":err.Error()}
	} else {
		this.Data["json"] = map[string]interface{}{"code":0,"data":"", "msg":""}
	}

	this.ServeJSON()
}

// @router /list [get]
func (this *FriendController) GetFriendsList() {
	//get mid through token
	cls := this.GetString("cls")
	token := this.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if cls == "" || token == "" {
			err = errors.New("Parameter error")
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}
		objs, err1 := models.GetFriendsByClass(fmt.Sprintf("%d", user.Id), cls)
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
	this.Data["json"] = ret
	this.ServeJSON()
}
