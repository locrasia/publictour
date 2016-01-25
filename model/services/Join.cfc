/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Join.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}

	<!--- get the price points for the form --->
	public function qry_pricepoints_1() {	
		return QueryExecute("SELECT		price_points.pp_id,
										price_points.pp_button_image,
										price_points.pp_button_alttext,
										price_points.pp_site,
										price_points.pp_processor,
										price_points.pp_type
							FROM		price_points
							LEFT JOIN	pricepoint_linking
							ON 			price_points.pp_id = pricepoint_linking.ppl_pricepoints
							WHERE		pricepoint_linking.ppl_pricegroup = ?
							AND			price_points.pp_active = 1
							AND			price_points.pp_deleted = 0
							ORDER BY	pricepoint_linking.ppl_order",
							[
								{sqltype: "cf_sql_integer", value: session.price_form}
							],
							{
								datasource = "ot2004_data",
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- get a description for the form if there is one --->
	public function qry_description() {
		return QueryExecute("SELECT	p_description
							FROM	prices
							WHERE	p_id = ?",
							[
								{sqltype: "cf_sql_integer", value: session.price_form}
							],
							{
								datasource = "ot2004_data",
								cachedwithin:application.queryTimeCache
							});
	}


	public any function qry_pricepoints_2(numeric ppId) {
		return QueryExecute("SELECT	price_points.pp_id,
									price_points.pp_clientAccnum,
									price_points.pp_clientSubacc,
									price_points.pp_cascadeId
							FROM	price_points
							WHERE	price_points.pp_id = ?
							AND		price_points.pp_active = 1
							AND		price_points.pp_deleted = 0",
							[
								{sqltype: "cf_sql_integer", value: ppId}
							],
							{
								datasource = "ot2004_data",
								cachedwithin:application.queryTimeCache
							});
	}
}