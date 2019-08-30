/**
 * 示例自定义插件，您可以查阅 http://developer.egret.com/cn/github/egret-docs/Engine2D/projectConfig/cmdExtensionPlugin/index.html
 * 了解如何开发一个自定义插件
 */
import * as fs from 'fs';
import * as path from 'path';
// import * as images from 'images'

/**
 * 大文件检测
 */
export class CheckLargeFilePlugin implements plugins.Command {
    public limitSize: number;
    public largeFiles: string[] = [];
    constructor(limitSize: number) {
        this.limitSize = limitSize * 1024;
    }

    async onFile(file: plugins.File) {
        if(file.contents.buffer.byteLength > this.limitSize) {
            let size = Math.floor(file.contents.buffer.byteLength/1024) + "kb";
            console.error("文件较大！", file.path, size);
            this.largeFiles.push(`${file.basename},${size}kb`);
        }
        return file;
    }
    
    async onFinish(commandContext: plugins.CommandContext) {
        console.log("检测文件大小完毕");
    }
}

/**
 * 资源配置文件检测
 */
export class CheckResConfigPlugin implements plugins.Command {
    public resConfig: any;
    public resUrls: string[] = [];
    constructor() {
        this.resConfig = JSON.parse(fs.readFileSync("resource/default.res.json", {encoding: "utf8"}));
        for(let item of this.resConfig.resources) {
            this.resUrls.push(item.url);
        }
    }

    async onFile(file: plugins.File) {
        if(file.extname.indexOf("exml") < 0) {
            if(this.resUrls.indexOf(file.basename) < 0) {
                console.log("资源配置丢失：" + file.path);
            }
        }
        return file;
    }
    
    async onFinish(commandContext: plugins.CommandContext) {
        console.log("检测文件大小完毕");
    }
}

export class ExcludeExmlPlugin implements plugins.Command {
    excludePaths: string[];

    constructor(paths: string[]) {
        this.excludePaths = paths;
    }

    async onFile(file: plugins.File) {
        for(let url of this.excludePaths) {
            if(file.path.indexOf(url) >= 0) {
                return null;
            }
        }
        return file;
    }
    
    async onFinish(commandContext: plugins.CommandContext) {
    }
}

/**
 * 合并引擎库文件
 */
export class MergeEgretLibPlugin implements plugins.Command {
    libPaths: string[] = [];
    constructor() {
    }

    async onFile(file: plugins.File) {
        if(file.path.indexOf("libs\\modules") >= 0) {
            this.libPaths.push(file.path);
        }
        return file;
    }

    async onFinish(commandContext: plugins.CommandContext) {
        // console.log(egret);
        if(!this.libPaths.length) return;
        let version = egret.version;
        let projectDir = egret.args.projectDir;
        let output = "";
        let isMin = false;
        for(let libPath of this.libPaths) {
            let libContent = fs.readFileSync(libPath, "utf-8");
            output += libContent;
            output += "\n\n\n\n";
            if(libPath.indexOf(".min.js") >= 0) {
                isMin = true;
            }
        }
        let outName = projectDir + "js/" + "egret" + version + (isMin ? ".min.js" : ".js");
        console.log(outName);
        fs.writeFileSync(outName, output, {encoding: "utf8"});
    }
}

/**
 * 根据散图资源配置文件生成对应的图集资源配置文件
 */
export class CreateSheetResConfigPlugin implements plugins.Command {
    sheetRoot: string;
    outRoot: string;
    addPreloads: string[];
    resConfig: any;
    sheetDict: any = {};

    constructor(sheetRoot: string, outRoot: string, addPreloads?: string[]) {
        this.sheetRoot = sheetRoot;
        this.outRoot = outRoot;
        this.addPreloads = addPreloads;
        this.resConfig = JSON.parse(fs.readFileSync("resource/default.res.json", {encoding: "utf8"}));
    }

    createSheetBuffer(sheet: any): Buffer {
        return new Buffer(JSON.stringify(sheet, null, "\t"));
    }

    async onFile(file: plugins.File) {
        if(file.path.indexOf(this.sheetRoot) < 0) return file;
        if(file.extname.toLowerCase().indexOf("json") < 0) return file;
        this.sheetDict[file.relative] = file;
        console.log(file.basename, "检测九宫数据");
        let sheet = JSON.parse(file.contents.toString());
        let frames = sheet.frames;
        let needResave = false;

        //  console.log(file.basename, "检测九宫数据");

        let resConfig = this.resConfig;
        let getImage = (key: string): any => {
            for(let i = 0; i < resConfig.resources.length; i++) {
                let item = resConfig.resources[i];
                // console.log(item.name, key);
                if(item.name == key) {
                    // resConfig.resources.splice(i, 1);
                    return item;
                }
            }
            return null;
        }

        // deleteImage(sheetName);
        for(let key in frames) {
            // console.log(key);
            let item = getImage(key);
            // console.log(item);
            if(item && item.scale9grid) {
                frames[key].scale9grid = item.scale9grid;
                needResave = true;
            }
        }
        if(needResave) {                
            // file.contents = new Buffer(JSON.stringify(sheet, null, "\t"));
            file.contents = this.createSheetBuffer(sheet);
            console.log(file.basename, "生成九宫数据");
        }
        return file;
    }

