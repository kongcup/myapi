package main

import (
	_ "myapi/routers"

	"github.com/astaxie/beego"
	_ "myapi/models"
)

func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	
		beego.BConfig.Listen.EnableHTTPS = true
		ports, err := beego.AppConfig.Int("httpsport")
		if err != nil {
			ports = 10443
		}
		beego.BConfig.Listen.HTTPSPort = ports
		beego.BConfig.Listen.HTTPSAddr = ""
		beego.BConfig.Listen.HTTPSCertFile = "conf/ssl/ssl.pem"
		beego.BConfig.Listen.HTTPSKeyFile = "conf/ssl/ssl.key"
	} else if beego.BConfig.RunMode == "prod" {
		ports, err := beego.AppConfig.Int("httpport")
		if err != nil {
			ports = 8080
		}
		beego.BConfig.Listen.HTTPPort = ports
	}

	beego.Run()
}
