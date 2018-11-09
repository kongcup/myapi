package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

	beego.GlobalControllerRouter["myapi/controllers:FriendController"] = append(beego.GlobalControllerRouter["myapi/controllers:FriendController"],
		beego.ControllerComments{
			Method: "AddFriend",
			Router: `/add`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:FriendController"] = append(beego.GlobalControllerRouter["myapi/controllers:FriendController"],
		beego.ControllerComments{
			Method: "DeleteOne",
			Router: `/delete`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:FriendController"] = append(beego.GlobalControllerRouter["myapi/controllers:FriendController"],
		beego.ControllerComments{
			Method: "GetFriendsList",
			Router: `/list`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "Add",
			Router: `/add`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/delete`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/getall`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "Save",
			Router: `/save`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "Search",
			Router: `/search/:cond`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:MaterialController"] = append(beego.GlobalControllerRouter["myapi/controllers:MaterialController"],
		beego.ControllerComments{
			Method: "Update",
			Router: `/update`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:ObjectController"] = append(beego.GlobalControllerRouter["myapi/controllers:ObjectController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:ObjectController"] = append(beego.GlobalControllerRouter["myapi/controllers:ObjectController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:ObjectController"] = append(beego.GlobalControllerRouter["myapi/controllers:ObjectController"],
		beego.ControllerComments{
			Method: "Get",
			Router: `/:objectId`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:ObjectController"] = append(beego.GlobalControllerRouter["myapi/controllers:ObjectController"],
		beego.ControllerComments{
			Method: "Put",
			Router: `/:objectId`,
			AllowHTTPMethods: []string{"put"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:ObjectController"] = append(beego.GlobalControllerRouter["myapi/controllers:ObjectController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:objectId`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "AddOrder",
			Router: `/addorder`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "DeleteOne",
			Router: `/delete`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "GetByDay",
			Router: `/get`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "GetByDayRange",
			Router: `/get/:timebegin/:timeend`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "Print",
			Router: `/print`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "GetPrintAddress",
			Router: `/printaddr`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "SummaryBuyer",
			Router: `/summarybuyer`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "SummaryDetail",
			Router: `/summarydetail`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "Update",
			Router: `/update`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderController"],
		beego.ControllerComments{
			Method: "UpdateOrderAndDetails",
			Router: `/updateall`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"],
		beego.ControllerComments{
			Method: "AddOne",
			Router: `/add`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"],
		beego.ControllerComments{
			Method: "DeleteOne",
			Router: `/delete`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"],
		beego.ControllerComments{
			Method: "GetByOrderID",
			Router: `/get`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"] = append(beego.GlobalControllerRouter["myapi/controllers:OrderDetailController"],
		beego.ControllerComments{
			Method: "Update",
			Router: `/update`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Post",
			Router: `/`,
			AllowHTTPMethods: []string{"post"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "GetAll",
			Router: `/`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Get",
			Router: `/:uid`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Delete",
			Router: `/:uid`,
			AllowHTTPMethods: []string{"delete"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "CheckToken",
			Router: `/checktoken`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Login",
			Router: `/login`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Logout",
			Router: `/logout`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "Save",
			Router: `/save`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "SearchByPhone",
			Router: `/search`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "TestServer",
			Router: `/test`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "UpdateInfo",
			Router: `/updateinfo`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

	beego.GlobalControllerRouter["myapi/controllers:UserController"] = append(beego.GlobalControllerRouter["myapi/controllers:UserController"],
		beego.ControllerComments{
			Method: "UpdateRole",
			Router: `/updaterole`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(),
			Params: nil})

}
