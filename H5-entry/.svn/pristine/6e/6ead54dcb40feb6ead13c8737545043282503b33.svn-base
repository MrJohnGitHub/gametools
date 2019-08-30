window.skins={};
                function __extends(d, b) {
                    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
                        function __() {
                            this.constructor = d;
                        }
                    __.prototype = b.prototype;
                    d.prototype = new __();
                };
                window.generateEUI = {};
                generateEUI.paths = {};
                generateEUI.styles = {"nstyle1":{"textColor":"0xe4a331","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle2":{"textColor":"0xd3c3b5","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle3":{"textColor":"0xe06d10","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle4":{"textColor":"0xa41a3b","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle5":{"textColor":"0x827a64","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle6":{"textColor":"0x7551db","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle7":{"textColor":"0x167734","fontFamily":"SimHei","strokeColor":"0","stroke":2},"nstyle8":{"textColor":"0x605e58","fontFamily":"SimHei","strokeColor":"0","stroke":2},"qstyle1":{"textColor":"0xdbdbd2","fontFamily":"SimHei","strokeColor":"0","stroke":2},"qstyle2":{"textColor":"0x18c54e","fontFamily":"SimHei","strokeColor":"0","stroke":2},"qstyle3":{"textColor":"0x1e7ec7","fontFamily":"SimHei","strokeColor":"0","stroke":2},"qstyle4":{"textColor":"0xbe48ef","fontFamily":"SimHei","strokeColor":"0","stroke":2},"qstyle5":{"textColor":"0xc31d1d","fontFamily":"SimHei","strokeColor":"0","stroke":2},"winTitle":{"textColor":"0xfcecc1","strokeColor":"0x6e3516","stroke":2,"size":26,"width":150,"textAlign":"center","fontFamily":"SimHei"},"stroke1":{"strokeColor":"0","stroke":2,"fontFamily":"SimHei"},"stroke2":{"strokeColor":"0","stroke":2,"fontFamily":"SimHei"},"stroke2Yellow":{"strokeColor":"0","stroke":2,"fontFamily":"SimHei","textColor":"0xDDC035"},"style1":{"textColor":"0xf9e077","strokeColor":"0x170f0f","stroke":2,"fontFamily":"SimHei"},"style2":{"textColor":"0xe4c09b","strokeColor":"0x170f0f","stroke":2,"fontFamily":"SimHei"},"style3":{"textColor":"0xddc035","strokeColor":"0x170f0f","stroke":2,"fontFamily":"SimHei"},"style4":{"textColor":"0xfcecc1","strokeColor":"0x6e3516","stroke":2,"fontFamily":"SimHei"},"style5":{"textColor":"0xfcecc1","fontFamily":"SimHei"},"btn_style1":{"textColor":"0xfcecc1","strokeColor":"0","stroke":2,"fontFamily":"SimHei"}};
                generateEUI.skins = {"eui.Button":"resource/eui_skins/ButtonSkin.exml"};generateEUI.paths['resource/eui_skins/ButtonSkin.exml'] = window.skins.ButtonSkin = (function (_super) {
	__extends(ButtonSkin, _super);
	function ButtonSkin() {
		_super.call(this);
		this.skinParts = ["iconDisplay","labelDisplay"];
		
		this.elementsContent = [this.iconDisplay_i(),this.labelDisplay_i()];
		this.states = [
			new eui.State ("up",
				[
					new eui.SetProperty("iconDisplay","horizontalCenter",0),
					new eui.SetProperty("iconDisplay","verticalCenter",0),
					new eui.SetProperty("labelDisplay","horizontalCenter",0),
					new eui.SetProperty("labelDisplay","verticalCenter",0)
				])
			,
			new eui.State ("down",
				[
					new eui.SetProperty("iconDisplay","percentWidth",90),
					new eui.SetProperty("iconDisplay","percentHeight",90),
					new eui.SetProperty("iconDisplay","horizontalCenter",0),
					new eui.SetProperty("iconDisplay","verticalCenter",0),
					new eui.SetProperty("labelDisplay","horizontalCenter",0),
					new eui.SetProperty("labelDisplay","verticalCenter",0)
				])
			,
			new eui.State ("disabled",
				[
					new eui.SetProperty("labelDisplay","verticalCenter",0),
					new eui.SetProperty("labelDisplay","horizontalCenter",0)
				])
		];
	}
	var _proto = ButtonSkin.prototype;

	_proto.iconDisplay_i = function () {
		var t = new eui.Image();
		this.iconDisplay = t;
		t.percentHeight = 100;
		t.percentWidth = 100;
		return t;
	};
	_proto.labelDisplay_i = function () {
		var t = new eui.Label();
		this.labelDisplay = t;
		t.bottom = 8;
		t.left = 8;
		t.right = 8;
		t.size = 20;
		t.textAlign = "center";
		t.textColor = 0xFFFFFF;
		t.top = 8;
		t.verticalAlign = "middle";
		return t;
	};
	return ButtonSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/login/EnterGameSceneSkin.exml'] = window.EnterGameSceneSkin = (function (_super) {
	__extends(EnterGameSceneSkin, _super);
	function EnterGameSceneSkin() {
		_super.call(this);
		this.skinParts = ["svrNameLabel","svrStateIcon","gonggaoBtn","enterBtn","selectBtn","closeBtn","pageList","serverList","selectSvrGrp"];
		
		this.height = 640;
		this.width = 1136;
		this.elementsContent = [this._Group1_i()];
	}
	var _proto = EnterGameSceneSkin.prototype;

	_proto._Group1_i = function () {
		var t = new eui.Group();
		t.horizontalCenter = 0;
		t.verticalCenter = 0;
		t.elementsContent = [this._Image1_i(),this._Image2_i(),this.svrNameLabel_i(),this.svrStateIcon_i(),this.gonggaoBtn_i(),this.enterBtn_i(),this.selectBtn_i(),this.selectSvrGrp_i()];
		return t;
	};
	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 640;
		t.source = "denglubg_jpg";
		t.width = 1136;
		t.x = 0;
		t.y = 0;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.source = "denglulxuanzhetiao_png";
		t.x = 328;
		t.y = 282;
		return t;
	};
	_proto.svrNameLabel_i = function () {
		var t = new eui.Label();
		this.svrNameLabel = t;
		t.style = "nstyle2";
		t.size = 20;
		t.text = "双线1区";
		t.x = 442;
		t.y = 305;
		return t;
	};
	_proto.svrStateIcon_i = function () {
		var t = new eui.Image();
		this.svrStateIcon = t;
		t.source = "svr_state_0_png";
		t.x = 395;
		t.y = 298;
		return t;
	};
	_proto.gonggaoBtn_i = function () {
		var t = new eui.Button();
		this.gonggaoBtn = t;
		t.icon = "gonggaoban_png";
		t.x = 27;
		t.y = 86;
		return t;
	};
	_proto.enterBtn_i = function () {
		var t = new eui.Button();
		this.enterBtn = t;
		t.icon = "jinruyouxianniu_png";
		t.x = 460;
		t.y = 397;
		return t;
	};
	_proto.selectBtn_i = function () {
		var t = new eui.Button();
		this.selectBtn = t;
		t.anchorOffsetY = 0;
		t.icon = "dianjixuanfu_png";
		t.x = 610;
		t.y = 301;
		return t;
	};
	_proto.selectSvrGrp_i = function () {
		var t = new eui.Group();
		this.selectSvrGrp = t;
		t.visible = false;
		t.x = 143;
		t.y = 33.67;
		t.elementsContent = [this._Image3_i(),this._Image4_i(),this._Image5_i(),this.closeBtn_i(),this._Image6_i(),this._Image7_i(),this._Image8_i(),this._Scroller1_i(),this._Scroller2_i()];
		return t;
	};
	_proto._Image3_i = function () {
		var t = new eui.Image();
		t.height = 562;
		t.source = "win1_top_back_png";
		t.width = 852;
		t.x = 0;
		t.y = 7.33;
		return t;
	};
	_proto._Image4_i = function () {
		var t = new eui.Image();
		t.height = 48;
		t.source = "tongyongbiaoti_png";
		t.width = 320;
		t.x = 266;
		t.y = 0;
		return t;
	};
	_proto._Image5_i = function () {
		var t = new eui.Image();
		t.source = "btxuanzhefuwuqi_png";
		t.x = 349;
		t.y = 6;
		return t;
	};
	_proto.closeBtn_i = function () {
		var t = new eui.Button();
		this.closeBtn = t;
		t.icon = "win_close1_png";
		t.skinName = "skins.ButtonSkin";
		t.x = 804;
		t.y = 8.33;
		return t;
	};
	_proto._Image6_i = function () {
		var t = new eui.Image();
		t.height = 512;
		t.source = "win_back1_png";
		t.width = 590;
		t.x = 256;
		t.y = 50.33;
		return t;
	};
	_proto._Image7_i = function () {
		var t = new eui.Image();
		t.height = 512;
		t.source = "win_back1_png";
		t.width = 252;
		t.x = 4;
		t.y = 50.33;
		return t;
	};
	_proto._Image8_i = function () {
		var t = new eui.Image();
		t.height = 486;
		t.source = "win_back2_png";
		t.width = 226;
		t.x = 17;
		t.y = 63.33;
		return t;
	};
	_proto._Scroller1_i = function () {
		var t = new eui.Scroller();
		t.height = 440;
		t.width = 219;
		t.x = 20;
		t.y = 66.33;
		t.viewport = this.pageList_i();
		return t;
	};
	_proto.pageList_i = function () {
		var t = new eui.List();
		this.pageList = t;
		t.itemRendererSkinName = SvrPageItemSkin;
		t.dataProvider = this._ArrayCollection1_i();
		t.layout = this._TileLayout1_i();
		return t;
	};
	_proto._ArrayCollection1_i = function () {
		var t = new eui.ArrayCollection();
		t.source = [this._Object1_i(),this._Object2_i(),this._Object3_i(),this._Object4_i(),this._Object5_i(),this._Object6_i(),this._Object7_i()];
		return t;
	};
	_proto._Object1_i = function () {
		var t = {};
		return t;
	};
	_proto._Object2_i = function () {
		var t = {};
		return t;
	};
	_proto._Object3_i = function () {
		var t = {};
		return t;
	};
	_proto._Object4_i = function () {
		var t = {};
		return t;
	};
	_proto._Object5_i = function () {
		var t = {};
		return t;
	};
	_proto._Object6_i = function () {
		var t = {};
		return t;
	};
	_proto._Object7_i = function () {
		var t = {};
		return t;
	};
	_proto._TileLayout1_i = function () {
		var t = new eui.TileLayout();
		t.verticalGap = 0;
		return t;
	};
	_proto._Scroller2_i = function () {
		var t = new eui.Scroller();
		t.height = 482;
		t.width = 564;
		t.x = 269;
		t.y = 64.33;
		t.viewport = this.serverList_i();
		return t;
	};
	_proto.serverList_i = function () {
		var t = new eui.List();
		this.serverList = t;
		t.itemRendererSkinName = SvrInfoItemSkin;
		t.dataProvider = this._ArrayCollection2_i();
		t.layout = this._TileLayout2_i();
		return t;
	};
	_proto._ArrayCollection2_i = function () {
		var t = new eui.ArrayCollection();
		t.source = [this._Object8_i(),this._Object9_i(),this._Object10_i(),this._Object11_i(),this._Object12_i(),this._Object13_i(),this._Object14_i()];
		return t;
	};
	_proto._Object8_i = function () {
		var t = {};
		return t;
	};
	_proto._Object9_i = function () {
		var t = {};
		return t;
	};
	_proto._Object10_i = function () {
		var t = {};
		return t;
	};
	_proto._Object11_i = function () {
		var t = {};
		return t;
	};
	_proto._Object12_i = function () {
		var t = {};
		return t;
	};
	_proto._Object13_i = function () {
		var t = {};
		return t;
	};
	_proto._Object14_i = function () {
		var t = {};
		return t;
	};
	_proto._TileLayout2_i = function () {
		var t = new eui.TileLayout();
		t.horizontalGap = 2;
		t.requestedColumnCount = 2;
		return t;
	};
	return EnterGameSceneSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/login/LoginSceneSkin.exml'] = window.LoginSceneSkin = (function (_super) {
	__extends(LoginSceneSkin, _super);
	function LoginSceneSkin() {
		_super.call(this);
		this.skinParts = ["loginBtn","accountInput","pwdInput"];
		
		this.height = 640;
		this.width = 1136;
		this.elementsContent = [this._Group2_i()];
	}
	var _proto = LoginSceneSkin.prototype;

	_proto._Group2_i = function () {
		var t = new eui.Group();
		t.horizontalCenter = 0;
		t.verticalCenter = 0;
		t.elementsContent = [this._Image1_i(),this._Image2_i(),this._Group1_i()];
		return t;
	};
	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 640;
		t.source = "loadingbgbg_jpg";
		t.width = 1136;
		t.x = 0;
		t.y = 0;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.source = "gonggaoban_png";
		t.x = 27;
		t.y = 86;
		return t;
	};
	_proto._Group1_i = function () {
		var t = new eui.Group();
		t.x = 375;
		t.y = 183;
		t.elementsContent = [this._Image3_i(),this._Image4_i(),this._Image5_i(),this._Image6_i(),this.loginBtn_i(),this._Label1_i(),this._Label2_i(),this.accountInput_i(),this.pwdInput_i()];
		return t;
	};
	_proto._Image3_i = function () {
		var t = new eui.Image();
		t.height = 239;
		t.source = "win1_top_back_png";
		t.width = 380;
		t.x = 0;
		t.y = 0;
		return t;
	};
	_proto._Image4_i = function () {
		var t = new eui.Image();
		t.height = 192;
		t.scaleX = 1;
		t.scaleY = 1;
		t.source = "";
		t.width = 370;
		t.x = 5;
		t.y = 43;
		return t;
	};
	_proto._Image5_i = function () {
		var t = new eui.Image();
		t.height = 28;
		t.source = "progress_back1_png";
		t.width = 171;
		t.x = 131;
		t.y = 75;
		return t;
	};
	_proto._Image6_i = function () {
		var t = new eui.Image();
		t.alpha = 1;
		t.height = 28;
		t.source = "progress_back1_png";
		t.width = 171;
		t.x = 131;
		t.y = 114;
		return t;
	};
	_proto.loginBtn_i = function () {
		var t = new eui.Button();
		this.loginBtn = t;
		t.height = 45;
		t.icon = "btn1_up_png";
		t.label = "登录账号";
		t.width = 128;
		t.x = 126;
		t.y = 168;
		return t;
	};
	_proto._Label1_i = function () {
		var t = new eui.Label();
		t.style = "nstyle1";
		t.size = 20;
		t.text = "账号";
		t.x = 76;
		t.y = 78;
		return t;
	};
	_proto._Label2_i = function () {
		var t = new eui.Label();
		t.style = "nstyle1";
		t.size = 20;
		t.text = "密码";
		t.x = 76;
		t.y = 117;
		return t;
	};
	_proto.accountInput_i = function () {
		var t = new eui.EditableText();
		this.accountInput = t;
		t.size = 18;
		t.text = "test1";
		t.textAlign = "center";
		t.textColor = 0xd3c3b5;
		t.verticalAlign = "middle";
		t.width = 140;
		t.x = 147;
		t.y = 80;
		return t;
	};
	_proto.pwdInput_i = function () {
		var t = new eui.EditableText();
		this.pwdInput = t;
		t.displayAsPassword = true;
		t.size = 18;
		t.text = "test1";
		t.textAlign = "center";
		t.textColor = 0xD3C3B5;
		t.verticalAlign = "middle";
		t.width = 140;
		t.x = 147;
		t.y = 112;
		return t;
	};
	return LoginSceneSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/login/SelectClientSceneSkin.exml'] = window.SelectClientSceneSkin = (function (_super) {
	__extends(SelectClientSceneSkin, _super);
	function SelectClientSceneSkin() {
		_super.call(this);
		this.skinParts = ["serverList","selectSvrGrp"];
		
		this.height = 640;
		this.width = 1136;
		this.elementsContent = [this._Image1_i(),this.selectSvrGrp_i()];
	}
	var _proto = SelectClientSceneSkin.prototype;

	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 640;
		t.source = "denglubg_jpg";
		t.width = 1136;
		t.x = 0;
		t.y = 0;
		return t;
	};
	_proto.selectSvrGrp_i = function () {
		var t = new eui.Group();
		this.selectSvrGrp = t;
		t.x = 143;
		t.y = 33.67;
		t.elementsContent = [this._Image2_i(),this._Image3_i(),this._Image4_i(),this._Image5_i(),this._Scroller1_i()];
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.height = 562;
		t.source = "win1_top_back_png";
		t.width = 852;
		t.x = 0;
		t.y = 7.33;
		return t;
	};
	_proto._Image3_i = function () {
		var t = new eui.Image();
		t.height = 48;
		t.source = "tongyongbiaoti_png";
		t.width = 320;
		t.x = 266;
		t.y = 0;
		return t;
	};
	_proto._Image4_i = function () {
		var t = new eui.Image();
		t.source = "btxuanzhefuwuqi_png";
		t.x = 349;
		t.y = 6;
		return t;
	};
	_proto._Image5_i = function () {
		var t = new eui.Image();
		t.anchorOffsetX = 0;
		t.height = 512;
		t.source = "win_back1_png";
		t.width = 837;
		t.x = 9;
		t.y = 50.33;
		return t;
	};
	_proto._Scroller1_i = function () {
		var t = new eui.Scroller();
		t.anchorOffsetX = 0;
		t.anchorOffsetY = 0;
		t.height = 481;
		t.x = 23;
		t.y = 64.33;
		t.viewport = this.serverList_i();
		return t;
	};
	_proto.serverList_i = function () {
		var t = new eui.List();
		this.serverList = t;
		t.itemRendererSkinName = ClientItemSkin;
		t.dataProvider = this._ArrayCollection1_i();
		t.layout = this._TileLayout1_i();
		return t;
	};
	_proto._ArrayCollection1_i = function () {
		var t = new eui.ArrayCollection();
		t.source = [this._Object1_i(),this._Object2_i(),this._Object3_i(),this._Object4_i(),this._Object5_i(),this._Object6_i(),this._Object7_i()];
		return t;
	};
	_proto._Object1_i = function () {
		var t = {};
		return t;
	};
	_proto._Object2_i = function () {
		var t = {};
		return t;
	};
	_proto._Object3_i = function () {
		var t = {};
		return t;
	};
	_proto._Object4_i = function () {
		var t = {};
		return t;
	};
	_proto._Object5_i = function () {
		var t = {};
		return t;
	};
	_proto._Object6_i = function () {
		var t = {};
		return t;
	};
	_proto._Object7_i = function () {
		var t = {};
		return t;
	};
	_proto._TileLayout1_i = function () {
		var t = new eui.TileLayout();
		t.horizontalGap = 4;
		t.requestedColumnCount = 3;
		return t;
	};
	return SelectClientSceneSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/login/SelectSvrWinSkin.exml'] = window.SelectSvrWinSkin = (function (_super) {
	__extends(SelectSvrWinSkin, _super);
	function SelectSvrWinSkin() {
		_super.call(this);
		this.skinParts = [];
		
		this.height = 640;
		this.width = 1136;
		this.elementsContent = [this._Group1_i()];
	}
	var _proto = SelectSvrWinSkin.prototype;

	_proto._Group1_i = function () {
		var t = new eui.Group();
		t.x = 143;
		t.y = 33.67;
		t.elementsContent = [this._Image1_i(),this._Image2_i(),this._Image3_i(),this._Button1_i(),this._Image4_i(),this._Image5_i(),this._Image6_i(),this._Scroller1_i(),this._Scroller2_i()];
		return t;
	};
	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 562;
		t.source = "win1_top_back_png";
		t.width = 852;
		t.x = 0;
		t.y = 7.33;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.height = 48;
		t.source = "tongyongbiaoti_png";
		t.width = 320;
		t.x = 266;
		t.y = 0;
		return t;
	};
	_proto._Image3_i = function () {
		var t = new eui.Image();
		t.source = "btxuanzhefuwuqi_png";
		t.x = 349;
		t.y = 6;
		return t;
	};
	_proto._Button1_i = function () {
		var t = new eui.Button();
		t.icon = "win_close1_png";
		t.skinName = "skins.ButtonSkin";
		t.x = 804;
		t.y = 8.33;
		return t;
	};
	_proto._Image4_i = function () {
		var t = new eui.Image();
		t.height = 512;
		t.source = "win_back1_png";
		t.width = 590;
		t.x = 256;
		t.y = 50.33;
		return t;
	};
	_proto._Image5_i = function () {
		var t = new eui.Image();
		t.height = 512;
		t.source = "win_back1_png";
		t.width = 252;
		t.x = 4;
		t.y = 50.33;
		return t;
	};
	_proto._Image6_i = function () {
		var t = new eui.Image();
		t.height = 486;
		t.source = "win_back2_png";
		t.width = 226;
		t.x = 17;
		t.y = 63.33;
		return t;
	};
	_proto._Scroller1_i = function () {
		var t = new eui.Scroller();
		t.height = 440;
		t.width = 219;
		t.x = 20;
		t.y = 66.33;
		t.viewport = this._List1_i();
		return t;
	};
	_proto._List1_i = function () {
		var t = new eui.List();
		t.itemRendererSkinName = SvrPageItemSkin;
		t.dataProvider = this._ArrayCollection1_i();
		t.layout = this._VerticalLayout1_i();
		return t;
	};
	_proto._ArrayCollection1_i = function () {
		var t = new eui.ArrayCollection();
		t.source = [this._Object1_i(),this._Object2_i(),this._Object3_i(),this._Object4_i(),this._Object5_i(),this._Object6_i(),this._Object7_i()];
		return t;
	};
	_proto._Object1_i = function () {
		var t = {};
		return t;
	};
	_proto._Object2_i = function () {
		var t = {};
		return t;
	};
	_proto._Object3_i = function () {
		var t = {};
		return t;
	};
	_proto._Object4_i = function () {
		var t = {};
		return t;
	};
	_proto._Object5_i = function () {
		var t = {};
		return t;
	};
	_proto._Object6_i = function () {
		var t = {};
		return t;
	};
	_proto._Object7_i = function () {
		var t = {};
		return t;
	};
	_proto._VerticalLayout1_i = function () {
		var t = new eui.VerticalLayout();
		t.gap = 2;
		return t;
	};
	_proto._Scroller2_i = function () {
		var t = new eui.Scroller();
		t.height = 482;
		t.width = 564;
		t.x = 269;
		t.y = 64.33;
		t.viewport = this._List2_i();
		return t;
	};
	_proto._List2_i = function () {
		var t = new eui.List();
		t.itemRendererSkinName = SvrInfoItemSkin;
		t.dataProvider = this._ArrayCollection2_i();
		t.layout = this._TileLayout1_i();
		return t;
	};
	_proto._ArrayCollection2_i = function () {
		var t = new eui.ArrayCollection();
		t.source = [this._Object8_i(),this._Object9_i(),this._Object10_i(),this._Object11_i(),this._Object12_i(),this._Object13_i(),this._Object14_i()];
		return t;
	};
	_proto._Object8_i = function () {
		var t = {};
		return t;
	};
	_proto._Object9_i = function () {
		var t = {};
		return t;
	};
	_proto._Object10_i = function () {
		var t = {};
		return t;
	};
	_proto._Object11_i = function () {
		var t = {};
		return t;
	};
	_proto._Object12_i = function () {
		var t = {};
		return t;
	};
	_proto._Object13_i = function () {
		var t = {};
		return t;
	};
	_proto._Object14_i = function () {
		var t = {};
		return t;
	};
	_proto._TileLayout1_i = function () {
		var t = new eui.TileLayout();
		t.horizontalGap = 2;
		t.requestedColumnCount = 2;
		t.verticalGap = 2;
		return t;
	};
	return SelectSvrWinSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/selectsvr/ClientItemSkin.exml'] = window.ClientItemSkin = (function (_super) {
	__extends(ClientItemSkin, _super);
	function ClientItemSkin() {
		_super.call(this);
		this.skinParts = ["nameLabel","urlLabel"];
		
		this.elementsContent = [this._Image1_i(),this._Image2_i(),this.nameLabel_i(),this.urlLabel_i()];
	}
	var _proto = ClientItemSkin.prototype;

	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.anchorOffsetX = 0;
		t.height = 96;
		t.source = "xinkuang003_png";
		t.width = 266;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.anchorOffsetX = 0;
		t.height = 33;
		t.source = "chengjiutupian03_png";
		t.width = 256;
		t.x = 2;
		t.y = 1;
		return t;
	};
	_proto.nameLabel_i = function () {
		var t = new eui.Label();
		this.nameLabel = t;
		t.style = "nstyle2";
		t.size = 18;
		t.text = "双线1090区";
		t.textColor = 0xf71607;
		t.x = 15;
		t.y = 8.5;
		return t;
	};
	_proto.urlLabel_i = function () {
		var t = new eui.Label();
		this.urlLabel = t;
		t.style = "nstyle2";
		t.anchorOffsetX = 0;
		t.anchorOffsetY = 0;
		t.height = 38;
		t.size = 18;
		t.text = "双线1090区";
		t.width = 237;
		t.x = 15;
		t.y = 48;
		return t;
	};
	return ClientItemSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/selectsvr/SvrInfoItemSkin.exml'] = window.SvrInfoItemSkin = (function (_super) {
	__extends(SvrInfoItemSkin, _super);
	function SvrInfoItemSkin() {
		_super.call(this);
		this.skinParts = ["lastLoginLabel","nameLabel","stateIcon","suggestIcon"];
		
		this.height = 96;
		this.width = 280;
		this.elementsContent = [this._Image1_i(),this._Image2_i(),this.lastLoginLabel_i(),this.nameLabel_i(),this.stateIcon_i(),this.suggestIcon_i()];
	}
	var _proto = SvrInfoItemSkin.prototype;

	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 96;
		t.source = "xinkuang003_png";
		t.width = 280;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		t.height = 33;
		t.source = "chengjiutupian03_png";
		t.width = 274;
		t.x = 2;
		t.y = 1;
		return t;
	};
	_proto.lastLoginLabel_i = function () {
		var t = new eui.Label();
		this.lastLoginLabel = t;
		t.style = "nstyle1";
		t.size = 20;
		t.text = "上次登陆";
		t.visible = false;
		t.x = 12;
		t.y = 7;
		return t;
	};
	_proto.nameLabel_i = function () {
		var t = new eui.Label();
		this.nameLabel = t;
		t.style = "nstyle2";
		t.size = 18;
		t.text = "双线1090区";
		t.x = 66;
		t.y = 54;
		return t;
	};
	_proto.stateIcon_i = function () {
		var t = new eui.Image();
		this.stateIcon = t;
		t.source = "svr_state_0_png";
		t.x = 21;
		t.y = 46;
		return t;
	};
	_proto.suggestIcon_i = function () {
		var t = new eui.Image();
		this.suggestIcon = t;
		t.source = "tuijianbiaoqian_png";
		t.x = 200;
		t.y = 46;
		return t;
	};
	return SvrInfoItemSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/module/selectsvr/SvrPageItemSkin.exml'] = window.SvrPageItemSkin = (function (_super) {
	__extends(SvrPageItemSkin, _super);
	function SvrPageItemSkin() {
		_super.call(this);
		this.skinParts = ["nameLabel"];
		
		this.elementsContent = [this._Image1_i(),this._Image2_i(),this.nameLabel_i()];
		this.states = [
			new eui.State ("up",
				[
				])
			,
			new eui.State ("down",
				[
					new eui.SetProperty("_Image2","visible",false)
				])
		];
	}
	var _proto = SvrPageItemSkin.prototype;

	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.height = 62;
		t.source = "teshuyeqian02_png";
		t.width = 219;
		return t;
	};
	_proto._Image2_i = function () {
		var t = new eui.Image();
		this._Image2 = t;
		t.height = 62;
		t.source = "teshuyeqian01_png";
		t.width = 219;
		t.x = 0;
		t.y = 0;
		return t;
	};
	_proto.nameLabel_i = function () {
		var t = new eui.Label();
		this.nameLabel = t;
		t.style = "nstyle2";
		t.size = 22;
		t.text = "最近登录";
		t.x = 66;
		t.y = 20;
		return t;
	};
	return SvrPageItemSkin;
})(eui.Skin);generateEUI.paths['resource/eui_skins/ProgressBarSkin.exml'] = window.skins.ProgressBarSkin = (function (_super) {
	__extends(ProgressBarSkin, _super);
	function ProgressBarSkin() {
		_super.call(this);
		this.skinParts = ["thumb","labelDisplay"];
		
		this.minHeight = 18;
		this.minWidth = 30;
		this.elementsContent = [this._Image1_i(),this.thumb_i(),this.labelDisplay_i()];
	}
	var _proto = ProgressBarSkin.prototype;

	_proto._Image1_i = function () {
		var t = new eui.Image();
		t.percentHeight = 100;
		t.scale9Grid = new egret.Rectangle(1,1,4,4);
		t.source = "track_pb_png";
		t.verticalCenter = 0;
		t.percentWidth = 100;
		return t;
	};
	_proto.thumb_i = function () {
		var t = new eui.Image();
		this.thumb = t;
		t.percentHeight = 100;
		t.source = "thumb_pb_png";
		t.percentWidth = 100;
		return t;
	};
	_proto.labelDisplay_i = function () {
		var t = new eui.Label();
		this.labelDisplay = t;
		t.fontFamily = "Tahoma";
		t.horizontalCenter = 0;
		t.size = 15;
		t.textAlign = "center";
		t.textColor = 0x707070;
		t.verticalAlign = "middle";
		t.verticalCenter = 0;
		return t;
	};
	return ProgressBarSkin;
})(eui.Skin);