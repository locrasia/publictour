component output="false" displayname="" accessors="true" {

	property UtilService;
	property JoinService;
	public function init(required any fw){
		variables.fw =arguments.fw;
		return this;
	}

	public function default(struct rc) {
		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		rc.strMetaTitle = 'Join ' & rc.strMetaTitle & ' for Sexy Girls in Sexy Lingerie';

		rc.paycom_username = UtilService.GenerateUsername();
		rc.paycom_password = UtilService.GeneratePassword();
		param name="session.price_form" default="";
		if(session.price_form != ""){
			var qry_pricepoints = JoinService.qry_pricepoints_1();
			var qry_description = JoinService.qry_description();
			var display_oas_prices = false;
			var display_ot_prices = false;
			var display_duo = false;
			for(record in qry_pricepoints){
				if (record.pp_site == "OnlyAllSites" && record.pp_type == "Credit"){
					display_oas_prices = true; break;
				}
			}
			for(record in qry_pricepoints){
				if (LCase(record.pp_site) == LCase(application.stcThisSite.strSiteName) && record.pp_type == "Credit"){
					display_ot_prices = true; break;
				}
			}
			if (display_oas_prices && display_ot_prices){
				display_duo = true;
			}
		}
	}

	public function pass(struct rc) {
		param name="session.referring_url" default="";
		var username = UtilService.GenerateUsername();
		var password = UtilService.GeneratePassword();
		var subscribe_value = 0; 
		var bCheck = false;
		var trans_location =  "";

		if(rc.site_selected == "site_oas"){

			if((rc.payment_left_value == "credit-card" && rc.payment_right_value == 'ccbill') or
		   		(rc.payment_left_value == "debit-card" && rc.payment_right_value == 'ccbill'))
			{
				var subscribe_value = rc.subscribe_value;
				bCheck = true;
			}
		
			if((rc.payment_left_value == "credit-card" && rc.payment_right_value == 'epoch') or
			   (rc.payment_left_value == "debit-card" && rc.payment_right_value == 'epoch'))
			{
				var subscribe_value = rc.subscribe_value + 20;
				bCheck = true;
			}

			if(rc.payment_left_value == "cash"){
				var trans_location = "/index.cfm/join/cash";
				bCheck = true;
			}

		}else if(rc.site_selected == 'site_ot'){
			if((rc.payment_left_value == "credit-card" && rc.payment_right_value == 'ccbill') or
		   		(rc.payment_left_value == "debit-card" && rc.payment_right_value == 'ccbill'))
			{
				var subscribe_value = rc.subscribe_value;
				bCheck = true;
			}

			if((rc.payment_left_value == "credit-card" && rc.payment_right_value == 'epoch') or
			   (rc.payment_left_value == "debit-card" && rc.payment_right_value == 'epoch')){
				var subscribe_value = rc.subscribe_value + 10;
				bCheck = true;
			}

			if(rc.payment_left_value == "us-online" && rc.payment_right_value == 'ccbill')
			{
				var subscribe_value = rc.subscribe_value + 5;
				bCheck = true;
			}

			if(rc.payment_left_value == "eu-bank" && rc.payment_right_value == 'ccbill')
			{
				var trans_location =  "https://bill.ccbill.com/jpost/signup.cgi";
				bCheck = true;
			}

			if(rc.payment_left_value == "cash"){
				var trans_location = "/index.cfm/join/cash";
				bCheck = true;
			}
		}

		
		if(bCheck == true){
			switch(subscribe_value)
			{
				case 1:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[1]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 2:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[2]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 3:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[3]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 4:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[4]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 5:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[5]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 6:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[6]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 7:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[7]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 8:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[8]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 9:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[9]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 10:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[10]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 11:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[11]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 12:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[12]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 13:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[13]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 14:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[14]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 15:
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=#application.stcThisSite.stcCCBill.strSubAccount#&cascadeId=#application.stcThisSite.stcCCBill.arrCascades[15]#&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				<!--- OnlyAllSites --->
				case 16: <!--- OAS ccbill 30days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=359&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 17: <!--- OAS ccbill 60days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=3551&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 18: <!--- OAS ccbill 90days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=3552&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 36: <!--- OAS epoch 30days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=360&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 37: <!--- OAS epoch 60days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=3555&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
					break;
				case 38: <!--- OAS epoch 90days recurring   --->
					var trans_location = "https://bill.ccbill.com/jpost/billingCascade.cgi?clientAccnum=920217&clientSubacc=0005&cascadeId=3556&username=#username#&password=#password#&OT_REFERRER=#session.referring_url#&OT_TOUR=V2";
				default:
					break;
			}
		}
		return variables.fw.renderData('json',{'success': bCheck,'link':trans_location});
	}	
}
