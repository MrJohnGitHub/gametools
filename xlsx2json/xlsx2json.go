package main

import (
	"bytes"
	"crypto/md5"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"github.com/360EntSecGroup-Skylar/excelize"
	"io"
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
var configs map[string]Element
var modifyLog map[string]string
var configPaths map[string]string

var attr_min_atk = 5
var attr_max_atk = 6
var attr_min_def = 7
var attr_max_def = 8

func resolveAppPath(path string) string {
	return rootPath + "/" + path
}

func doInit() {
	os.Mkdir(resolveAppPath("json"), os.ModePerm)

	bytes,err := ioutil.ReadFile(resolveAppPath("config.json"))
	if err != nil {
		configs = make(map[string]Element)
	} else {
		err = json.Unmarshal(bytes, &configs)
		if err != nil {
			fmt.Println(err)
			fmt.Println("无法解析config.json文件")
			os.Exit(100)
			return
		}
	}

	bytes,err = ioutil.ReadFile(resolveAppPath("modify.json"))
	if err != nil {
		modifyLog = make(map[string]string)
		return
	}
	err = json.Unmarshal(bytes, &modifyLog)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法解析modify.json文件")
		os.Exit(101)
		return
	}
	bytes,err = ioutil.ReadFile(resolveAppPath("config_xlsx.json"))
	if err != nil {
		configPaths = make(map[string]string)
		return
	}
	err = json.Unmarshal(bytes, &configPaths)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法解析config_xlsx.json文件")
		os.Exit(102)
		return
	}

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
	//rootPath = "E:\\RXGL-H5\\trunk\\H5-docs\\导表工具"
	var xlsxPath = ""
	if argCount > 2 {
		xlsxPath = args[2]
	}

	start := time.Now()
	doInit()
	if xlsxPath != "" {
		exportOne(xlsxPath)
	} else {
		xlsxDirPath := resolveAppPath("/数据表-H5")
		exportXlsxDir(xlsxDirPath)
	}
	configBytes,err := json.Marshal(configs)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法将全部配置表数据转成json格式")
		os.Exit(200)
		return
	}
	var configBuffer bytes.Buffer
	//json.Indent(&configBuffer, configBytes, "", "\t")
	json.Indent(&configBuffer, configBytes, "", "")
	err = ioutil.WriteFile(resolveAppPath("config.json"), configBuffer.Bytes(), syscall.O_CREAT)
	if err != nil {
		fmt.Println(err)
		fmt.Println("保存config.json文件失败。")
		os.Exit(201)
		return
	}

	modifyBytes,err := json.Marshal(modifyLog)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法将modify记录转成json数据")
		return
	}
	var modifyBuffer bytes.Buffer
	json.Indent(&modifyBuffer, modifyBytes, "", "\t")
	err = ioutil.WriteFile(resolveAppPath("modify.json"), modifyBuffer.Bytes(), syscall.O_CREAT)
	if err != nil {
		fmt.Println(err)
		fmt.Println("保存modify.json文件失败。")
		return
	}

	pathBytes,err := json.Marshal(configPaths)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法将config_xlsx转成json数据")
		return
	}
	var pathBuffer bytes.Buffer
	json.Indent(&pathBuffer, pathBytes, "", "\t")
	err = ioutil.WriteFile(resolveAppPath("config_xlsx.json"), pathBuffer.Bytes(), syscall.O_CREAT)
	if err != nil {
		fmt.Println(err)
		fmt.Println("保存config_xlsx.json文件失败。")
		return
	}

	dt := time.Now().Sub(start)
	fmt.Println("export complete! cost：", dt)
}

//生成32位md5字串
func Md5(s string) string {
	md5 := md5.New()
	file,_ := os.Open(s)
	io.Copy(md5, file)
	return hex.EncodeToString(md5.Sum(nil))
}

func exportXlsxDir(xlsxDirPath string) {
	dir, _ := ioutil.ReadDir(xlsxDirPath)
	for _, file := range dir {
		fileName := file.Name()
		if file.IsDir() {
			//exportXlsxDir(xlsxDirPath + "/" + fileName)
			continue
		} else if path.Ext(fileName) == ".xlsx" || path.Ext(fileName) == ".xls" || path.Ext(fileName) == ".xlsm" {
			log := modifyLog[fileName]
			fileMd5 := Md5(xlsxDirPath + "/" + file.Name())
			//modifyStr := strconv.Itoa(file.ModTime().Nanosecond()) + "-" + strconv.FormatInt(file.Size(), 10)
			if fileMd5 != log {
				fmt.Println(fileName)
				exportOne(xlsxDirPath + "/" + file.Name())
				modifyLog[fileName] = fileMd5
			}
		}
	}
}

