/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Dvds.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}


	public function qry_country(numeric ipNumber) {
		return QueryExecute("SELECT	ip_iso_country_code
							 FROM	ip2country
							 WHERE	ip_number_start <=:ip_number
							 AND	ip_number_end >=:ip_number",
							 [
							 	{sqltype: "cf_sql_integer", value: ipNumber},
							 	{sqltype: "cf_sql_integer", value: ipNumber},
							 ],
							 {
							 	datasource = "geo_data",
							 	cachedwithin:application.queryTimeCache
							 }
							 );
	}
}