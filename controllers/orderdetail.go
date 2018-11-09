package controllers

import (
	"strconv"
	"errors"
	"encoding/json"
	"myapi/models"
	"github.com/astaxie/beego"

	"myapi/utils"
)

// Operations about OrderDetail
type OrderDetailController struct {
	beego.Controller
}

// @Title CreateOrder
// @Description create orders
// @Param	body		body 	models.Order	true		"body for user content"
// @Success 200 {int} models.Order.Id
// @Failure 403 body is empty
// @router /get [get]
func (this *OrderDetailController) GetByOrderID() {
	t := this.GetString("orderid")
	token := this.GetString("token")
	var err error
	ret := make(map[string]interface{})
	
	for {
		if t == "" || token == "" {
			err = errors.New("parameter error")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

	    	id, err1 := strconv.Atoi(t)
		if err1 != nil {
			err = err1
			break
		}
		
		objs, err1 := models.GetOrderDetailByOrderID(id)
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

	this.Data["json"] = ret
	this.ServeJSON()
}

// @router /add [get]
func (this *OrderDetailController) AddOne() {
	var obj models.OrderDetail
	obj.Order_id = 1
	obj.Operator_id = 1
	obj.Material_id = 1
	obj.Name = "aaa"
	_, err := models.AddOrderDetail(&obj)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = obj 
	}

	this.ServeJSON()
}

// @router /update [post]
func (this *OrderDetailController) Update() {
	token := this.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if token == "" {
			err = errors.New("parameter error")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		var objs []models.OrderDetail
		if err1 := json.Unmarshal(this.Ctx.Input.RequestBody, &objs); err1 != nil {
			err = err1
			break
		}

		retobjs, err1 := models.UpdateOrderDetails(&objs)
		if err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = retobjs
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

// @router /delete [get]
func (this *OrderDetailController) DeleteOne() {
	id := this.GetString("id")
    	intid, err := strconv.Atoi(id)
	if err != nil {
		this.Data["json"] = map[string]interface{}{"code":1,"data":"", "msg":err.Error()}
		this.ServeJSON()
		return
	}
	var obj models.OrderDetail
	obj.Id = intid
	err = models.DeleteOrderDetail(&obj)
	if err != nil {
		this.Data["json"] = map[string]interface{}{"code":1,"data":"", "msg":err.Error()}
	} else {
		this.Data["json"] = map[string]interface{}{"code":0,"data":"", "msg":""}
	}

	this.ServeJSON()
}
