/**
*
* @file  /Q/Rasia/Lucee Express/webapps/pt/model/services/Podcast.cfc
* @author  
* @description
*
*/

component output="false" displayname=""  {

	public function init(){
		return this;
	}


	public function getArchivePodcast(numeric year, numeric month) {
		return 	QueryExecute("SELECT		podcasts.pc_main_image,
											podcasts.pc_date_added,
											podcasts.pc_page_id,
											podcasts.pc_flv_filename,
											podcasts.pc_hd_zip,
											podcasts.pc_hd_filesize,
											podcasts.pc_mp4_filename,
											podcasts.pc_mp4_zip,
											podcasts.pc_mp4_filesize,
											content.content_page_content
								FROM		podcasts
								LEFT JOIN	content
									ON		podcasts.pc_page_id = content.content_page_id
								WHERE		year(podcasts.pc_date_added) =:year
								AND			month(podcasts.pc_date_added) =:month
								LIMIT 		1",
						[
							{sqltype: "cf_sql_integer", value: year},
							{sqltype: "cf_sql_integer", value: month}
						],
						{
							datasource="ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}
	

	public function getLatestPodcast() {
		return 	QueryExecute("SELECT		podcasts.pc_main_image,
											podcasts.pc_date_added,
											podcasts.pc_page_id,
											podcasts.pc_flv_filename,
											podcasts.pc_hd_zip,
											podcasts.pc_hd_filesize,
											podcasts.pc_mp4_filename,
											podcasts.pc_mp4_zip,
											podcasts.pc_mp4_filesize,
											podcasts.pc_ss_filename,
											content.content_page_content
								FROM		podcasts
								LEFT JOIN	content
									ON		podcasts.pc_page_id = content.content_page_id
								ORDER BY	podcasts.pc_date_added DESC
								LIMIT 		1",
						[],
						{
							datasource="ot2004_data"
						});
	}


	public function getArchivedPodcast() {
		return 	QueryExecute("SELECT		pc_ss_filename,
											pc_date_added
								FROM		podcasts
								ORDER BY	pc_date_added DESC",
						[],
						{
							datasource="ot2004_data",
							cachedwithin:application.queryTimeCache
						});
	}	
}