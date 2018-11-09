package controllers

import (
	"errors"
	"fmt"
	"time"
	"strconv"
	"encoding/json"
	 "myapi/models"
	"github.com/astaxie/beego"
	
	"myapi/utils"
)

// Operations about Orders
type OrderController struct {
	beego.Controller
}


// @Title CreateOrder
// @Description create orders
// @Param	body		body 	models.Order	true		"body for user content"
// @Success 200 {int} models.Order.Id
// @Failure 403 body is empty
// @router /get [get]
func (this *OrderController) GetByDay() {
	t := this.GetString("timestamp")
	token := this.GetString("token")
	var err error
	var ret = make(map[string]interface{})
	for {
		if t == "" || token == "" {
			err = errors.New("parameter error")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}
		
		//supplier
		if user.Role_id == 1 {
			orders, err1 := models.GetOrdersBySupplierWhenDate(user.Id, t)
			if err1 != nil {
				err = err1
				break
			}
			ret["data"] = orders
		}else {
			orders, err1 := models.GetOrdersByBuyerWhenDate(user.Id, t)
			if err1 != nil {
				err = err1
				break
			}
			ret["data"] = orders
		}
		
		ret["code"] = 0
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

// @router /get/:timebegin/:timeend [get]
func (this *OrderController) GetByDayRange() {
	tBegin := this.GetString(":timebegin")
	tEnd := this.GetString(":timeend")
	orders, err := models.GetOrdersByDateRange(tBegin, tEnd)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = orders //map[string]string{"uid": "999"}
	}

	this.ServeJSON()
}

// @router /addorder [get]
func (this *OrderController) AddOrder() {
	var odrs models.OrderAndDetails
	odrs.Create_time = 12345
	odrs.Update_time = 67890
	odrs.Creater_id = 2
	odrs.Supplier_id = 3

	var obj models.OrderDetail
	obj.Order_id = 0 
	obj.Operator_id = 2
	obj.Material_id = 2
	obj.Name = "bbb"

	odrs.Details = append(odrs.Details, obj)

	obj.Order_id = 0 
	obj.Operator_id = 4
	obj.Material_id = 5
	obj.Name = "eeee"

	odrs.Details = append(odrs.Details, obj)

	_, err := models.AddOrderAndDetails(&odrs)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = &odrs 
	}
	this.ServeJSON()
}

// @router /update [post]
func (this *OrderController) Update() {
	token := this.GetString("token")
	var obj models.Order
	var err error
	ret := make(map[string]interface{})
	for {
		if token == "" {
			err = errors.New("paramter error")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		if err1 := json.Unmarshal(this.Ctx.Input.RequestBody, &obj); err1 != nil {
			err = err1
			break
		}

		user, err1 := models.GetUserByToken(token)
		if err1 != nil {
			err = err1
			break
		}

		obj.Creater_id = user.Id
		obj.Sn = fmt.Sprintf("SN%05dT%d", user.Id, time.Now().Unix())
		obj.Cname = user.Nickname + " " + user.Realname
		if obj.Id <= 0 {	
			if _, err1 := models.AddOrder(&obj); err1 != nil {
				err = err1
				break
			}
		} else {
			if err1 := models.UpdateOrder(&obj); err1 != nil {
				err = err1
				break
			}
		}

		b, err1 := json.Marshal(&obj)
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

// @router /updateall [get]
func (this *OrderController) UpdateOrderAndDetails() {
	var odrs models.OrderAndDetails
	odrs.Id = 4
	odrs.Create_time = 4444
	odrs.Update_time = 44444
	odrs.Creater_id = 4
	odrs.Supplier_id = 4444

	var obj models.OrderDetail
	obj.Id = 6
	obj.Order_id = 5 
	obj.Operator_id = 4
	obj.Material_id = 4
	obj.Name = "4444"

	odrs.Details = append(odrs.Details, obj)

	obj.Id = 7
	obj.Order_id = 5 
	obj.Operator_id = 4
	obj.Material_id = 4
	obj.Name = "44444444"

	odrs.Details = append(odrs.Details, obj)

	err := models.UpdateOrderAndDetails(&odrs)
	if err != nil {
		this.Data["json"] = map[string]string{"error":err.Error()}
	} else {
		this.Data["json"] = &odrs 
	}
	this.ServeJSON()
}

// @router /delete [get]
func (this *OrderController) DeleteOne() {
	id := this.GetString("id")
	token := this.GetString("token")
	var err error
	var ret = make(map[string]interface{})

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

		err1 = models.DeleteOrderAndDetails(vid)
		if err1 != nil {
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

	this.Data["json"] = ret
	this.ServeJSON()
}

// @router /summarybuyer [get]
func (this *OrderController) SummaryBuyer() {
	t := this.GetString("timestamp")
	token := this.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if t == "" || token == "" {
			err = errors.New("parameter error")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		objs, err1 := models.GetOrdersSummaryBuyer(t)
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

// @router /summarydetail [get]
func (this *OrderController) SummaryDetail() {
	t := this.GetString("timestamp")
	token := this.GetString("token")
	id := this.GetString("id")
	ret := make(map[string]interface{})
	var err error
	for {
		if t == "" || token == "" || id == "" {
			err = errors.New("parameter error")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}

		objs, err1 := models.GetOrdersSummaryDetail(id, t)
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

// @router /printaddr [get]
func (this *OrderController) GetPrintAddress() {
	t := this.GetString("timestamp")
	token := this.GetString("token")
	id := this.GetString("id")
	ret := make(map[string]interface{})
	var err error
	for {
		if t == "" || token == "" || id == "" {
			err = errors.New("parameter error")
			break
		}

		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("token error")
			break
		}
		
		et := utils.EasyToken{
			Openid:		id,
			Unionid:	"",
			SessionKey:	t,
			ExpiresAt:  	time.Now().Unix() + 5 * 60,
		}
		addr, err1 := et.GetToken()
		if addr == "" || err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = "https://dvdserver.digitcoffee.com/v1/order/print?token=" + addr
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

// @router /print [get]
func (u *OrderController) Print() {
	token := u.GetString("token")
	ret := make(map[string]interface{})
	var err error
	for {
		if  token == ""{
			err = errors.New("Parameter errors")
			break
		}
		
		if ok := utils.IsTokenOk(token); !ok {
			err = errors.New("Token error")
			break
		}

		et := utils.EasyToken{}
		id, err1 := et.GetTokenKey(token, "Openid")
		if err1 != nil {
			err = err1
			break
		}
		t, err1 := et.GetTokenKey(token, "SessionKey")
		if err1 != nil {
			err = err1
			break
		}

		objs, err1 := models.GetOrdersSummaryDetail(id, t)
		if err1 != nil {
			err = err1
			break
		}

		_, err1 = json.Marshal(&objs)
		if err1 != nil {
			err = err1
			break
		}

		ret["code"] = 0
		ret["data"] = ""//string(b)
		ret["msg"] = "暂时不支持打印，敬请期待......"

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
