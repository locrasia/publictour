component output="false" displayname="" accessors="true" {

	property HomeService;
	public function init(required any fw){
		variables.fw =arguments.fw;
		return this;
	}

	public function default(struct rc) {
		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		rc.strMetaTitle = 'Welcome to ' & rc.strMetaTitle & ' - Erotic Models in Sexy Lingerie';

		// if (NOT IsDefined("application.stcPageContent.stcHome.stc#application.strToday#"))
			application.stcPageContent.stcHome["stc#application.strToday#"] = StructNew();

		// query to generate homepage slideshow	
		// if (NOT IsDefined("application.stcPageContent.stcHome.stc#application.strToday#.qrySlideshow")){
			var qrySlideshow = HomeService.qrySlideshow();
			application.stcPageContent.stcHome["stc#application.strToday#"].qrySlideshow = qrySlideshow;
		// }

		// latest updates
		// if (NOT IsDefined("application.stcPageContent.stcHome.stc#application.strToday#.qryLatestUpdates")){
			var qryLatestUpdates = HomeService.qryLatestUpdates();
			application.stcPageContent.stcHome["stc#application.strToday#"].qryLatestUpdates = qryLatestUpdates;
		// }
		// latest models
		// if (NOT IsDefined("application.stcPageContent.stcHome.stc#application.strToday#.qryLatestModels")){
			var qryLatestModels = HomeService.qryLatestModels();
			application.stcPageContent.stcHome["stc#application.strToday#"].qryLatestModels = qryLatestModels;
		// }

		for(var i=0;i<2;i++){
			var strQueryName = "qryMonth#i+1#"
			var int_nMonthAgoMonth = Month(DateAdd("m", -i, Now()));
			var int_nMonthAgoYear = Year(DateAdd("m", -i, Now()));
			var qryLastedTwoMonth = HomeService.qryLastedTwoMonth(int_nMonthAgoMonth,int_nMonthAgoYear);
			application.stcPageContent.stcHome["stc#application.strToday#"]["#strQueryName#"] = qryLastedTwoMonth;
		}

		rc.qrySlideshow = application.stcPageContent.stcHome["stc#application.strToday#"].qrySlideshow;
		rc.qryLatestUpdates = application.stcPageContent.stcHome["stc#application.strToday#"].qryLatestUpdates;
		rc.qryLatestModels = application.stcPageContent.stcHome["stc#application.strToday#"].qryLatestModels;
	}
}