    async onFinish(commandContext: plugins.CommandContext) {
        console.log("生成图集资源配置文件");
        let resConfig = JSON.parse(fs.readFileSync("resource/default.res.json", {encoding: "utf8"}));

        let grps: {name: string, keys: string}[] = resConfig.groups;
        let pregrp: {name: string, keys: string};
        for(let i = 0; i < grps.length; i++) {
            let tmpGrp = grps[i];
            if(tmpGrp.name == "pregrp") {
                pregrp = tmpGrp;
                break;
            }
        }

        // console.log(resConfig);
        let deleteImage = (key: string): any => {
            for(let i = 0; i < resConfig.resources.length; i++) {
                let item = resConfig.resources[i];
                // console.log(item.name, key);
                if(item.name == key) {
                    resConfig.resources.splice(i, 1);
                    return item;
                }
            }
            return null;
        }

        // let fileList = fs.readdirSync(`${this.outRoot}${this.sheetRoot}`);
        // for(let file of fileList) {
        //     if(file.indexOf('.json') < 0) continue;
        //     let sheetName = `${file.split(".").join("_")}`;
        //     let sheetPath = `${this.outRoot}${this.sheetRoot}/${file}`;
        //     // console.log(sheetPath);
        //     let sheet = JSON.parse(fs.readFileSync(sheetPath, {encoding: "utf8"}));
        //     let frames = sheet.frames;
        //     let needResave = false;
        //     deleteImage(sheetName);
        //     for(let key in frames) {
        //         // console.log(key);
        //         let item = deleteImage(key);
        //         // console.log(item);
        //         if(item && item.scale9grid) {
        //             frames[key].scale9grid = item.scale9grid;
        //             needResave = true;
        //         }
        //     }
        //     if(needResave) {                
        //         // fs.writeFileSync(sheetPath, JSON.stringify(sheet, null, "\t"), {encoding:"utf8"});
        //         commandContext.createFile(sheetPath, this.createSheetBuffer(sheet));
        //     }
        //     let sheetItem = {
        //         "url": `${this.sheetRoot}/${file}`,
		// 	    "type": "sheet",
		// 	    "name": sheetName,
		// 	    "subkeys": Object.keys(frames).join(",")
        //     };
        //     resConfig.resources.push(sheetItem);
        //     if(pregrp) {
        //         if(sheetName == "ui_sheet_common_json" || sheetName == "ui_sheet_mainUI_json") {
        //             pregrp.keys += `,${sheetName}`;
        //         }
        //     }
        // }

        let fileList = fs.readdirSync(`${this.outRoot}${this.sheetRoot}`);
        for(let path in this.sheetDict) {
            let file: plugins.File = this.sheetDict[path];
            let sheetName = `${file.basename.split(".").join("_")}`;
            let sheetPath = `${this.outRoot}${this.sheetRoot}/${file.basename}`;
            // console.log(sheetPath);
            let sheet = JSON.parse(file.contents.toString());
            let frames = sheet.frames;
            let needResave = false;
            deleteImage(sheetName);
            for(let key in frames) {
                // console.log(key);
                let item = deleteImage(key);
                // console.log(item);
                if(item && item.scale9grid && frames[key].scale9grid != item.scale9grid) {
                    frames[key].scale9grid = item.scale9grid;
                    needResave = true;
                }
            }
            if(needResave) {                
                // fs.writeFileSync(sheetPath, JSON.stringify(sheet, null, "\t"), {encoding:"utf8"});
                commandContext.createFile(sheetPath, this.createSheetBuffer(sheet));
            }
            let sheetItem = {
                "url": `${this.sheetRoot}/${file.basename}`,
			    "type": "sheet",
			    "name": sheetName,
			    "subkeys": Object.keys(frames).join(",")
            };
            resConfig.resources.push(sheetItem);
            if(pregrp) {
                if(sheetName == "ui_sheet_common_json" || sheetName == "ui_sheet_mainUI_json" || sheetName == "ui_sheet_main_common_json") {
                    pregrp.keys += `,${sheetName}`;
                }
                if(this.addPreloads) {
                    for(let item of this.addPreloads) {
                        if(pregrp.keys.indexOf(item) < 0) {
                            pregrp.keys += `,${item}`;
                        }
                    }
                }
            }
        }        

        fs.writeFileSync(`${this.outRoot}res.pub.json`, JSON.stringify(resConfig, null, "\t"), {encoding:"utf8"});
    }
}

