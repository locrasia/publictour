component output="false" displayname=""  {

	public function init(required any fw){
		variables.fw =fw;
		return this;
	}

	public function qrySitesData () {
		return QueryExecute("SELECT		site_id,
										site_name,
										site_code,
										site_dsn,
										site_url,
										site_afftour_url,
										site_domain,
										site_cdn_url,
										site_colour,
										site_pics_path,
										site_members_url,
										site_email,
										YEAR(site_updates_year_start) AS site_updates_year,
										site_ccbill_subaccount,
										site_ccbill_cascades,
										site_gallerytypes_photos,
										site_gallerytypes_videos,
										site_meta_title,
										site_meta_description,
										site_meta_keywords,
										site_introvideo_size_hd,
										site_introvideo_size_sd,
										site_homepage_whatsthis,
										site_updatespage_top,
										site_taglines,
										site_straplines,
										site_ga_account,
										site_ga_account_common,
										site_primary_processor
							FROM		tour_site_data
							ORDER BY	site_id",
							[],
							{
								datasource = "oas_data"
							});
	}

	public function qryOTCamsSplash () {
		return QueryExecute("SELECT  o_value
							FROM	options
							WHERE   o_name = 'otcamsTourSplash'",
							[],
							{
								datasource = "oas_data"
							});
	}

	public function qryCountStuff () {
		return QueryExecute("SELECT	COUNT(*) AS n_models,
									SUM(model_n_images) AS n_images,
									SUM(model_n_galleries) AS n_galleries,
									SUM(model_n_videos) AS n_videos
							FROM	models
							WHERE	model_show_public_area = 1",
							[],
							{
								datasource = application.dataSourceName
							});
	}
}