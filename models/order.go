package models

import (
	"fmt"
	"errors"
	"strconv"
	"time"
	"github.com/astaxie/beego/orm"

	"myapi/utils"
)

type OrderAndDetails struct {
	Order
	Details		[]OrderDetail
	DetailsDeleted	[]OrderDetail
}

func AddOrder(obj *Order) (id int, err error) {
	o := orm.NewOrm()
	obj.Create_time = time.Now().Unix()
	obj.Update_time = obj.Create_time
	if tmp, err := o.Insert(obj); err != nil {
    		return 0, err
	} else {
		id = int(tmp)
		return id, nil
	}
}

func UpdateOrder(obj *Order) (err error) {
	o := orm.NewOrm()
	obj.Update_time = time.Now().Unix()
	if _, err = o.Update(obj); err != nil {
    		return err
	} else {
		return nil
	}
}

func UpdateOrderStatus(id int, status int8) (err error) {
	o := orm.NewOrm()
	order := Order{Id: id}
	if err = o.Read(&order); err != nil {
    		return err
	} else {
		order.Status = status
		if err = UpdateOrder(&order); err != nil {
    			return err
		} else {
			return nil
		}
	}
}

func AddOrderAndDetails(obj *OrderAndDetails) (id int, err error) {
	o := orm.NewOrm()
	err = o.Begin()
	if err != nil {
		return 0, err
	}

	var tmp int
	if tmp, err = AddOrder(&obj.Order); err != nil {
		o.Rollback()
    		return 0, err
	} 

	for _, item := range obj.Details {
		item.Order_id = tmp
		if _, err = AddOrderDetailWithOrm(&item, o); err != nil {
			o.Rollback()
    			return 0, err
		}
	}
	err = o.Commit()
	return int(tmp), err
		
}


func UpdateOrderAndDetails(obj *OrderAndDetails) (err error) {
	o := orm.NewOrm()
	if err = o.Begin(); err != nil {
		return err
	}

	if err = UpdateOrder(&obj.Order); err != nil {
		o.Rollback()
    		return err
	} 

	//add or update
	for _, item := range obj.Details {
		if item.Id <= 0 {
			item.Order_id = obj.Order.Id
			if item.Material_id <= 0 {
				if _, err = AddOrderDetailWithOrmAndOwner(&item, o, obj.Order.Supplier_id); err != nil {
					o.Rollback()
					return err
				}
			} else {
				if _, err = AddOrderDetailWithOrm(&item, o); err != nil {
					o.Rollback()
					return err
				}
			}
		} else {
			if err = UpdateOrderDetailWithOrm(&item, o); err != nil {
				o.Rollback()
    				return err
			}
		}
	}

	//deleted items
	for _, item := range obj.DetailsDeleted {
		if err = DeleteOrderDetailWithOrm(&item, o); err != nil {
			o.Rollback()
   			return err
		}
	}

	err = o.Commit()
	return  err
		
}

func DeleteOrderWithOrm(obj *Order, o orm.Ormer) (err error) {
	if _, err = o.Delete(obj); err != nil {
		return err
	} else {
		return nil
	}
}

func DeleteOrderAndDetails(id int) (err error) {
	o := orm.NewOrm()
	err = o.Begin()
	if err != nil {
		return err
	}

	var obj = Order{Id:id}
	if err = DeleteOrderWithOrm(&obj, o); err != nil {
		o.Rollback()
    		return err
	} 

	if err = DeleteOrderDetailsByOrderIDWithOrm(id, o); err != nil {
		o.Rollback()
    		return err
	} 

	err = o.Commit()
	return err
		
}

func GetOrdersByBuyerWhenDate(id int, date string) (ret []*Order, err error) {
	tBegin, tEnd, err := utils.GetDayRangeBySeconds(date)
	if err != nil {
		return nil, errors.New("Parameter error")
	}
	t := new(Order)
	_, err = gOrm.QueryTable(t).Filter("creater_id", id).Filter("create_time__gte", tBegin).Filter("create_time__lte", tEnd).All(&ret)
	if err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return ret, nil
}

func GetOrdersBySupplierWhenDate(id int, date string) (ret []*Order, err error) {
	tBegin, tEnd, err := utils.GetDayRangeBySeconds(date)
	if err != nil {
		return nil, errors.New("Parameter error")
	}
	t := new(Order)
	_, err = gOrm.QueryTable(t).Filter("supplier_id", id).Filter("create_time__gte", tBegin).Filter("create_time__lte", tEnd).All(&ret)
	if err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return ret, nil
}
func GetOrdersByDateRange(dateBegin, dateEnd string) (ret []*Order, err error) {
	tBegin, _, err := utils.GetDayRangeBySeconds(dateBegin)
	if err != nil {
		return nil, errors.New("Parameter error")
	}
	var tEnd int
	if _, tEnd, err = utils.GetDayRangeBySeconds(dateEnd); err != nil {
		return nil, errors.New("Parameter error")
	}
	t := new(Order)
	_, err = gOrm.QueryTable(t).Filter("create_time__gte", tBegin).Filter("create_time__lte", tEnd).All(&ret)
	if err != nil {
		fmt.Printf("GetAllUsers error:%s\n", err)
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return ret, nil
}

func GetOrdersSummaryBuyer(date string) (maps []orm.Params, err error){
	tBegin, tEnd, err := utils.GetDayRangeBySeconds(date)
	if err != nil {
		return nil, err
	}
	o := orm.NewOrm()
	num, err := o.Raw("select DISTINCT a.creater_id ,b.nickname,b.realname from dvd_order a,dvd_user b where a.creater_id = b.id and  a.delivery_time > ? and a.delivery_time < ? ", tBegin, tEnd).Values(&maps)
	if err == nil && num > 0 {
		fmt.Println("GetOrdersSummaryBuyer", maps)
		return maps, nil
	} else if err == orm.ErrNoRows {
		return maps, nil
	}

	return nil, err
}

func GetOrdersSummaryDetail(id, date string) (maps []orm.Params, err error){
	tBegin, tEnd, err := utils.GetDayRangeBySeconds(date)
	if err != nil {
		return nil, err
	}
	vid, err := strconv.Atoi(id)
	if err != nil {
		return nil, err
	}

	o := orm.NewOrm()
	var num = int64(0)
	if vid == 0 {
		//seach all
		num, err = o.Raw("SELECT b.material_id as id, b.name, sum(b.amount) as amount,b.price, b.unit FROM dvd_order a, dvd_order_detail b WHERE a.id = b.order_id AND a.delivery_time > ? and a.delivery_time < ? GROUP BY b.material_id", tBegin, tEnd).Values(&maps)
	} else {
		num, err = o.Raw("SELECT b.material_id as id, b.name, sum(b.amount) as amount,b.price, b.unit FROM dvd_order a, dvd_order_detail b WHERE a.creater_id = ? AND a.id = b.order_id AND a.delivery_time > ? and a.delivery_time < ? GROUP BY b.material_id", vid, tBegin, tEnd).Values(&maps)
	}
	if err == nil && num > 0 {
		fmt.Println("GetOrdersSummaryDetail", maps) 
		return maps, nil
	} else if err == orm.ErrNoRows {
		return maps, nil
	}

	return nil, err
}
