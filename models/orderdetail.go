package models

import (
	"time"
	"errors"
	"github.com/astaxie/beego/orm"
)

func AddOrderDetail(obj *OrderDetail) (id int, err error) {
	o := orm.NewOrm()
	return AddOrderDetailWithOrm(obj, o)
}

func AddOrderDetailWithOrm(obj *OrderDetail, o orm.Ormer) (id int, err error) {
	obj.Update_time = time.Now().Unix()
	obj.Operator_id = 1
	if tmp, err := o.Insert(obj); err != nil {
    		return 0, err
	} else {
		id = int(tmp)
	}
	return id, nil
}

func AddOrderDetailWithOrmAndOwner(obj *OrderDetail, o orm.Ormer, owner int) (id int, err error) {
	if obj.Material_id <= 0 {
		if owner > 0 {
			//add material first
			var objMat = Material{}
			objMat.Type_id = MODEL_MATERIAL_TYPE_OTHER
			objMat.Owner_id = owner
			objMat.Name = obj.Name
			objMat.Price = obj.Price
			objMat.Unit = obj.Unit
			if mid, err := AddMaterialWithOrm(&objMat, o); err != nil {
    				return 0, err
			} else {
				obj.Material_id = mid
			}
		} else {
			return 0, errors.New("Parameter error.")
		}
	}

	return AddOrderDetailWithOrm(obj, o)
}

func UpdateOrderDetail(obj *OrderDetail) (err error) {
	o := orm.NewOrm()
	return UpdateOrderDetailWithOrm(obj, o)
}

func UpdateOrderDetails(objs *[]OrderDetail) (retObjs []OrderDetail, err error) {
	o := orm.NewOrm()
	if err = o.Begin(); err != nil {
		return nil, err
	}
	var id int = 0
	for _, obj := range *objs {
		if obj.Id > 0 {
			err = UpdateOrderDetailWithOrm(&obj, o)
		} else {
			id, err = AddOrderDetailWithOrm(&obj, o)
		}
		if err != nil {
			break
		}
		if obj.Id <= 0 {
			obj.Id = id
		}
		retObjs = append(retObjs, obj)
	}
	if err != nil {
		o.Rollback()
	} else {
		err = o.Commit()
	}
	return 
}
func UpdateOrderDetailWithOrm(obj *OrderDetail, o orm.Ormer) (err error) {
	obj.Update_time = time.Now().Unix()
	obj.Operator_id = 1
	if _, err = o.Update(obj); err != nil {
		return err
	} else {
		return nil
	}
}

func DeleteOrderDetail(obj *OrderDetail) (err error) {
	o := orm.NewOrm()
	return DeleteOrderDetailWithOrm(obj, o)
}

func DeleteOrderDetailWithOrm(obj *OrderDetail, o orm.Ormer) (err error) {
	if _, err = o.Delete(obj); err != nil {
		return err
	} else {
		return nil
	}
}

func DeleteOrderDetailsByOrderIDWithOrm(id int, o orm.Ormer) (err error) {
	if _, err := o.QueryTable(new(OrderDetail)).Filter("order_id", id).Delete(); err != nil {
		return err
	} else {
		return nil
	}
}

func GetOrderDetailByOrderID(m int) (objs []*OrderDetail, err error) {
	o := orm.NewOrm()
	_, err = o.QueryTable(new(OrderDetail)).Filter("order_id", m).All(&objs)
	if err != nil {
		return nil, err
	}
	return objs, nil
}

