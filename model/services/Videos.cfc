/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Videos.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}


	public function qryWeeklyVideo() {
		return 	QueryExecute("SELECT		galleries.gallery_description,
											galleries.average_outfit,
											galleries.average_model,
											models.model_id,
											models.model_display_name,
											models.model_link,
											models.model_bust,
											models.model_waist,
											models.model_hips,
											models.model_star_sign,
											videos.video_total_time
								FROM		galleries
								INNER JOIN	galleries_models
								ON			galleries.gallery_id = galleries_models.gm_gallery_id
								AND			galleries_models.gm_precedence = 1
								INNER JOIN	models
								ON			galleries_models.gm_model_id = models.model_id
								LEFT JOIN	videos
								ON			galleries.directory_name = videos.video_directory_name
								WHERE		galleries.free_tour_video_active = 1",
						[],
						{
							datasource="ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}


	public function qrySimilarVideos() {
		return 	QueryExecute("SELECT		galleries.gallery_id
								FROM		galleries
								INNER JOIN	videos
								ON			galleries.directory_name = videos.video_directory_name
								WHERE		galleries.video_clip_id != 9999
								AND 		galleries.release_date != ''
								AND			videos.video_hd_res_filesize > 0",
						[],
						{
							datasource="ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}
	
	
	public function qrySimilarVideo(numeric galleryId) {	
		return 	QueryExecute("SELECT		galleries.release_date,
											models.model_display_name,
											models.model_link,
											galleries.tour_pic1,
											videos.video_total_time
								FROM		galleries
								INNER JOIN	galleries_models
								ON			galleries.gallery_id = galleries_models.gm_gallery_id
								INNER JOIN	models
								ON			galleries_models.gm_model_id = models.model_id
								AND			galleries_models.gm_precedence = 1
								INNER JOIN	videos
								ON			galleries.directory_name = videos.video_directory_name
								WHERE		galleries.gallery_id =:id",
						[
							{sqltype: "cf_sql_integer", value: galleryId}
						],
						{
							datasource="ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}
}