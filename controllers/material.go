package controllers

import (
	"time"
	"fmt"
	"errors"
	"strconv"
	"encoding/json"
	 "myapi/models"
	"github.com/astaxie/beego"

	"myapi/utils"
)

// Operations about Material
type MaterialController struct {
	beego.Controller
}


// @Title CreateOrder
// @Description create orders
// @Param	body		body 	models.Order	true		"body for user content"
// @Success 200 {int} models.Order.Id
// @Failure 403 body is empty
// @router /getall [get]
func (this *MaterialController) GetAll() {
	token := this.GetString("token")
	supplierid := this.GetString("supplierid")
	var err error
	ret := make(map[string]interface{})
	for {
		if token == "" {
			err = errors.New("parameter error.")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error.")
			break
		}
		
		var vid int = 0
		if supplierid != "" {
			vid1, err1 := strconv.Atoi(supplierid)
			if err1 != nil {
				err = err1
				break
			}
			vid = vid1
		}
			
		if vid <=  0 {
			user,err1 := models.GetUserByToken(token)
			if err1 != nil {
				err = err1
				break
			}
			vid = user.Id
		}

		objs, err1 := models.GetAllMaterials(vid)
		if err1 != nil {
			err = err1
			fmt.Println("*******", err.Error())
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

	this.Data["json"] = ret	
	this.ServeJSON()
}

// @router /search/:cond [get]
func (this *MaterialController) Search() {
	cond := this.GetString(":cond")
	var owner int = 1
	objs, err := models.GetMaterialsByNameOrQuickcode(owner, cond)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = objs
	}

	this.ServeJSON()
}

// @router /add [post]
func (this *MaterialController) Add() {
	token := this.GetString("token")
	var err error
	ret := make(map[string]interface{})

	for {
		if token == "" {
			err = errors.New("parameter error")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}
		
		var obj models.Material
		if err1 := json.Unmarshal(this.Ctx.Input.RequestBody, &obj); err1 != nil {
			err = err1
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}
	
		obj.Owner_id = user.Id
		if qc, err1 := utils.Unicode2PinYin(obj.Name); err1 != nil {
			err = err1
			break
		} else {
			obj.Quickcode = qc
		}

		_, err1 = models.AddMaterial(&obj)
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

	this.Data["json"] = ret
	this.ServeJSON()
}

// @router /save [post]
func (this *MaterialController) Save() {
	token := this.GetString("token")
	ownerid := this.GetString("supplierid")
	var err error
	ret := make(map[string]interface{})
	for {
		if token == "" {
			err = errors.New("parameter error")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}
		
		var obj models.Material
		if err1 := json.Unmarshal(this.Ctx.Input.RequestBody, &obj); err1 != nil {
			err = err1
			break
		}

		if ownerid == "" {
			user, err1 := models.GetUserByToken(token)
			if err1 != nil {
				err = err1
				break
			}

			obj.Owner_id = user.Id

		} else {
			vid, err1 := strconv.Atoi(ownerid)
			if err1 != nil {
				err = err1
				break
			}

			obj.Owner_id = vid
		}
	
		obj.Status = models.MODEL_MATERIAL_STATUS_ON_SHELF
		if qc, err1 := utils.Unicode2PinYin(obj.Name); err1 != nil {
			err = err1
			break
		} else {
			obj.Quickcode = qc
		}

		if obj.Id <= 0 {
			if _, err1 := models.AddMaterial(&obj); err1 != nil {
				err = err1
				break
			}
		} else {
			if err1 := models.UpdateMaterial(&obj); err1 != nil {
				err = err1
				break
			}
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
		
	this.Data["json"] = ret
	this.ServeJSON()
}

// @router /update [get]
func (this *MaterialController) Update() {
	var obj models.Material
	obj.Id = 4
	obj.Owner_id = 1
	obj.Type_id = 2
	obj.Name = "rangd"
	obj.Quickcode, _ = utils.Unicode2PinYin(obj.Name)
	obj.Price = 2.5
	obj.Unit = "千克"
	obj.Status = models.MODEL_MATERIAL_STATUS_ON_SHELF
	obj.Create_time = time.Now().Unix()
	obj.Update_time = time.Now().Unix()

	err := models.UpdateMaterial(&obj)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = &obj 
	}
	this.ServeJSON()
}

// @router /delete [get]
func (this *MaterialController) Delete() {
	id := this.GetString("id")
	token := this.GetString("token")
	var err error
	ret := make(map[string]interface{})
	
	for {
		if id == "" || token == "" {
			err = errors.New("parameter error")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		vid, err1 := strconv.Atoi(id)
		if err1 != nil {
			err = err1
			break
		}
	
		var obj models.Material
		obj.Id = vid
		if err1 := models.DeleteMaterial(&obj); err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = ""
		ret["msg"] = "success"

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