/**
 * 生成图集项目文件
 */
export class SpriteSheetProjectPlugin implements plugins.Command {
    public mergeDirs: {[key:string]: string};
    public excludeDirs: string[];
    constructor(merge?: {[key:string]: string}, excludes?: string[]) {
        this.mergeDirs = merge || {};
        this.excludeDirs = excludes || [];
        this.create();
    }

    async onFile(file: plugins.File) {
        return file;
    }

    async onFinish(commandContext: plugins.CommandContext) {
    }

    create() {
        // let fileList = fs.readdirSync(`resource/texturemerger`);
        // for(let path of fileList) {
        //     if(path.indexOf(".tmproject") >= 0) {
        //         fs.unlinkSync(`resource/texturemerger/` + path);
        //     }
        // }
        let projectDir = egret.args.projectDir;
        let resConfigPath = `${projectDir}resource/default.res.json`;
        var resStr = fs.readFileSync(resConfigPath, {encoding: "utf-8"});
        var resConfig = JSON.parse(resStr);
        var resArr = resConfig.resources;
        var sheetDict = {};
        for(var i = 0; i < resArr.length; i++) {
            var res = resArr[i];
            res.url;
            res.type;
            res.name;
            if(res.type != "image") continue;
            if(res.url.indexOf("assets") != 0) continue;
            if(res.url.indexOf(".jpg") >= 0) continue;
            let pathArr = res.url.split("/");
            let sheetName = pathArr[1];
            //多个目录的资源合并到同一个图集
            sheetName = this.mergeDirs[sheetName] || sheetName;
            //过滤不需要合图的目录
            if(this.excludeDirs.indexOf(sheetName) >= 0) continue;
            if(!sheetDict[sheetName]) {
                sheetDict[sheetName] = [];
            }
            sheetDict[sheetName].push(res);
        }
        for(var key in sheetDict) {
            var tmproject = {}; //用来存放tmproject文件的信息
            // tmproject文件配置
            tmproject["options"] = {
                "layoutMath": "2",
                "sizeMode": "free",
                "useExtension": 1,
                "layoutGap": 1,
                "extend": 0
            };
            tmproject["version"] = 5;
            tmproject["projectName"] = "ui_sheet_" + key;
            tmproject["files"] = [];
            for(var i = 0; i < sheetDict[key].length; i++) {
                var res = sheetDict[key][i];
                tmproject["files"].push(`../${res.url}`);
            }
            fs.writeFileSync(path.join("resource/texturemerger", tmproject["projectName"] + ".tmproject"), JSON.stringify(tmproject, null, "\t"));   
        }     
    }
}

export class DeleteSheetProjectPlugin implements plugins.Command {
     async onFile(file: plugins.File) {
         return file;
     }

     async onFinish(commandContext: plugins.CommandContext) {
         let fileList = fs.readdirSync(`resource/texturemerger`);
        for(let path of fileList) {
            if(path.indexOf(".tmproject") >= 0) {
                fs.unlinkSync(`resource/texturemerger/` + path);
            }
        }
     }
}

/**
 * 文件crc32检测
 */
export class CheckCRC32Plugin implements plugins.Command {
    public filePath: string;
    public crc32Dict: any = {};
    public changedDict: any = {};
    constructor(path: string) {
        this.filePath = path;
        if(!fs.existsSync(this.filePath)) {
            console.log("crc32文件不存在", this.filePath);
            return;
        }
        var crc32Str = fs.readFileSync(this.filePath, {encoding: "utf-8"});
        this.crc32Dict = JSON.parse(crc32Str);
    }

    async onFile(file: plugins.File) {
        if(file.path.indexOf("texturemerger") < 0) {
            return file;
        }
        // console.log(file.basename, "检测CRC32");
        const crc32 = globals.getCrc32();
        const crc32code = crc32(file.contents);
        // if(this.changedDict[file.relative]) {
        //    return file;
        // }
        let recordCode = this.crc32Dict[file.relative];
        if(!recordCode || recordCode != crc32code) {
            console.log(file.relative, "文件发生改变", crc32code, recordCode);
            this.changedDict[file.relative] = crc32code;
            return file;
        }
        else {
             console.log(file.relative, "文件相同过滤", crc32code);
            return null;
        }
    }
    
    async onFinish(commandContext: plugins.CommandContext) {
        console.log("crc32执行完毕");
        for(let key in this.changedDict) {
            this.crc32Dict[key] = this.changedDict[key];
        }
        let str = JSON.stringify(this.crc32Dict, null, "\t");
        fs.writeFileSync(this.filePath, str);   
    }
}