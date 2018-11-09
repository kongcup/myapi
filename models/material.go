package models

import (
	"time"
	"errors"
	"github.com/astaxie/beego/orm"
)

const (
	MODEL_MATERIAL_STATUS_ON_SHELF = 0
	MODEL_MATERIAL_STATUS_DOWN_SHELF = 1
)


func AddMaterial(obj *Material) (id int, err error) {
	o := orm.NewOrm()
	return AddMaterialWithOrm(obj, o)
}

func AddMaterialWithOrm(obj *Material, o orm.Ormer) (id int, err error) {
	if obj == nil {
		return 0, errors.New("Parameter error.")
	}
	obj.Status = MODEL_MATERIAL_STATUS_ON_SHELF
	obj.Create_time = time.Now().Unix()
	obj.Update_time = obj.Create_time
	if tmp, err := o.Insert(obj); err != nil {
    		return 0, err
	} else {
		id = int(tmp)
		return id, nil
	}
}

func UpdateMaterial(obj *Material) (err error) {
	if obj == nil {
		return errors.New("Parameter error.")
	}
	o := orm.NewOrm()
	obj.Update_time = time.Now().Unix()
	if _, err = o.Update(obj); err != nil {
    		return err
	} else {
		return nil
	}
}

func DeleteMaterial(obj *Material) (err error) {
	if obj == nil {
		return errors.New("Parameter error.")
	}
	o := orm.NewOrm()
	if _, err = o.Delete(obj); err != nil {
    		return err
	} else {
		return nil
	}
}

func UpdateMaterialStatus(id int, status int8) (err error) {
	if id <= 0 {
		return errors.New("Parameter error.")
	}
	o := orm.NewOrm()
	obj := Material{Id: id}
	if err = o.Read(&obj); err != nil {
    		return err
	} else {
		obj.Status = status
		if err = UpdateMaterial(&obj); err != nil {
    			return err
		} else {
			return nil
		}
	}
}



func GetAllMaterials(owner int) (objs []*Material, err error) {
	o := orm.NewOrm()
	if _, err = o.QueryTable(new(Material)).Filter("owner_id", owner).OrderBy("id").All(&objs); err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return objs, nil
}

func GetMaterialsByName(owner int, name string) (objs []*Material, err error) {
	o := orm.NewOrm()
	if _, err = o.QueryTable(new(Material)).Filter("owner_id", owner).Filter("name__icontains", name).All(&objs); err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return objs, nil
}

func GetMaterialsByQuickcode(owner int, code string) (objs []*Material, err error) {
	o := orm.NewOrm()
	if _, err = o.QueryTable(new(Material)).Filter("owner_id", owner).Filter("quickcode__icontains", code).All(&objs); err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return objs, nil
}

func GetMaterialsByNameOrQuickcode(owner int, val string) (objs []*Material, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Material))
	cond := orm.NewCondition()
	cond = cond.Or("name__icontains", val)
	cond = cond.Or("quickcode__icontains", val)
	cond1 := orm.NewCondition()
	cond1 = cond1.And("owner_id", owner)
	cond1 = cond.AndCond(cond1)
	qs = qs.SetCond(cond1)
	if _, err = qs.All(&objs); err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return objs, nil
}
