/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Newsletter.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}


	public function emailCheck(string email, numeric listId) {
		return 	QueryExecute("SELECT		mea_email_address,
											mea_active
								FROM		mail_email_addresses
								WHERE		mea_email_address =:email
								AND			mea_list_id =:id",
						[
							{sqltype: "cf_sql_varchar", value: email},
							{sqltype: "cf_sql_integer", value: listId}		
						],
						{
							datasource = "ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}


	public function emailUpdate(string serial, string email, numeric listId) {
		return QueryExecute("UPDATE		mail_email_addresses
								SET			mea_serial_code =:serial
								WHERE		mea_email_address =:email
								AND			mea_list_id =:id",
						[
							{sqltype: "cf_sql_varchar", value: serial},
							{sqltype: "cf_sql_varchar", value: email},
							{sqltype: "cf_sql_integer", value: listId}
						],	
						{
							datasource = "ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}


	public function emailAdd(string email, numeric listId, string serial) {
		return 	QueryExecute("INSERT INTO	mail_email_addresses
								(
								mea_email_address,
								mea_list_id,
								mea_active,
								mea_date_subscribed,
								mea_serial_code
								)
								VALUES	(
										:email,
										:id,
										0,
										NOW(),
										:serial
										)",
						[
							{sqltype: "cf_sql_varchar", value: email},
							{sqltype: "cf_sql_integer", value: listId},
							{sqltype: "cf_sql_varchar", value: serial}
						],
						{
							datasource = "ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}
}