func exportOne(xlsxPath string) {
	xlsx,err := excelize.OpenFile(xlsxPath)
	if err != nil {
		fmt.Println(err)
		fmt.Println("无法读取xls文件：" + xlsxPath)
		os.Exit(110)
		return;
	}
	sheets := xlsx.SheetCount
	for i :=1; i <= sheets; i++ {
		content := ""
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
		//content += "{"
		switch exportType {
		case "simple":
			content += createByTiny(configName, rows)
			break
		case "base":
			content += createByBase(configName, rows)
			break
		default:
			fmt.Println("请设置正确导出格式（simple/base）：" + name)
			break
		}
		//fmt.Println(content)
		//content += "\n}"
		ioutil.WriteFile(resolveAppPath("json/" + configName + ".json"), []byte(content), syscall.O_CREAT)
		var jsonData Element
		err = json.Unmarshal([]byte(content), &jsonData)
		if err != nil {
			fmt.Println(err)
			fmt.Println("无法将数据转成json格式：" + configName)
			os.Exit(999)
		}
		configs[configName] = jsonData
		configPaths[configName] = xlsxPath
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
	content := "{\n"
	startRow := 8
	hasStarted := false
	tsStr := "interface " + configName + " {"
	for row := startRow; row < len(rows); row++ {
		exportTarget := rows[row][2]
		if !strings.Contains(exportTarget, "c") {
			continue
		}
		keyStr := rows[row][0]
		value := rows[row][3]
		tsStr += "\n\t" + keyStr + ": " + getValueTsType(value)
		if keyStr == "" {
			continue
		}
		if value == "" {
			continue
		}
		if hasStarted {
			content += ",\n"
		}
		content += "\t";
		content += toJsonStr(keyStr) + ":" + toJsonValue(value, "")
		if !hasStarted {
			hasStarted = true
		}
	}
	tsStr += "\n}"
	ioutil.WriteFile(resolveAppPath("ts/" + configName + ".ts"), []byte(tsStr), syscall.O_CREAT)
	content += "\n}"
	return content
}

func createByBase(configName string, rows [][]string) string {
	content := ""
	keyNum,err := strconv.Atoi(rows[2][1])
	if keyNum == 0 {
		content += "["
	} else {
		content += "{"
	}
	if err != nil {
		fmt.Println(err)
		fmt.Println("主键数量读取错误。")
		os.Exit(999)
		return ""
	}
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
			case "map":
			case "":
				tsStr += "any"
				break
			case "array":
				tsStr += "any[]"
				break
			case "attr[]":
				tsStr += "AttributeData[]"
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

	itemsArr := []string{}
	itemMap := make(map[string]Element)
	 rowCount := len(rows)
	rowLoop: for row := 8; row < rowCount; row++ {
		itemStr := "{";
		exportColCount := len(exportCols)
		for i := 0; i < exportColCount; i++ {
			col := exportCols[i]
			prop := rows[6][col]
			vtype := rows[7][col]
			value := rows[row][col]
			if value == "" {
				continue
			}
			if strToNumber(value) == 0 && i >= keyNum {
				continue
			}
			if i != 0 {
				itemStr += ","
			}
			//if vtype == "attr[]" {
			//	attrs := str2attrs(value)
			//	bytes, _ := json.Marshal(attrs)
			//	value = string(bytes)
			//}
			jsonValue := toJsonValue(value, vtype)
			itemStr += toJsonStr(prop) + ":" + jsonValue

		}
		itemStr += "}";
		if itemStr == "{}" {
			continue
		}
		if keyNum == 0 {
			itemsArr = append(itemsArr, itemStr)
		} else {
			curMap := itemMap;
			kIndex := 0
			for kIndex = 0; kIndex < keyNum - 1; kIndex++ {
				keyValue := rows[row][kIndex]
				if keyValue == "" {
					continue rowLoop
				}
				if curMap[keyValue] == nil {
					curMap[keyValue] = make(map[string]Element)
				}
				curMap = curMap[keyValue].(map[string]Element)
			}
			key := rows[row][keyNum - 1]
			if key == "" {
				continue rowLoop
			}
			tmpData := curMap[key]
			if tmpData != nil {
				switch tmpData.(type) {
					case string:
						arrItems := []string{}
						arrItems = append(arrItems, tmpData.(string))
						arrItems = append(arrItems, itemStr)
						curMap[key] = arrItems
						break
					case []string:
						curMap[key] = append(curMap[key].([]string), itemStr)
						break
				}
			} else {
				curMap[key] = itemStr
			}
			//curMap[key] = itemStr
		}
	}
	if keyNum == 0 {
		for index, value := range itemsArr {
			if index > 0 {
				content += "," + "\n"
			}
			content += value
		}
	} else {
		content += mapToString(itemMap, 0);
	}
	if keyNum == 0 {
		content += "\n]"
	} else {
		content += "\n}"
	}
	return content;
}

/**
 * 将字符串格式的属性配置转为属性数组
 * id,value,maxValue | id, value, minValue
 */
func str2attrs(str string) []*Attribute {
	attrArr := make([]*Attribute, 0)
	if len(str) == 0 {
		return attrArr
	}
	attrMap := make(map[int]*Attribute)
	arr := strings.Split(str, "|")

	for _, str1 := range arr {
		arr2 := strings.Split(str1, ",")
		if len(arr2) < 2 {
			continue
		}
		attr := Attribute{Id: 0, Value: 0, MaxValue: 0}
		attr.Id, _ = strconv.Atoi(arr2[0])
		attr.Value, _ = strconv.Atoi(arr2[1])
		if len(arr2) > 2 {
			attr.MaxValue, _ = strconv.Atoi(arr2[2])
		}
		if attr.Id != attr_max_atk && attr.Id != attr_max_def {
			attrArr = append(attrArr, &attr)
		}
		attrMap[attr.Id] = &attr
	}
	min_atk, _ := attrMap[attr_min_atk]
	max_atk, _ := attrMap[attr_max_atk]
	if max_atk != nil && min_atk != nil {
		min_atk.MaxValue = max_atk.Value
	}
	//min_atk.MaxValue = max_atk.Value
	min_def, _ := attrMap[attr_min_def]
	max_def, _ := attrMap[attr_max_def]
	if max_def != nil && min_def != nil {
		min_def.MaxValue = max_def.Value
	}
	//min_def.MaxValue = max_def.Value
	return attrArr
}

func str2items(str string) []*Item {
	awardArr := make([]*Item, 0)
	arr := strings.Split(str, "|")
	if len(str) == 0 {
		return awardArr
	}
	for _, str1 := range arr {
		arr2 := strings.Split(str1, ",")
		if len(arr2) < 2 {
			continue
		}
		award := Item{Type: 0, Id: 0, Count: 0, Bind: 0}
		award.Type, _ = strconv.Atoi(arr2[0])
		award.Id, _ = strconv.Atoi(arr2[1])
		award.Count, _ = strconv.Atoi(arr2[2])
		if len(arr2) > 3 {
			bind, _ := strconv.Atoi(arr2[3])
			if bind > 0 {
				award.Bind = 1
			}
		}
		awardArr = append(awardArr, &award)
	}
	return awardArr
}

func str2Arr(str string) [][]string {
	strArr := make([][]string, 0)
	arr := strings.Split(str, "|")
	if len(str) == 0 {
		return nil
	}
	for _, str1 := range arr {
		arr2 := strings.Split(str1, ",")
		strArr = append(strArr, arr2)
	}
	return strArr
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
		case []string:
			content += "["
			arrLen := len(value.([]string))
			for arrIndex, arrValue := range value.([]string) {
				content += arrValue
				if arrIndex < arrLen - 1 {
					content += ","
				}
			}
			content += "]"
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
	if vtype == "int" || vtype == "array" || vtype == "object" || vtype == "map" || vtype == "table" {
		return value
	}
	//属性列表
	if(vtype == "attr[]") {
		attrs := str2attrs(value)
		bytes, _ := json.Marshal(attrs)
		return string(bytes)
	}
	//属性列表
	if(vtype == "item[]") {
		attrs := str2items(value)
		bytes, _ := json.Marshal(attrs)
		return string(bytes)
	}
	if(vtype == "script") {
		arr := strings.Split(value, ",")
		bytes, _ := json.Marshal(arr)
		return string(bytes)
	}
	//数组
	if(vtype == "script[]") {
		arr := str2Arr(value)
		bytes, _ := json.Marshal(arr)
		return string(bytes)
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
	value = strings.Replace(value, "\n", "\\n", -1)
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

type Attribute struct {
	Id int `json:"id"`
	Value int `json:"value"`
	MaxValue int `json:"maxValue,omitempty"`
}

type Item struct {
	Type int `json:"type"`
	Id int `json:"id"`
	Count int `json:"count"`
	Bind int `json:"bind,omitempty"`
}