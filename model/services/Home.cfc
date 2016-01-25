/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Home.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}

	<!--- query to generate homepage slideshow --->
	public function qrySlideshow() {
		return QueryExecute("SELECT		hs_id,
										hs_model,
										hs_caption,
										IFNULL(hs_link, '/Join') AS hs_link
							FROM		homepage_slideshow
							WHERE		hs_suspended = 0
							ORDER BY	hs_priority DESC,
										RAND()
							LIMIT		5",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
	

	<!--- latest updates --->
	public function qryLatestUpdates() {
		return QueryExecute("SELECT		galleries.gallery_id,
										galleries.release_date,
										galleries.tour_pic1,
										galleries.tour_pic2,
										galleries.tour_pic3,
										galleries.gallery_n_images,
										galleries.gallery_type,
										models.model_display_name,
										models.model_link,
										videos.video_total_time
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							LEFT JOIN	videos
							ON			galleries.video_clip_id = videos.video_id
							WHERE		galleries.release_date <= DATE(NOW())
							AND			galleries.show_future = 1
							AND			galleries.show_public = 1
							AND			galleries_models.gm_precedence = 1
							AND			models.model_show_public_area = 1
							AND			models.show_model_v2_tour = 1
							AND			models.model_not_advertised = 0
							GROUP BY	galleries.gallery_id
							ORDER BY	galleries.release_date DESC
							LIMIT		12",
							[
								
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
	
	
	<!--- latest models --->
	public function qryLatestModels() {
		return QueryExecute("SELECT		MIN(galleries.release_date) AS model_first_gallery,
										models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_images,
										models.model_n_galleries,
										models.model_n_videos
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		galleries.release_date <= NOW()
							AND			models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							GROUP BY	galleries.model_id
							ORDER BY	model_first_gallery DESC
							LIMIT		2",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
	
	<!--- last two months' top tease galleries --->
	public function qryLastedTwoMonth(numeric monthAgoMonth, numeric monthAgoYear) {
		return QueryExecute("SELECT		galleries.gallery_id,
										galleries.tour_pic1,
										galleries.tour_pic2,
										galleries.tour_pic3,
										galleries.model_id,
										galleries.release_date,
										galleries.average_tease,
										galleries.gallery_n_images,
										galleries.gallery_type,
										models.model_display_name,
										models.model_link,
										galleries.gallery_n_images AS image_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		MONTH(galleries.release_date) =?
							AND			YEAR(galleries.release_date) =?
							AND			galleries.gallery_type IN (?)
							AND			galleries.show_future = 1
							AND			galleries.show_public = 1
							AND			galleries_models.gm_precedence = 1
							AND			models.model_show_public_area = 1
							AND			models.show_model_v2_tour = 1
							AND			models.model_not_advertised = 0
							GROUP BY	galleries.gallery_id
							ORDER BY	average_tease DESC
							LIMIT		1",
							[
								{sqltype: "cf_sql_integer", value: monthAgoMonth},
								{sqltype: "cf_sql_integer", value: monthAgoYear},
								{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strPhotos}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
}