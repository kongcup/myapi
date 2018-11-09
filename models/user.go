package models

import (
	"fmt"
	"time"
	"errors"
	"strconv"
	"github.com/astaxie/beego/orm"
)

func GetUser(uid string) (u *User, err error) {
	if uid == ""{
		return nil, errors.New("Parameter is empty")
	}
	id, err := strconv.Atoi(uid)
	if err != nil {
		return nil, errors.New("Parameter error")
	}
	user := User{Id:id}
	err = gOrm.Read(&user)
	
	//err = gOrm.QueryTable(user).Filter("id", uid).One(user)
	if err == orm.ErrMultiRows {
    		err = errors.New("Returned Multi Rows Not One")
	} else if err == orm.ErrNoRows {
    		err = errors.New("Not row found")
	}

	if err != nil {
		return nil, err
	}
	return &user, nil
}

func GetAllUsers() (ret []*User, err error) {
	user := new(User)
	_, err = gOrm.QueryTable(user).All(&ret)
	if err != nil {
		fmt.Printf("GetAllUsers error:%s\n", err)
		return nil, err
	}
	return ret, nil
}

func GetUserByMobile(mob string) (u *User, err error) {
	if mob == ""{
		return nil, errors.New("Parameter is empty")
	}
	user := User{Mobile:mob}
	
	err = gOrm.QueryTable(user).Filter("mobile", mob).One(&user)
	if err == orm.ErrMultiRows {
    		err = errors.New("Returned Multi Rows Not One")
	} else if err == orm.ErrNoRows {
    		err = errors.New("Not row found")
	}

	if err != nil {
		return nil, err
	}
	return &user, nil
}

func GetUsersByMobile(mob string) (u []*User, err error) {
	if mob == ""{
		return nil, errors.New("Parameter is empty")
	}
	
	_, err = gOrm.QueryTable(new(User)).Filter("mobile", mob).All(&u)

	if err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		}
	}
	return 
}

func GetUserByToken(token string)(u* User, err error) {
	o := orm.NewOrm()
	var user = new(User)
	err = o.QueryTable(new(User)).Filter("token", token).One(user)
	if err != nil {
		fmt.Println("get user by token error ", err.Error())
	}
	return user, err
}

func GetUserByOpenid(openid string) (u *User, err error) {
	o := orm.NewOrm()
	var user []*User
	num, err := o.QueryTable(new(User)).Filter("wxopenid", openid).All(&user)
	if err != nil {
		if err != orm.ErrNoRows {
			return nil, err
		} else {
			return nil, nil
		}
	}
	if num > 0 {
		return user[0], nil
	}else {
		return nil, errors.New("no data")
	}
}

func UpdateUser(obj *User) (err error) {
	o := orm.NewOrm()
	if _, err = o.Update(obj); err != nil {
    		return err
	} else {
		return nil
	}
}

func AddUser(obj *User) (err error) {
	o := orm.NewOrm()
	obj.Create_time = time.Now().Unix()
	if _, err = o.Insert(obj); err != nil {
    		return err
	} else {
		return nil
	}
}
