/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Models.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}

	<!--- query to generate a-z --->
	public function qryModelInitials() {
		return QueryExecute("SELECT		models.model_initial
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							AND			galleries.release_date IS NOT NULL
							GROUP BY	models.model_initial",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- default query - sorted by latest updates --->
	public function qryModelsLatestUpdates(numeric limit=12, numeric page=0) {
		return QueryExecute("SELECT  	MAX(galleries.release_date) AS model_last_gallery,
										models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_videos AS model_video_count,
										models.model_n_images AS model_image_count,
										models.model_n_galleries AS model_gallery_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		galleries.release_date <= NOW()
							AND			models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							GROUP BY	galleries.model_id
							ORDER BY	model_last_gallery DESC
							LIMIT ?
							OFFSET ?",
							[
								{sqltype: "cf_sql_integer", value: limit},
								{sqltype: "cf_sql_integer", value: page * limit}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- alternative query - sorted by newest models --->
	public function qryModelsNewest(numeric limit=32, numeric page=0) {
		return QueryExecute("SELECT 	models.model_id, 
										models.model_display_name, 
										REPLACE(models.model_display_name, ' ', '-') as model_link,
										models.model_n_videos AS model_video_count, 
										models.model_n_images AS model_image_count, 
										models.model_n_galleries AS model_gallery_count 
							FROM		galleries 
							INNER JOIN	galleries_models 
							ON			galleries.gallery_id = galleries_models.gm_gallery_id 
							INNER JOIN	models 
							ON			galleries_models.gm_model_id = models.model_id 
							WHERE		models.model_show_public_area = 1 
							AND			models.site_model_cover = 1 
							AND 		models.model_n_galleries > 0 
							GROUP BY	galleries.model_id 
							ORDER BY	models.model_id DESC 
							LIMIT		?
							OFFSET 		?",
							[
								{sqltype: "cf_sql_integer", value: limit},
								{sqltype: "cf_sql_integer", value: page * limit}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- select featured model for the day --->
	public function qryFeaturedModel() {
		return QueryExecute("SELECT		models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_videos AS model_video_count,
										models.model_n_images AS model_image_count,
										models.model_n_galleries AS model_gallery_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		models.model_average_vote >= 8.5
							AND			models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							ORDER BY	RAND()
							LIMIT		1",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	public function qry3FeaturedModel() {
		return QueryExecute("SELECT		models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_videos AS model_video_count,
										models.model_n_images AS model_image_count,
										models.model_n_galleries AS model_gallery_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		models.model_average_vote >= 8.5
							AND			models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							ORDER BY	RAND()
							LIMIT		3",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}


	public any function qryAllModels() {
		return QueryExecute("SELECT  	MAX(galleries.release_date) AS model_last_gallery,
										models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_videos AS model_video_count,
										models.model_n_images AS model_image_count,
										models.model_n_galleries AS model_gallery_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		galleries.release_date <= NOW()
							AND			models.model_show_public_area = 1
							AND			models.site_model_cover = 1
							GROUP BY	galleries.model_id
							ORDER BY	model_last_gallery DESC
							LIMIT		500",
							[],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	public function qryModels(string strFilter) {
		return QueryExecute("SELECT  	MAX(galleries.gallery_id) AS model_last_gallery,
										models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_initial,
										models.model_n_videos AS model_video_count,
										models.model_n_images AS model_image_count,
										models.model_n_galleries AS model_gallery_count
							FROM		galleries
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							INNER JOIN	models
							ON			galleries_models.gm_model_id = models.model_id
							WHERE		UPPER(LEFT(models.model_display_name, 1)) = UPPER(?)
							AND			models.model_show_public_area = 1
							GROUP BY	models.model_id
							ORDER BY	models.model_display_name",
							[
								{sqltype: "cf_sql_char", value: strFilter}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- basic model info --->
	public function qryModel(string strFilter) {	
		return QueryExecute("SELECT  	models.model_id,
										models.model_display_name,
										models.model_link,
										models.model_n_images AS image_count,
										models.model_n_galleries AS gallery_count,
										models.model_n_videos AS video_count,
										models.model_height,
										models.model_bust,
										models.model_waist,
										models.model_hips,
										models.model_star_sign,
										models.model_random_fact,
										models.model_flash_intro,
										content.content_page_content
							FROM		models
							LEFT JOIN	content
							ON			models.content_page_id = content.content_page_id
							WHERE		models.model_link = ?
							AND			models.model_show_public_area = 1
							LIMIT		1",
							[
								{sqltype: "cf_sql_varchar", value: strFilter}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	<!--- model's comments --->
	public function qryComments(numeric modelId) {	
		return QueryExecute("SELECT		galleries_comments.galleries_comment_text_publicly
							FROM		galleries_comments
							INNER JOIN	galleries
							ON			galleries.gallery_id = galleries_comments.gallery_id
							INNER JOIN	galleries_models
							ON			galleries.gallery_id = galleries_models.gm_gallery_id
							WHERE		galleries_models.gm_model_id =?
							AND 		galleries_comments.galleries_comment_show_publicly = 1",
							[
								{sqltype: "cf_sql_integer", value: modelId}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
		
	<!--- model's galleries --->		
	public function qryGalleries(numeric modelId,numeric limit=20 ,numeric offset=0) {
		return QueryExecute("SELECT		galleries.gallery_id,
										galleries.tour_pic1,
										galleries.tour_pic2,
										galleries.tour_pic3,
										galleries.mailing_list_pic,
										galleries.updates_pic_thumb,
										galleries.serial_code,
										galleries.release_date,
										galleries.gallery_type,
										IF(FIND_IN_SET(galleries.gallery_type,?) = 0, 'photo', 'video') AS gallery_set_type,
										galleries.total_votes_cast_outfit,
										galleries.average_model,
										galleries.average_outfit,
										galleries.total_votes_cast_tease,
										galleries.average_tease,
										galleries.gallery_description,
										galleries.gallery_n_images AS image_count,
										gallery_type.gallery_type_display_text,
										videos.video_id,
										videos.video_total_time AS video_length,
										IF (galleries.video_clip_id != 9999, galleries.video_clip_id, 0) AS video_clip
							FROM		galleries_models
							INNER JOIN	galleries
							ON			galleries_models.gm_gallery_id = galleries.gallery_id
							INNER JOIN	gallery_type
							ON			galleries.gallery_type = gallery_type.gallery_type_id
							LEFT JOIN	videos
							ON			videos.video_id = galleries.video_clip_id
							WHERE		galleries_models.gm_model_id =?
							AND			(
											galleries.linked_release = 0
											OR
											(
												galleries.linked_release = 1
												AND
												galleries.v2_video_clip_id != 9999
											)
										)
							AND 		galleries.show_future = 1
							AND  		galleries.show_public = 1
							AND			(
											galleries.gallery_type NOT IN (17,18)
											OR
											(
												galleries.gallery_type IN (17,18)
												AND
												DATE(galleries.release_date) <= DATE(NOW())
											)
										)
							GROUP BY	galleries.gallery_id
							ORDER BY	galleries.release_date DESC
							LIMIT ?
							OFFSET ?",
							[
								{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strVideos},
								{sqltype: "cf_sql_integer", value: modelId},
								{sqltype: "cf_sql_integer", value: limit},
								{sqltype: "cf_sql_integer", value: offset}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	public function qryAllGalleries(numeric modelId) {
		return QueryExecute("SELECT		galleries.gallery_id,
										galleries.tour_pic1,
										galleries.tour_pic2,
										galleries.tour_pic3,
										galleries.mailing_list_pic,
										galleries.updates_pic_thumb,
										galleries.serial_code,
										galleries.release_date,
										galleries.gallery_type,
										IF(FIND_IN_SET(galleries.gallery_type,?) = 0, 'photo', 'video') AS gallery_set_type,
										galleries.total_votes_cast_outfit,
										galleries.average_model,
										galleries.average_outfit,
										galleries.total_votes_cast_tease,
										galleries.average_tease,
										galleries.gallery_description,
										galleries.gallery_n_images AS image_count,
										gallery_type.gallery_type_display_text,
										videos.video_id,
										videos.video_total_time AS video_length,
										IF (galleries.video_clip_id != 9999, galleries.video_clip_id, 0) AS video_clip
							FROM		galleries_models
							INNER JOIN	galleries
							ON			galleries_models.gm_gallery_id = galleries.gallery_id
							INNER JOIN	gallery_type
							ON			galleries.gallery_type = gallery_type.gallery_type_id
							LEFT JOIN	videos
							ON			videos.video_id = galleries.video_clip_id
							WHERE		galleries_models.gm_model_id =?
							AND			(
											galleries.linked_release = 0
											OR
											(
												galleries.linked_release = 1
												AND
												galleries.v2_video_clip_id != 9999
											)
										)
							AND 		galleries.show_future = 1
							AND  		galleries.show_public = 1
							AND			(
											galleries.gallery_type NOT IN (17,18)
											OR
											(
												galleries.gallery_type IN (17,18)
												AND
												DATE(galleries.release_date) <= DATE(NOW())
											)
										)
							GROUP BY	galleries.gallery_id
							ORDER BY	galleries.release_date DESC",
							[
								{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strVideos},
								{sqltype: "cf_sql_integer", value: modelId}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}	

	public function qryModelNames(numeric galeryId) {
		return QueryExecute("SELECT		models.model_display_name,
										models.model_link,
										models.model_show_public_area
							FROM		models
							INNER JOIN	galleries_models
							ON			models.model_id = galleries_models.gm_model_id
							WHERE		galleries_models.gm_gallery_id =?
							ORDER BY	galleries_models.gm_precedence",
							[
								{sqltype: "cf_sql_integer", value: galeryId}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	public function qryGals(string dataSourceName, string strFilter) {
		var sQueryInsert = "";
		if(dataSourceName == "ot2004_data"){
			sQueryInsert = "AND show_public = 1";
		}
		return QueryExecute("SELECT		galleries.tour_pic1_thumb,
										galleries.tour_pic2_thumb,
										galleries.tour_pic3_thumb,
										gallery_type,
										video_hd_res_name,
										video_mp4_hd_name,
										mailing_list_pic_thumb,
										updates_pic_thumb
							FROM		models
							INNER JOIN	galleries
							ON			models.model_id = galleries.model_id
							LEFT JOIN	videos
							ON			galleries.video_clip_id = videos.video_id
							WHERE		models.model_link = ?
							AND			show_future = 1
							#sQueryInsert#
							ORDER BY	galleries.release_date DESC,
										galleries.gallery_id DESC",
							[
								{sqltype: "cf_sql_varchar", value: strFilter}
							],
							{
								datasource = dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}

	public function qryPics(string dataSourceName, string strFilter) {
		var sQueryInsert = "";
		if(dataSourceName == "ot2004_data"){
			sQueryInsert = "AND show_public = 1";
		}
		return QueryExecute("SELECT		galleries.gallery_n_images
							 FROM		models
							 INNER JOIN	galleries
							 ON			models.model_id = galleries.model_id
							 WHERE		models.model_link =?
							 AND			galleries.gallery_type IN (?)
							 AND			(
											galleries.linked_release_id IS NULL
											OR
											(
												galleries.linked_release_id IS NOT NULL
												AND
												galleries.special_type = 1
											)
										)
							 AND		show_future = 1
							 #sQueryInsert#",
							 [
							 	{sqltype: "cf_sql_varchar", value: strFilter},
							 	{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strPhotos}
							 ],
							 {
							 	datasource = dataSourceName,
							 	cachedwithin:application.queryTimeCache
							 });
	}

	public function qryVids(string dataSourceName, string strFilter) {
		var sQueryInsert = "";
		if(dataSourceName == "ot2004_data"){
			sQueryInsert = "AND show_public = 1";
		}
		return QueryExecute("	SELECT		COUNT(galleries.video_clip_id) AS int_videoCount
								FROM		models
								INNER JOIN	galleries
								ON			models.model_id = galleries.model_id
								WHERE		models.model_link =?
								AND			(
												galleries.gallery_type IN (?)
												OR
												(
													galleries.gallery_type IN (?)
													AND
													galleries.linked_release_id IS NOT NULL
													AND
													galleries.special_type = 0
												)
											)
								AND			show_future = 1
								#sQueryInsert#
								GROUP BY	models.model_id",
								[
									{sqltype: "cf_sql_varchar", value: strFilter},
									{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strVideos},
									{sqltype: "cf_sql_varchar", value: application.stcThisSite.stcSetTypes.strPhotos}
								],
								{
									datasource = dataSourceName,
									cachedwithin:application.queryTimeCache
								});
	}


	public function qryDuplicateCheck(numeric modelId, string strEmail) {
		return QueryExecute("SELECT	interest_id
							FROM	public_tour_model_interest
							WHERE	interest_model_id =:modelId
							AND		LOWER(interest_email) = LOWER(:strEmail)",
							[
								{sqltype: "cf_sql_integer", value: modelId},
								{sqltype: "cf_sql_varchar", value: strEmail}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
	
	public function qryInsertPublicTour(numeric modelId, string modelName, string strEmail) {	
		return QueryExecute("INSERT INTO	public_tour_model_interest (
								interest_model_id,
								interest_model_name,
								interest_email,
								date_added
							)
							VALUES (
								:id,
								:name,
								LOWER(:email),
								NOW()
							)",
							[
								{sqltype: "cf_sql_integer", value: modelId},
								{sqltype: "cf_sql_varchar", value: modelName},
								{sqltype: "cf_sql_varchar", value: strEmail}
							],
							{
								datasource = application.dataSourceName.
								cachedwithin:application.queryTimeCache
							});
	}

	public function qryDeletePublicTour(numeric modelId, string strEmail) {
		return QueryExecute("DELETE
							FROM	public_tour_model_interest
							WHERE	interest_model_id =:id
							AND		LOWER(interest_email) = LOWER(:strEmail)",
							[
								{sqltype: "cf_sql_integer", value: modelId},
								{sqltype: "cf_sql_varchar", value: strEmail}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}
			
	
	public function qryMotyResults(string winnerList) {
		var smodel_id = "";
		for(var i=ListLen(winnerList);i>0;i--){
			smodel_id = smodel_id&"model_id="&ListGetAt(winnerList, i)&",";
		}
		return  QueryExecute("SELECT		model_id,
											model_display_name
								FROM		models
								WHERE		model_id IN (?)
								ORDER BY    #smodel_id# 
											model_id ASC
								LIMIT		30",
						[
							{sqltype: "cf_sql_varchar", value: winnerList}
						],
						{
							datasource = application.dataSourceName,
							cachedwithin:application.queryTimeCache
						});
	}

	public function returningVoter(string strEmail) {	
		return 	QueryExecute("	SELECT	yearly_vote_public_serial,
								yearly_vote_public_email_confirmed
								FROM	yearly_votes_public
								WHERE	yearly_vote_public_email =?
								AND		yearly_vote_public_year = YEAR(NOW())",
							[
								{sqltype: "cf_sql_varchar", value: strEmail}
							],
							{
								datasource = application.dataSourceName,
								cachedwithin:application.queryTimeCache
							});
	}	

	public function qryVotesPublic(string strEmail, numeric index, numeric modelId, numeric serial) {
		return 	QueryExecute("INSERT IGNORE INTO yearly_votes_public (
									yearly_vote_public_email,
									yearly_vote_public_position,
									yearly_vote_public_model_id,
									yearly_vote_public_year,
									yearly_vote_public_ip,
									yearly_vote_public_serial
								)
								VALUES(?,?,?,?,?,?)",
								[
									{sqltype: "cf_sql_varchar", value: strEmail},
									{sqltype: "cf_sql_integer", value: index},
									{sqltype: "cf_sql_integer", value: modelId},
									{sqltype: "cf_sql_integer", value: YEAR(NOW())},
									{sqltype: "cf_sql_varchar", value: cgi.REMOTE_ADDR},
									{sqltype: "cf_sql_char"	  , value: serial}
								],
								{
									datasource = application.dataSourceName,
									cachedwithin:application.queryTimeCache
								});
	}

	public any function qryDeleteVotesPublic(string strEmail) {	
		return 	QueryExecute("DELETE
							FROM	yearly_votes_public
							WHERE	yearly_vote_public_email =:strEmail
							AND		yearly_vote_public_year = YEAR(NOW())",
						[
							{sqltype: "cf_sql_varchar", value: strEmail}
						],
						{
							datasource = application.dataSourceName,
							cachedwithin:application.queryTimeCache
						});
	}

	public any function stcConfirmResult(string email, string serial) {
		return 	QueryExecute("UPDATE	yearly_votes_public
								SET		yearly_vote_public_email_confirmed = 1
								WHERE	yearly_vote_public_email = :email
								AND		yearly_vote_public_serial = :serial",
						[
							{sqltype: "cf_sql_varchar", value: email},
							{sqltype: "cf_sql_char", value: serial},
						],
						{
							datasource = application.dataSourceName,
							cachedwithin:application.queryTimeCache
						});
	}																																																																							
}