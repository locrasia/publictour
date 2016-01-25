component accessors="true" output="false" displayname=""  {

	public function init(required any fw){
		variables.fw =fw;
		return this;
	}
	
	public array function getTickerContent() {
		var qry_otcams_status = QueryExecute(
												"SELECT
													os.otc_model_name,
													cs.supplier_name,
													cs.supplier_url

												FROM
													otcams_status os

												INNER JOIN
													cam_supplier cs
													ON os.cam_supplier_id = cs.supplier_id

												WHERE
													os.otc_status='online'"
											);
		var todayDate = Now();
		var todayYear = DatePart("yyyy", todayDate);
		var todayMth = DatePart("m", todayDate);
		var todayDay = DatePart("d", todayDate);
		var newday = 0;
		var newMth = 0;
		var newYear = 0;

		var DaysinMth = DaysInMonth(now());

		if(todayDay + 7 gt DaysinMth) {

			daysLeftInMth = DaysinMth - todayDay;
			daystoadd = 7 - daysLeftInMth;
			newday = daystoadd;

			if(todayMth neq 12) {
				newMth = todayMth + 1;
				newYear = todayYear;
			}
			else {
				newMth = 1;
				 newYear = todayYear + 1;
			}

		}
		else {

			newday = todayDay + 7;
			newMth = todayMth;
			newYear = todayYear;

		}

		var qry_showtimes = QueryExecute(
											"SELECT
												os.ots_model_name,
												os.ots_day_of_week,
												os.ots_time,
												cs.supplier_name,
												cs.supplier_url

											FROM
												otcams_showtimes os

											INNER JOIN
												cam_supplier cs
												ON os.cam_supplier_id=cs.supplier_id

											WHERE
												os.ots_date BETWEEN ? AND ?
												AND os.ots_deleted = 0
												AND cs.supplier_active = 1

											ORDER BY
												os.ots_date",
											[
												{sqltype="cf_sql_date", value="#todayYear#/#todayMth#/#todayDay#"},
												{sqltype="cf_sql_date", value="#newYear#/#newMth#/#newday#"}
											]
										);
		var ticker_content = [];

		if (qry_otcams_status.recordCount > 0){
			for (i=1; i<=qry_otcams_status.recordCount; i++){
				ticker_content.add('[''<a href="#qry_otcams_status.supplier_url[i]#" target="_blank">#qry_otcams_status.otc_model_name[i]# is now online at #qry_otcams_status.supplier_name[i]#</a>'',1]');
			}
		}

		if (qry_showtimes.recordCount > 0){
			for (i=1; i<=qry_showtimes.recordCount; i++){
				when_day = (qry_showtimes.ots_day_of_week[i] == 'Today') ? '' : 'on ' & qry_showtimes.ots_day_of_week[i];
				when_time = (qry_showtimes.ots_time[i] == '') ? '' : 'at ' & timeFormat(qry_showtimes.ots_time[i],'HH:mm') & ' GMT';
				what_site = " on " &qry_showtimes.supplier_name[i];
				ticker_content.add('[''<a href="#qry_showtimes.supplier_url[i]#" target="_blank">#qry_showtimes.ots_model_name[i]# #when_day# #when_time# #what_site#</a>'',0]');
			}
		}
		return ticker_content;
	}

	public struct function pagingConfig(numeric totalRecords, numeric curPage, numeric disCount, string addedPath, string urlTemplate, string show_type="Images") {
		//paging
		var stc_config = {};
		stc_config.TOTALRECORDS=totalRecords;
		stc_config.CURRENTPAGE=curPage;
		stc_config.TEMPLATEURL="#urlTemplate#";
		stc_config.ADDEDPATH="#addedPath#";
		stc_config.DISPLAYCOUNT=#disCount#;
		stc_config.PAGEGROUP="5";

		var Start = (stc_config.CurrentPage - 1) * stc_config.DISPLAYCOUNT + 1;
		var End = stc_config.CurrentPage * stc_config.DisplayCount;
		End = IIf(End GT stc_config.TotalRecords, stc_config.TotalRecords, End);
		var display_start_row = IIf(End, Start, 0);

		stc_config.SHOW_TYPE = show_type;
		stc_config.START_ROW = display_start_row;
		stc_config.END_ROW = End;
		//end paging

		return stc_config;
	}

	string function GeneratePassword(numeric gp_password_length=8) {
		var gp_available_characters = "a,b,c,d,e,f,g,h,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,K,L,M,N,P,Q,R,S,T,U,V,W,X,Y,Z,2,3,4,5,6,7,8,9";
		var gp_password_string = "";
		for(var i=1;i<=gp_password_length;i++)
		{
			gp_password_string = gp_password_string & "#ListGetAt(gp_available_characters,RandRange(1,ListLen(gp_available_characters)))#"
		}
		return gp_password_string;
	}

	string function GenerateUsername(numeric gp_username_length=8){
		var gp_available_characters = "a,b,c,d,e,f,g,h,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,K,L,M,N,P,Q,R,S,T,U,V,W,X,Y,Z,2,3,4,5,6,7,8,9";
		var username_ok = false;
		while(username_ok EQ false){
			var gp_username_string = "";
			for(var i=1;i<=gp_username_length;i++){
				gp_username_string = gp_username_string & "#ListGetAt(gp_available_characters,RandRange(1,ListLen(gp_available_characters)))#";
			}
			username_ok = testUsername(gp_username_string);
		}
		return gp_username_string;
	}

	public boolean function testUsername(string username_to_test required) {
		var qry_username = QueryExecute("SELECT  user_name
									 	 FROM	ot_users
										 WHERE	user_name = ?
										 UNION
										 SELECT  user_name
									 	 FROM	oas_users
										 WHERE	user_name = ?",
										[
											{sqltype: "CF_SQL_VARCHAR", maxlength: 30, value: username_to_test},
											{sqltype: "CF_SQL_VARCHAR", maxlength: 30, value: username_to_test}
										],
										{
											datasource: "authentication"
										});
		
		if (qry_username.recordcount EQ 0){
			return true;
		}
		else{
			return false;
		}		
	}
}