component output="false" displayname="" accessors="true" {

	property ModelsService;
	public function init(required any fw){
		variables.fw =arguments.fw;
		return this;
	}

	<!--- models main page operations --->
	public function default(struct rc) {

		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		rc.strMetaTitle = 'All Sexy Lingerie Models at ' & rc.strMetaTitle;

		<!--- set default display option for models main page --->
		param name="session.stcModels" default="#StructNew()#";
		param name="session.stcModels.strFilter" default="Latest-updates";

		<!--- set required queries to application structure --->
		application.stcPageContent.stcModels["stc#application.strToday#"] = StructNew();

		var qryModelsLatestUpdates = ModelsService.qryModelsLatestUpdates();
		application.stcPageContent.stcModels["stc#application.strToday#"].qryModelsLatestUpdates = qryModelsLatestUpdates;	
	
		<!--- alternative query - sorted by newest models --->
		var qryModelsNewest = ModelsService.qryModelsNewest();
		application.stcPageContent.stcModels["stc#application.strToday#"].qryModelsNewest = qryModelsNewest;

		<!--- select featured model for the day --->
		var qryFeaturedModel = ModelsService.qryFeaturedModel();
		application.stcPageContent.stcModels["stc#application.strToday#"].qryFeaturedModel = qryFeaturedModel;

		switch(#session.stcModels.strFilter#){
			case "Newest":
				rc.qryModels = application.stcPageContent.stcModels["stc#application.strToday#"].qryModelsNewest;
			break;
			default:
				rc.qryModels = application.stcPageContent.stcModels["stc#application.strToday#"].qryModelsLatestUpdates;
			break;
		}
		rc.qry3FeaturedModel = ModelsService.qry3FeaturedModel();
		rc.qryModelInitials = ModelsService.qryModelInitials();
		rc.letter_list = ValueList(rc.qryModelInitials.model_initial);
		rc.qryFeaturedModel = application.stcPageContent.stcModels["stc#application.strToday#"].qryFeaturedModel;
	}


	function loadMore(struct rc) {
		switch(len(rc.filter)){
			case 1:
				param name="application.stcPageContent.stcModels['stc#application.strToday#'].stcModelsAZ" default="#StructNew()#";
				var qryModels = ModelsService.qryModels(rc.filter);
				application.stcPageContent.stcModels["stc#application.strToday#"].stcModelsAZ["#rc.filter#"] = qryModels;
				rc.qryModels = application.stcPageContent.stcModels["stc#application.strToday#"].stcModelsAZ["#rc.filter#"];
			break;
			default:
				if(rc.filter eq 'lastest_updates'){
					session.stcModels.strFilter = 'Latest-updates';
				}else if(rc.filter eq 'newest_models'){
					session.stcModels.strFilter = 'Newest';
				}
				switch(#session.stcModels.strFilter#){
					case "Newest":
						rc.qryModels = ModelsService.qryModelsNewest(rc.limit,rc.page);
					break;
					default:
						rc.qryModels = ModelsService.qryModelsLatestUpdates(rc.limit,rc.page);
					break;
				}
			break;
		}
	}

	public function profile(struct rc) {

		param name="rc.strMetaTitle" default="#application.stcThisSite.stcMetaData.strMetaTitle#";
		param name="rc.strMetaDescription" default="#application.stcThisSite.stcMetaData.strMetaDescription#";
		param name="rc.strMetaKeywords" default="#application.stcThisSite.stcMetaData.strMetaKeywords#";
		var model_name=Replace(rc.strFilter,'-',' ','ALL');
		switch (LCase(Left(model_name,1))){
			case "a":
			case "e":
			case "i":
			case "m":
			case "q":
			case "u":
			case "y":
				rc.strMetaTitle = model_name & ' - Sexy Lingerie Model at ' & rc.strMetaTitle;
				break;

			case "b":
			case "f":
			case "j":
			case "n":
			case "r":
			case "v":
			case "z":
				rc.strMetaTitle = 'Sexy Pics of ' & model_name & ' at ' & rc.strMetaTitle;
				break;

			case "c":
			case "g":
			case "k":
			case "o":
			case "s":
			case "w":
				rc.strMetaTitle = 'Sexy Pictures of ' & model_name & ' at ' & rc.strMetaTitle;
				break;

			case "d":
			case "h":
			case "l":
			case "p":
			case "t":
			case "x":
				rc.strMetaTitle = model_name & ' and Other Sexy Women at ' & rc.strMetaTitle;
				break;
		}	

		<!--- initialise application structure for selected model --->

		var strSafeModelLink = StructureModelLink(rc.strFilter);
		param name="application.stcPageContent.stcModels.stc#application.strToday#.stcProfiles" default="#StructNew()#";
		param name="application.stcPageContent.stcModels.stc#application.strToday#.stcProfiles.#strSafeModelLink#" default="#StructNew()#";
		var qryModel = ModelsService.qryModel(rc.strFilter);
		if(qryModel.RecordCount NEQ 1){
			location(addtoken="no", url="/index.cfm/Models");
		}
		if (findNoCase('Android', cgi.http_user_agent,1) or findNoCase('iPhone', cgi.http_user_agent,1)){
			rc.mobile = true;
			var limit = 12;
		}
		else{
			rc.mobile = false;
			var limit = 20;
		}
		rc.qryAllGalleries = ModelsService.qryAllGalleries(qryModel.model_id);
		if (StructIsEmpty(application.stcPageContent.stcModels["stc#application.strToday#"].stcProfiles["#strSafeModelLink#"])){
			<!--- basic model info --->
			
			stcModelProfile = structNew();
			stcModelProfile.intId = qryModel.model_id;
			stcModelProfile.strName = qryModel.model_display_name;
			stcModelProfile.strLink = qryModel.model_link;
			stcModelProfile.intImages = qryModel.image_count;
			stcModelProfile.intSets = qryModel.gallery_count;
			stcModelProfile.intVideos = qryModel.video_count;
			stcModelProfile.strHeight = qryModel.model_height;
			stcModelProfile.strBust = qryModel.model_bust;
			stcModelProfile.strWaist = qryModel.model_waist;
			stcModelProfile.strHips = qryModel.model_hips;
			stcModelProfile.strStarSign = qryModel.model_star_sign;
			stcModelProfile.strRandomFact = qryModel.model_random_fact;
			stcModelProfile.strFlashIntro = qryModel.model_flash_intro;
			stcModelProfile.strBio = qryModel.content_page_content;
			var strTempMetaDescription = REReplace(qryModel.content_page_content, "<[^>]*>", "", "ALL");
			if (Len(strTempMetaDescription) GT 200){
				strTempMetaDescription = RemoveChars(strTempMetaDescription, 200, Len(strTempMetaDescription) - 200);
			}
			stcModelProfile.strMetaDescription = strTempMetaDescription;

			<!--- model's comments --->
			var qryComments = ModelsService.qryComments(qryModel.model_id);
			stcModelProfile.arrComments = ListToArray(ValueList(qryComments.galleries_comment_text_publicly, "|"), "|");

			<!--- model's galleries --->
			var qryGalleries = ModelsService.qryGalleries(qryModel.model_id,limit);
			var arrGalleries = ArrayNew(1);
			loop query="qryGalleries"{
			   var qryModelNames = ModelsService.qryModelNames(qryGalleries.gallery_id);
			   var intCounter = 0;
			   loop query="qryModelNames"{
			   	   intCounter = intCounter + qryModelNames.model_show_public_area;
			   }
			   if(intCounter EQ qryModelNames.RecordCount){
			   		var stcGallery = StructNew();
					stcGallery.intId = qryGalleries.gallery_id;
					stcGallery.strModelNames = ValueList(qryModelNames.model_display_name);
					stcGallery.strFirstModelLink = qryModelNames.model_link[1];
					stcGallery.strTourPic1 = qryGalleries.tour_pic1;
					stcGallery.strTourPic2 = qryGalleries.tour_pic2;
					stcGallery.strTourPic3 = qryGalleries.tour_pic3;
					stcGallery.strMailingListPic = qryGalleries.mailing_list_pic;
					stcGallery.strUpdatesPicThumb = qryGalleries.updates_pic_thumb;
					stcGallery.strSerialCode = qryGalleries.serial_code;
					stcGallery.dttReleaseDate = qryGalleries.release_date;
					stcGallery.intType = qryGalleries.gallery_type;
					stcGallery.strType = qryGalleries.gallery_type_display_text;
					stcGallery.strSetType = qryGalleries.gallery_set_type;
					stcGallery.intTotalVotesCastOutfit = qryGalleries.total_votes_cast_outfit;
					stcGallery.numAverageModel = qryGalleries.average_model;
					stcGallery.numAverageOutfit = qryGalleries.average_outfit;
					stcGallery.intTotalVotesCastTease = qryGalleries.total_votes_cast_tease;
					stcGallery.numAverageTease = qryGalleries.average_tease;
					stcGallery.strDescription = qryGalleries.gallery_description;
					stcGallery.intImageCount = qryGalleries.image_count;
					stcGallery.intVideoId = qryGalleries.video_id;
					stcGallery.strVideoLength = qryGalleries.video_length;
					stcGallery.intVideoClip = qryGalleries.video_clip;
					ArrayAppend(arrGalleries, stcGallery);
			   }
			}
			stcModelProfile.arrGalleries = arrGalleries;
			<!--- set array to store gallery data for this model on other OT sites --->
			var arrOtherModelSets = ArrayNew(1);

			for(var i=1;i<=ArrayLen(application.arrAllSites);i++){
				if(application.arrAllSites[i].bolDisplay){
					var qryGals = ModelsService.qryGals(application.arrAllSites[i].strDatasource,rc.strFilter);
					// var qryPics = ModelsService.qryPics(application.arrAllSites[i].strDatasource,rc.strFilter);
					// var qryVids = ModelsService.qryVids(application.arrAllSites[i].strDatasource,rc.strFilter);
					if(qryGals.RecordCount NEQ 0){
						var stcSet = StructNew();
						stcSet.strSite = application.arrAllSites[i].strSiteName;
						switch(stcSet.strSite){
							case "Only-Opaques":
								stcSet.strSite = "Only Opaque";
								stcSet.strShortName = "tab-oo";
							break;
							case "Only-Secretaries":
								stcSet.strSite = "Only Secretaries";
								stcSet.strShortName = "tab-os";
							break;
							case "OnlySilkAndSatin":
								stcSet.strSite = "Only Silk And Satin";
								stcSet.strShortName = "tab-oss";
							break;
						}
						stcSet.strUrl = application.arrAllSites[i].strSiteUrl;
						stcSet.arrTourImages = ArrayNew(2);
						loop query="qryGals"{
							if(listFind(application.stcThisSite.stcSetTypes.strVideos,qryGals.gallery_type)){
								stcSet.arrTourImages[qryGals.CurrentRow][1].image_set = false;
								stcSet.arrTourImages[qryGals.CurrentRow][2] = [];
								stcSet.arrTourImages[qryGals.CurrentRow][2][1] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic3_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][2] = "#Replace(#application.arrAllSites[i].strPicsPath#,"xpromotion", "mailing_list", "ALL")#/#Replace(qryGals.mailing_list_pic_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][3] = "#Replace(#application.arrAllSites[i].strPicsPath#,"xpromotion", "updates", "ALL")#/tn260#qryGals.updates_pic_thumb#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][4] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic1_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][5] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic2_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][6] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic3_thumb,"tn", "tn260", "ALL")#";
							}else if(listFind(application.stcThisSite.stcSetTypes.strPhotos,qryGals.gallery_type)){
								stcSet.arrTourImages[qryGals.CurrentRow][1].image_set = true;
								stcSet.arrTourImages[qryGals.CurrentRow][2] = [];
								stcSet.arrTourImages[qryGals.CurrentRow][2][1] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic1_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][2] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic2_thumb,"tn", "tn260", "ALL")#";
								stcSet.arrTourImages[qryGals.CurrentRow][2][3] = "#application.arrAllSites[i].strPicsPath#/#Replace(qryGals.tour_pic3_thumb,"tn", "tn260", "ALL")#";
							}
						}
						ArrayAppend(arrOtherModelSets, stcSet)
					}
				}
			}
			stcModelProfile.arrOtherModelSets = arrOtherModelSets;
			<!--- add temporary structure to application's model profiles structure --->
			application.stcPageContent.stcModels["stc#application.strToday#"].stcProfiles["#strSafeModelLink#"] = stcModelProfile;
		}

		rc.stcProfile = application.stcPageContent.stcModels["stc#application.strToday#"].stcProfiles["#strSafeModelLink#"];
		<!---  set the meta description tag --->
		rc.strMetaDescription = rc.stcProfile.strMetaDescription;
	}

	function loadMoreProfile(struct rc) {
		var strSafeModelLink = StructureModelLink(rc.strFilter);
		var qryModel = ModelsService.qryModel(rc.strFilter);
		var qryGalleries = ModelsService.qryGalleries(qryModel.model_id,rc.limit,rc.page*rc.limit+4);
		rc.arrGalleries = ArrayNew(1);
		for(record_gal in qryGalleries) {
		   var qryModelNames = ModelsService.qryModelNames(record_gal.gallery_id);
		   var intCounter = 0;
		   for(record_gal in qryModelNames){
		   	   intCounter = intCounter + record_gal.model_show_public_area;
		   }
		   // if(intCounter EQ qryModelNames.RecordCount){
		   		var stcGallery = StructNew();
				stcGallery.intId = qryGalleries.gallery_id;
				stcGallery.strModelNames = ValueList(qryModelNames.model_display_name);
				// stcGallery.strFirstModelLink = qryModelNames.model_link[1];
				stcGallery.strTourPic1 = qryGalleries.tour_pic1;
				stcGallery.strTourPic2 = qryGalleries.tour_pic2;
				stcGallery.strTourPic3 = qryGalleries.tour_pic3;
				// stcGallery.strMailingListPic = qryGalleries.mailing_list_pic;
				// stcGallery.strUpdatesPicThumb = qryGalleries.updates_pic_thumb;
				// stcGallery.strSerialCode = qryGalleries.serial_code;
				stcGallery.dttReleaseDate = qryGalleries.release_date;
				// stcGallery.intType = qryGalleries.gallery_type;
				// stcGallery.strType = qryGalleries.gallery_type_display_text;
				stcGallery.strSetType = qryGalleries.gallery_set_type;
				// stcGallery.intTotalVotesCastOutfit = qryGalleries.total_votes_cast_outfit;
				// stcGallery.numAverageModel = qryGalleries.average_model;
				// stcGallery.numAverageOutfit = qryGalleries.average_outfit;
				// stcGallery.intTotalVotesCastTease = qryGalleries.total_votes_cast_tease;
				// stcGallery.numAverageTease = qryGalleries.average_tease;
				// stcGallery.strDescription = qryGalleries.gallery_description;
				stcGallery.intImageCount = qryGalleries.image_count;
				// stcGallery.intVideoId = qryGalleries.video_id;
				stcGallery.strVideoLength = qryGalleries.video_length;
				// stcGallery.intVideoClip = qryGalleries.video_clip;
				ArrayAppend(rc.arrGalleries, stcGallery);
		   // }
		}
		rc.bEnd = false;
		if(ArrayLen(rc.arrGalleries) lt rc.limit){
			rc.bEnd = true;
		}
		if(rc.limit == 8){
			rc.mobile = true;
		}else{
			rc.mobile = false;
		}
	}

	// <!--- function to generate list of all models for display --->
	// public function all(struct rc){
	// 	if (NOT IsDefined("application.stcPageContent.stcModels.stc#application.strToday#.qryAllModels")){
	// 		var qryAllModels = ModelsService.qryAllModels();
	// 		application.stcPageContent.stcModels["stc#application.strToday#"].qryAllModels = qryAllModels;
	// 	}
	// 	rc.qryAllModels = application.stcPageContent.stcModels["stc#application.strToday#"].qryAllModels;	
	// }



	public function subscribe(struct rc){
		var strSafeModelLink = StructureModelLink(params.strFilter);
		var stcModelProfile = application.stcPageContent.stcModels["stc#application.strToday#"].stcProfiles["#strSafeModelLink#"];
		if (NOT StructIsEmpty(form)){
			var strEmailAddress = Trim(params.email_address);
			if (IsValid("email", strEmailAddress)){
				var qryDuplicateCheck = ModelsService.qryDuplicateCheck(params.model_id,strEmailAddress);
				if (qryDuplicateCheck.RecordCount EQ 0){
					ModelsService.qryInsertPublicTour();
					// ??????????????????????????????
					sendEmail(from="#application.stcThisSite.strEmail# (#application.stcThisSite.strSiteName#)", to="#strEmailAddress#", subject="Model Interest - #params.model_name#", template="notification", layout="/email");

					location(addtoken="no", url="/Models/#params.strFilter#/Subscribe/Success");
				}else{
					location(addtoken="no", url="/Models/#params.strFilter#/Subscribe/Error/Email-exists");
				}
			}else{
				location(addtoken="no", url="/Models/#params.strFilter#/Subscribe/Error/Email-invalid");
			}
		}
	}

	public function unsubscribe(struct rc) {
		var strSafeModelLink = StructureModelLink(params.strFilter);
		var stcModelProfile = application.stcPageContent.stcModels["stc#application.strToday#"].stcProfiles["#strSafeModelLink#"];
		if (StructKeyExists(params, "strEmail")){
			ModelsService.qryDeletePublicTour();
			location(addtoken="no",url="/Models/#params.strFilter#/Unsubscribe");
		}
	}
	
	public any function StructureModelLink(string strLink) {
		var strStructureModelLink = "";
		strLink = Replace(strLink, "-", "zz", "ALL");
		strStructureModelLink = REReplace(strLink, "[^A-Za-z]", "", "ALL");
		return strStructureModelLink;
	}	

	public any function motyresults(struct rc) {
		var winnerList = "438,961,1117,765,1075,302,776,866,1014,1093,439,1007,468,529,1135,466,16,1067,923,983,648,1073,909,868,465,1128,1039,952,1059,944,985,833,972,947,1091,717,566,1020,587,1099,586,624";
		var count = 0;
		var qryMotyResults = ModelsService.qryMotyResults(winnerList);
	}


	public any function motyVote(struct rc) {
		var arrVotes = ListToArray(params.votes);
		var strEmail = params.email;
		var returningVoter = ModelsService.returningVoter(strEmail);
		if (returningVoter.RecordCount EQ 0){
			arrVotes = ListToArray(params.votes);
			var intLoop = Min(ArrayLen(arrVotes), 10);
			var serial = GeneratePassword(15);
			for(var i=1;i<=intLoop;i++){
				if (IsNumeric(arrVotes[i])){
					var modelId = arrVotes[i];
				}else{
					var modelId = 0;
				}
				ModelsService.qryVotesPublic(strEmail,i,modelId,serial);	
			}
			// ??????????????????????????????
			cookie.MOTYVote = {value="#strEmail#",expires="50"};
			var serialNumber = serial;
		}else{
			var serialNumber = returningVoter.yearly_vote_public_serial;
			ModelsService.qryDeleteVotesPublic(strEmail);
			var intLoop = Min(ArrayLen(arrVotes), 10);
			for(var i=1;i<=intLoop;i++){
				if (IsNumeric(arrVotes[i])){
					var modelId = arrVotes[i];
				}else{
					var modelId = 0;
				}
				ModelsService.qryVotesPublic(strEmail,i,modelId,serial);
			}
		}
		if (returningVoter.RecordCount EQ 0 OR returningVoter.yearly_vote_public_email_confirmed EQ 0){
			var strConfirmLink = "#application.stcThisSite.strSiteUrl#/Models/Model-of-the-Year/Confirm/#strEmail#/#serialNumber#";
			mailerService = new mail();
			savecontent variable="mailBody"{ 
                WriteOutput("<p>
								Hi,
							</p>
							<p>
								Many thanks for taking the time to vote in the #application.stcThisSite.strSiteName# #Year(Now())# Public Model of the Year poll.
							</p>
							<p>
								So we can verify your votes, please click on the link below to confirm your votes.
							</p>
							<p>
								<a href='#strConfirmLink#'>#strConfirmLink#</a>
							</p>
							<p>
								And why not keep upto date with all the news from #UCase(application.stcThisSite.strSiteCode)#, along with
								poll information, and sample images direct from the studio, by following us at Twitter, we are @OnlyAllSites,
								or you can also find us on Facebook at http://www.facebook.com/onlyallsites
							</p>
							<p>
								Once again, many thanks for your votes.
							</p>
							<p>
								The OAS Team.
							</p>"); 
            }
            mailerService.setTo(strEmail); 
            mailerService.setFrom(application.stcThisSite.strEmail); 
            mailerService.setSubject("Model of the Year Voting - confirmation"); 
            mailerService.setType("html");
            mailerService.send(body=mailBody); 
		}
	}

	public function motyConfirm(struct rc) {
		var stcConfirmResult = ModelsService.stcConfirmResult();
	}		
}
