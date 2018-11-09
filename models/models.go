package models

import (
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type User struct {
	Id		int
	Role_id		int
	Wxopenid	string `orm:"size(32)"`
	Wxsessionkey	string `orm:"size(32)"`
	Wxunionid	string `orm:"size(32)"`
	Mobile		string `orm:"size(20)"`
	Pass		string `orm:"size(64)"`
	Realname	string `orm:"size(12)"`
	Nickname	string `orm:"size(12)"`
	Avatar		string `orm:"size(255)"`
	Gender		int8
	Status		int8
	Token		string `orm:"size(128)"`	
	Activation_key	string `orm:"size(60)"`
	Last_login_ip	string `orm:"size(15)"`
	Last_login_time	int64
	Create_time	int64
}

type Order struct {
	Id			int
	Sn			string `orm:"size(32)"`
	Creater_id		int
	Cname			string `orm:"size(32)"`
	Supplier_id		int
	Sname			string `orm:"size(32)"`
	Delivery_time		int
	Status			int8
	Update_time		int64
	Create_time		int64
}

type OrderDetail struct {
	Id			int
	Order_id		int
	Operator_id		int
	Material_id		int
	Name			string `orm:"size(64)"`
	Amount			float32
	Price			float32
	Unit			string `orm:"size(64)"`
	Update_time		int64
}

type Material struct {
	Id			int
	Owner_id		int
	Type_id			int
	Name			string 	`orm:"size(64)"`
	Quickcode		string 	`orm:"size(20)"`
	Spec			string 	`orm:"size(20)"`
	Price			float32	
	Pricefloat		int8
	Unit			string 	`orm:"size(8)"`
	Status			int8
	Update_time		int64
	Create_time		int64
}

type MaterialType struct {
	Id			int
	Name			string `orm:"size(32)"`
}

type Friend struct {
	Id			int
	Master_id		int
	Friend_id		int
	Class			int8
}

var gOrm orm.Ormer

func init() {
	orm.RegisterDriver("mysql", orm.DRMySQL)
	//orm.RegisterDataBase("default", "mysql", "root:111111@tcp(192.168.56.105:3366)/dvd?charset=utf8", 30)
	orm.RegisterDataBase("default", "mysql", "dev:zmkm2018@tcp(dvdserver.digitcoffee.com:3366)/dvd?charset=utf8", 30)

	orm.RegisterModelWithPrefix("dvd_", new(User), new(Order), new(OrderDetail), new(Material), new(Friend))

	gOrm = orm.NewOrm()
	gOrm.Using("default")


}

