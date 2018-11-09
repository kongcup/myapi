package models

import (
	"testing"
	"fmt"
)

func TestGetAllByName(t *testing.T) {

	var name string = "222"
	objs, err := GetMaterialsByName(name)
	if err != nil {
		t.Fatalf("error:%s", err.Error())
	} else {
		fmt.Printf("success:result count %d\n", len(objs))
	}
}

func TestGetAllByQuickcode(t *testing.T) {

	var v string = "33"
	objs, err := GetMaterialsByQuickcode(v)
	if err != nil {
		t.Fatalf("error:%s", err.Error())
	} else {
		fmt.Printf("success:result count %d\n", len(objs))
	}
}

func TestGetAllByNameAndQuickcode(t *testing.T) {

	var v string = "33"
	objs, err := GetMaterialsByNameOrQuickcode(v)
	if err != nil {
		t.Fatalf("error:%s", err.Error())
	} else {
		fmt.Printf("Name and QuickCode success:result count %d\n", len(objs))
	}
}
