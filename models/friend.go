package models

import (
	"errors"
	"strconv"
	"github.com/astaxie/beego/orm"
)


func AddFriend(obj *Friend) (id int, err error) {
	o := orm.NewOrm()
	if tmp, err := o.Insert(obj); err != nil {
    		return 0, err
	} else {
		id = int(tmp)
		return id, nil
	}
}

func UpdateFriend(obj *Friend) (err error) {
	o := orm.NewOrm()
	if _, err = o.Update(obj); err != nil {
    		return err
	} else {
		return nil
	}
}

func DeleteFriendWithOrm(obj *Friend, o orm.Ormer) (err error) {
	if _, err = o.Delete(obj); err != nil {
		return err
	} else {
		return nil
	}
}

func DeleteFriend(id int) (err error) {
	o := orm.NewOrm()
	err = o.Begin()
	if err != nil {
		return err
	}

	var obj = Friend{Id:id}
	if err = DeleteFriendWithOrm(&obj, o); err != nil {
		o.Rollback()
    		return err
	} 

	err = o.Commit()
	return err
}

func GetFriendsByClass(masterid, class string) (maps []orm.Params, err error){
	vid, err := strconv.Atoi(masterid)
	if err != nil {
		return nil, err
	}
	vclass, err := strconv.Atoi(class)
	if err != nil {
		return nil, err
	}

	o := orm.NewOrm()
	num, err := o.Raw("SELECT a.id, b.id AS userid, b.nickname, b.realname, b.mobile  FROM dvd_friend a, dvd_user b WHERE a.master_id = ? and a.class = ? and a.friend_id = b.id", vid, vclass).Values(&maps)
	if err == nil {
		if num > 0 {
			return maps, nil
		} else {
			return nil, errors.New("no rows")
		}
	}
	return nil, err
}

func IsFriendExist(masterid, friendid, class string) (ret bool, err error){
	for {
		if masterid == "" || friendid == "" || class == "" {
			err = errors.New("Parameters error")
			break
		}
	
		vid, err1 := strconv.Atoi(masterid)
		if err1 != nil {
			err = err1
			break
		}

		fid, err1 := strconv.Atoi(friendid)
		if err1 != nil {
			err = err1
			break
		}

		vclass, err1 := strconv.Atoi(class)
		if err1 != nil {
			err = err1
			break
		}
		
		o := orm.NewOrm()
		obj := new(Friend)
		err1 = o.QueryTable(obj).Filter("master_id", vid).Filter("friend_id", fid).Filter("class", vclass).One(obj)
		if err1 != nil {
			err = err1
			break
		}
		
		break
	}
	
	if err != nil {
		if err == orm.ErrMultiRows {
			return true, nil
		}else if err == orm.ErrNoRows {
			return false, nil
		}else {
			return false, err
		}
	}
	return true, nil 
}
