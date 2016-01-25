component output="false" displayname="" accessors="true" {

	property UpdatesService;
	public function init(required any fw){
		variables.fw =arguments.fw;
		return this;
	}

	public function default(struct rc) {

		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		rc.strMetaTitle = 'Girls in Sexy Lingerie Updates at ' & rc.strMetaTitle;


		<!--- check for today's application structure --->
		// if (NOT IsDefined("application.stcPageContent.stcUpdates.stc#application.strToday#")){
			<!--- create new application structure to store today's data --->
			application.stcPageContent.stcUpdates["stc#application.strToday#"] = StructNew();
			<!--- set latest photos and videos querys to today's application structure --->
			var qryLatestUpdates = UpdatesService.qryLatestUpdates();
			var arrLatestUpdates = ArrayNew(1);
			for(model in qryLatestUpdates) {
			   var stcGallery = StructNew();
			   stcGallery.intId = model.gallery_id;
			   stcGallery.datRelease = model.release_date;
			   stcGallery.strTourPic1 = model.tour_pic1;
			   stcGallery.strTourPic2 = model.tour_pic2;
			   stcGallery.strTourPic3 = model.tour_pic3;
			   stcGallery.intImages = model.gallery_n_images;
			   stcGallery.strType = model.gallery_type_display_text;
			   stcGallery.strModelName = model.model_display_name;
			   stcGallery.strModelLink = model.model_link;
			   stcGallery.strVideoTime = model.video_total_time;
			   stcGallery.strGalleryType = model.gallery_type;
			   ArrayAppend(arrLatestUpdates, stcGallery);
			}
			application.stcPageContent.stcUpdates["stc#application.strToday#"].arrLatestUpdates = arrLatestUpdates;
		// }
		rc.arrLatestUpdates = application.stcPageContent.stcUpdates["stc#application.strToday#"].arrLatestUpdates;

		rc.intEndYear = Year(Now());
		rc.intStartYear = rc.intEndYear - 11;
	}


	function loadMore(struct rc) {
		var qryLatestUpdates = UpdatesService.qryLatestUpdates(rc.page);
		rc.arrLatestUpdates = ArrayNew(1);
		for(model in qryLatestUpdates) {
		   var stcGallery = StructNew();
		   stcGallery.intId = model.gallery_id;
		   stcGallery.datRelease = model.release_date;
		   stcGallery.strTourPic1 = model.tour_pic1;
		   stcGallery.strTourPic2 = model.tour_pic2;
		   stcGallery.strTourPic3 = model.tour_pic3;
		   stcGallery.intImages = model.gallery_n_images;
		   stcGallery.strType = model.gallery_type_display_text;
		   stcGallery.strModelName = model.model_display_name;
		   stcGallery.strModelLink = model.model_link;
		   stcGallery.strVideoTime = model.video_total_time;
		   stcGallery.strGalleryType = model.gallery_type;
		   ArrayAppend(rc.arrLatestUpdates, stcGallery);
		}
	}


	function searchArchive(struct rc) {
		<!--- define application structure for selected year and month archive --->
		param name="application.stcPageContent.stcUpdates.stc#application.strToday#.stc#rc.intYear#" default="#StructNew()#";
		param name="application.stcPageContent.stcUpdates.stc#application.strToday#.stc#rc.intYear#.stc#NumberFormat(rc.intMonth, '00')#" default="#StructNew()#";

		<!--- if selected year/month structure for today is empty, run required queries and set resultant arrays to structure --->
		var qryArchiveSearch = UpdatesService.qryArchiveSearch(rc.intYear,rc.intMonth);
		var arrArchiveSearch = ArrayNew(1);
		for(model in qryArchiveSearch){
			var stcGallery = StructNew();
			stcGallery.intId = model.gallery_id;
			stcGallery.datRelease = model.release_date;
			stcGallery.strTourPic1 = model.tour_pic1;
			stcGallery.strTourPic2 = model.tour_pic2;
			stcGallery.strTourPic3 = model.tour_pic3;
			stcGallery.intImages = model.gallery_n_images;
			stcGallery.strType = model.gallery_type_display_text;
			stcGallery.strModelName = model.model_display_name;
			stcGallery.strModelLink = model.model_link;
			stcGallery.strVideoTime = model.video_total_time;
	   		stcGallery.strGalleryType = model.gallery_type;
			ArrayAppend(arrArchiveSearch, stcGallery);
		}
		application.stcPageContent.stcUpdates["stc#application.strToday#"]["stc#rc.intYear#"]["stc#NumberFormat(rc.intMonth, '00')#"].arrArchiveSearch = arrArchiveSearch;

		rc.arrArchiveSearch = application.stcPageContent.stcUpdates["stc#application.strToday#"]["stc#rc.intYear#"]["stc#NumberFormat(rc.intMonth, '00')#"].arrArchiveSearch;	
	}
}
