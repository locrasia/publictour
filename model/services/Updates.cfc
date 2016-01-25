/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Updates.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}

	<!--- set latest photos and videos querys to today's application structure --->
	public function qryLatestUpdates(numeric page=0) {
		return 	QueryExecute("SELECT		galleries.gallery_id,
											DATE(galleries.release_date) AS release_date,
											galleries.tour_pic1,
											galleries.tour_pic2,
											galleries.tour_pic3,
											galleries.gallery_n_images,
											galleries.gallery_type,
											gallery_type.gallery_type_display_text,
											models.model_display_name,
											models.model_link,
											videos.video_total_time
								FROM		galleries
								INNER JOIN	gallery_type
								ON			galleries.gallery_type = gallery_type.gallery_type_id
								INNER JOIN	galleries_models
								ON			galleries.gallery_id = galleries_models.gm_gallery_id
								INNER JOIN	models
								ON			galleries_models.gm_model_id = models.model_id
								LEFT JOIN	videos
								ON			galleries.video_clip_id = videos.video_id
								WHERE		DATE(galleries.release_date) <= DATE(NOW())
								AND			galleries.show_future = 1
								AND			galleries.show_public = 1
								AND			galleries_models.gm_precedence = 1
								AND			models.model_show_public_area = 1
								AND			models.show_model_v2_tour = 1
								AND			models.model_not_advertised = 0
								GROUP BY	galleries.gallery_id
								ORDER BY	galleries.release_date DESC
								LIMIT		12
								OFFSET 		?",
						[
							{sqltype: "cf_sql_integer", value: page * 12}
						],
						{
							datasource = application.dataSourceName,
							cachedwithin:application.queryTimeCache
						});
	}


	public function qryArchiveSearch(numeric year, numeric month) {
		return 	QueryExecute("SELECT		galleries.gallery_id,
											DATE(galleries.release_date) AS release_date,
											galleries.tour_pic1,
											galleries.tour_pic2,
											galleries.tour_pic3,
											galleries.gallery_n_images,
											galleries.gallery_type,
											galleries.gallery_type,
											gallery_type.gallery_type_display_text,
											models.model_display_name,
											models.model_link,
											videos.video_total_time
								FROM		galleries
								INNER JOIN	gallery_type
								ON			galleries.gallery_type = gallery_type.gallery_type_id
								INNER JOIN	galleries_models
								ON			galleries.gallery_id = galleries_models.gm_gallery_id
								INNER JOIN	models
								ON			galleries_models.gm_model_id = models.model_id
								LEFT JOIN	videos
								ON			galleries.video_clip_id = videos.video_id
								WHERE		DATE(galleries.release_date) <= DATE(NOW())
								AND			YEAR(galleries.release_date) =?
								AND			MONTH(galleries.release_date) =?
								AND			galleries.show_future = 1
								AND			galleries.show_public = 1
								AND			galleries_models.gm_precedence = 1
								AND			models.model_show_public_area = 1
								AND			models.show_model_v2_tour = 1
								AND			models.model_not_advertised = 0
								GROUP BY	galleries.gallery_id
								ORDER BY	galleries.release_date DESC",
						[
							{sqltype: "cf_sql_integer", value: year},
							{sqltype: "cf_sql_integer", value: month}
						],
						{
							datasource = application.dataSourceName,
							cachedwithin:application.queryTimeCache
						});
	}
}