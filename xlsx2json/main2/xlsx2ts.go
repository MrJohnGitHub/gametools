package main

import (
	"encoding/json"
	"fmt"
	"github.com/360EntSecGroup-Skylar/excelize"
	"io/ioutil"
	"os"
	"path"
	"strconv"
	"strings"
	"syscall"
	"time"
)
const INT_MAX = int(^uint(0) >> 1)
const INT_MIN = ^INT_MAX
var rootPath string

func resolveAppPath(path string) string {
	return rootPath + "/" + path
}

func main() {
	args := os.Args
	argCount := len(args)
	fmt.Println(args)
	if argCount > 1 {
		rootPath = args[1]
	} else {
		rootPath = "."
	}
	var xlsxPath = ""
	if argCount > 2 {
		xlsxPath = args[2]
	}

	start := time.Now()
	if xlsxPath != "" {
		exportOne(xlsxPath)
	} else {
		xlsxDirPath := resolveAppPath("/数据表-H5")
		exportXlsxDir(xlsxDirPath)
	}

	dt := time.Now().Sub(start)
	fmt.Println("export complete! cost：", dt)
}

func exportXlsxDir(xlsxDirPath string) {
	dir, _ := ioutil.ReadDir(xlsxDirPath)
	for _, file := range dir {
		fileName := file.Name()
		if file.IsDir() {
			//exportXlsxDir(xlsxDirPath + "/" + fileName)
			continue
		} else if path.Ext(fileName) == ".xlsx" || path.Ext(fileName) == ".xls" {
			fmt.Println(fileName)
			exportOne(xlsxDirPath + "/" + file.Name())
		}
	}
}

func exportOne(xlsxPath string) {
	xlsx,err := excelize.OpenFile(xlsxPath)
	if err != nil {
		fmt.Println(err)
		return;
	}
	sheets := xlsx.SheetCount
	for i :=1; i <= sheets; i++ {
		name := xlsx.GetSheetName(i)
		rows := xlsx.GetRows(name)
		if len(rows) < 9 {
			continue
		}
		if len(rows[0]) < 2 {
			continue
		}
		if len(rows[0]) < 2 {
			continue
		}
		exportType := rows[0][1]
		configName := rows[1][1]
		if exportType != "base" && exportType != "simple" {
			continue
		}
		if configName == "" {
			continue
		}
		switch exportType {
		case "simple":
			createByTiny(configName, rows)
			break
		case "base":
			createByBase(configName, rows)
			break
		default:
			fmt.Println("请设置正确导出格式（simple/base）：" + name)
			break
		}
	}
}

func getValueTsType(value string) string {
	if strToNumber(value) != INT_MIN {
		return "number"
	}
	var jsonData Element
	json.Unmarshal([]byte(value), &jsonData)
	if jsonData != nil {
		if strings.Index(value, "[") == 0 {
			return "any[]"
		}
		return "any"
	}
	return "string"
}

func createByTiny(configName string, rows [][]string) string {
	content := "\n"
	startRow := 8
	tsStr := "interface " + configName + " {"
	for row := startRow; row < len(rows); row++ {
		exportTarget := rows[row][2]
		if !strings.Contains(exportTarget, "c") {
			continue
		}
		if row != startRow {
			content += ",\n"
		}
		keyStr := rows[row][0]
		value := rows[row][3]
		tsStr += "\n\t" + keyStr + ": " + getValueTsType(value)
	}
	tsStr += "\n}"
	ioutil.WriteFile(resolveAppPath("ts/" + configName + ".ts"), []byte(tsStr), syscall.O_CREAT)
	return tsStr
}

func createByBase(configName string, rows [][]string) string {
	//导出列数
	cols := len(rows[5])
	tsStr := "interface " + configName + "{"
	exportCols := []int{}
	for i := 0; i < cols; i++ {
		exportTarget := rows[5][i]
		if strings.Contains(exportTarget, "c") {
			exportCols = append(exportCols, i)
			tsStr += "\n\t" + rows[6][i] + ": "
			vtype := rows[7][i]
			switch vtype {
			case "int":
				tsStr += "number"
				break
			case "byte":
				tsStr += "number"
				break
			case "short":
				tsStr += "number"
				break
			case "float":
				tsStr += "number"
				break
			case "map":
			case "":
				tsStr += "any"
				break
			case "array":
				tsStr += "any[]"
				break
			default:
				tsStr += vtype
				break
			}
			tsStr += ";"
		}
	}
	tsStr += "\n}"
	ioutil.WriteFile(resolveAppPath("ts/" + configName + ".ts"), []byte(tsStr), syscall.O_CREAT)
	return tsStr
}

func mapToString(itemMap map[string]Element, taps int) string {
	content := ""
	splitChar := ""
	for key, value := range itemMap {
		content += splitChar + "\n" + toTaps(taps) + toJsonStr(key) + ":";
		if splitChar == "" {
			splitChar = ","
		}
		switch value.(type) {
		case string:
			content += value.(string)
			break
		default:
			content += "{" + mapToString(value.(map[string]Element), taps+1) + "\n}"
		}
		//content += ","
	}
	return content
}

func toJsonStr(str string) string {
	return "\"" + str + "\""
}

func toJsonValue(value string, vtype string) string {
	if vtype == "int" || vtype == "array" || vtype == "object" {
		return value
	}
	//数字
	if strToNumber(value) != INT_MIN {
		return value
	}
	if vtype == "" {
		//数字
		if strToNumber(value) != INT_MIN {
			return value
		}
		var jsonData Element
		json.Unmarshal([]byte(value), &jsonData)
		if jsonData != nil {
			return value
		}
	}
	return toJsonStr(value)
}

func strToNumber(keyStr string) int {
	num,err := strconv.Atoi(keyStr)
	if err != nil {
		return INT_MIN;
	} else {
		return num
	}
}

func toTaps(taps int) string {
	str := "";
	for i := 0; i <taps; i++ {
		str += "\t";
	}
	return str
}

type Element interface{}