component accessors="true" extends="framework.one" {
 
	this.clientmanagement	= "Yes";
	this.sessionmanagement	= "Yes";
	this.setclientcookies	= "Yes";
	this.sessiontimeout		= "#CreateTimeSpan(0,0,30,0)#";
	this.applicationtimeout	= "#CreateTimeSpan(0,1,0,0)#";
	this.datasource = "ot2004_data";
	this.tag.cflocation.addtoken = false;

	this.ormEnabled = true;
	this.invokeImplicitAccessor = true;

	variables.framework.usingSubsystems = false;
	variables.framework.defaultSection = 'main';
	variables.framework.defaultItem = 'default';
	variables.framework.reloadApplicationOnEveryRequest = false;
	variables.framework.routes = [
     { "$GET/models/:strFilter" = "/models/profile/strFilter/:strFilter/"}
   ];

	function setupApplication() {
		application.queryTimeCache   = CreateTimeSpan(0,0,1,0);
		application.applicationName = "Tour site - #cgi.HTTP_HOST#";
		<!--- set base url --->
		application.strIp = cgi.HTTP_HOST;

		<!--- set root directory --->
		application.strRootDir = ExpandPath('/');

		<!--- set application structures and arrays for site-specific data --->
		application.stcThisSite = StructNew();
		application.arrAllSites = ArrayNew(1);

		var oUtilService = createObject('component','model.services.Util');
		application.ticker_content = oUtilService.getTickerContent();
	}

	function setupRequest() {

		var oQueryService = createObject('component','model.services.Query');

		if (ArrayLen(application.arrAllSites) EQ 0) {
			var qrySitesData = oQueryService.qrySitesData();
			loop query="qrySitesData" {
				var stcSiteData = StructNew();
				stcSiteData.strSiteName = qrySitesData.site_name;
				stcSiteData.strSiteCode = qrySitesData.site_code;
				stcSiteData.strDatasource = qrySitesData.site_dsn;
				stcSiteData.strSiteUrl = qrySitesData.site_url;
				stcSiteData.strAffTourUrl = qrySitesData.site_afftour_url;
				stcSiteData.strSiteDomain = qrySitesData.site_domain;
				stcSiteData.strCdnUrl = qrySitesData.site_cdn_url;
				stcSiteData.strSiteColour = qrySitesData.site_colour;
				stcSiteData.strPicsPath = qrySitesData.site_pics_path;
				stcSiteData.strMembersLink = qrySitesData.site_members_url;
				stcSiteData.strEmail = qrySitesData.site_email;
				stcSiteData.intUpdateStartYear = qrySitesData.site_updates_year;
				stcSiteData.bolDisplay = 1;
				stcSiteData.stcCCBill = StructNew();
				stcSiteData.stcCCBill.strSubAccount = qrySitesData.site_ccbill_subaccount;
				stcSiteData.stcCCBill.arrCascades = ListToArray(qrySitesData.site_ccbill_cascades);
				stcSiteData.stcSetTypes = StructNew();
				stcSiteData.stcSetTypes.strPhotos = qrySitesData.site_gallerytypes_photos;
				stcSiteData.stcSetTypes.strVideos = qrySitesData.site_gallerytypes_videos;
				stcSiteData.stcMetaData = StructNew();
				stcSiteData.stcMetaData.strMetaTitle = trim(replace(qrySitesData.site_meta_title,"|"," ","all"));
				stcSiteData.stcMetaData.strMetaDescription = qrySitesData.site_meta_description;
				stcSiteData.stcMetaData.strMetaKeywords = qrySitesData.site_meta_keywords;
				stcSiteData.stcHomePageContent = StructNew();
				stcSiteData.stcHomePageContent.numVideoSizeHd = qrySitesData.site_introvideo_size_hd;
				stcSiteData.stcHomePageContent.numVideoSizeSd = qrySitesData.site_introvideo_size_sd;
				stcSiteData.stcHomePageContent.strWhatsThisSite = qrySitesData.site_homepage_whatsthis;
				stcSiteData.strUpdatesPageTopContent = qrySitesData.site_updatespage_top;
				stcSiteData.arrTaglines = ListToArray(qrySitesData.site_taglines);
				stcSiteData.arrStraplines = ListToArray(qrySitesData.site_straplines, '#Chr(13)##Chr(10)#');
				stcSiteData.str_ga_account = qrySitesData.site_ga_account;
				stcSiteData.str_ga_account_common = qrySitesData.site_ga_account_common;
				stcSiteData.strPrimaryProcessor = qrySitesData.site_primary_processor;
				if (FindNoCase(qrySitesData.site_name, "OnlyTease")) {
					stcSiteData.bolDisplay = 0;
					application.stcThisSite = stcSiteData;
				}
				
				<!--- otcams splash option --->
				var qryOTCamsSplash = oQueryService.qryOTCamsSplash();
				if (qryOTCamsSplash.o_value EQ "1") {
					stcSiteData.bolOTCamsSplash = true;
				}
				else {
					stcSiteData.bolOTCamsSplash = false;
				}
				ArrayAppend(application.arrAllSites, stcSiteData);
			}
		}

		<!--- set DSN and CDN url --->
		// application.dataSourceName = application.stcThisSite.strDatasource;
		application.dataSourceName = "ot2004_data";
		// application.strCdnUrl = application.stcThisSite.strCdnUrl;
		application.strCdnUrl = "http://cdn.onlytease.com";

		<!--- set date for page content update structure --->
		application.strToday = DateFormat(Now(), "yyyymmdd");

		<!--- check that today's content structures are defined --->
		if (NOT IsDefined("application.stcPageContent.stcLayout.stc#application.strToday#")) {

			application.stcPageContent = StructNew();
			application.stcPageContent.stcLayout = StructNew();
			application.stcPageContent.stcHome = StructNew();
			application.stcPageContent.stcFeatures = StructNew();
			application.stcPageContent.stcUpdates = StructNew();
			application.stcPageContent.stcModels = StructNew();
			application.stcPageContent.stcJoin = StructNew();
			application.stcPageContent.stcPodcasts = StructNew();
			application.stcPageContent.stcVideos = StructNew();

			<!--- update counts for layout structure --->
			var stcCounts = StructNew();
			var qryCountStuff = oQueryService.qryCountStuff();

			stcCounts.intModels = qryCountStuff.n_models;
			stcCounts.intGalleries = qryCountStuff.n_galleries;
			if (FindNoCase("onlytease", cgi.HTTP_HOST)) {
				stcCounts.intImages = qryCountStuff.n_images+151500; <!--- Tweaked because of miscount, 439k images when 590k were reported previously --->
				stcCounts.intVideos = qryCountStuff.n_videos+660; <!--- Tweaked because of miscount, 747 vids when 1399 were reported previously --->
			}
			else {
				stcCounts.intImages = qryCountStuff.n_images;
				stcCounts.intVideos = qryCountStuff.n_videos;
			}
			application.stcPageContent.stcLayout["stc#application.strToday#"].stcCounts = stcCounts;

			<!--- reset twitter feed structure --->
			StructDelete(application, "stcTwitter");
		}



		if(NOT isDefined("application.strTourImage"))
		{
			<!--- check the default tour image to show from database --->
			var qryTourImage = QueryExecute("SELECT 	o_value
						FROM	options
						WHERE	o_name = 'strTourImage'",
						[],
						{
							datasource="ot2004_data"
						});
			if(qryTourImage.RecordCount NEQ 0)
			{
				switch(Trim(qryTourImage.o_value))
				{
					case 2:
						application.strTourImage = 2;
					break;
				
					case 3:
						application.strTourImage = 3;
					break;

					default:
						application.strTourImage = 1;
					break;
				}
			}
			else
			{
				application.strTourImage = 1;
			}		
		}	
	
		param name="session.strTourImage" default="#application.strTourImage#";
		if (StructKeyExists(url, "tour")){
			switch(Trim(url.tour)){
				case 2:
					session.strTourImage = 2;
				break;
				case 3:
					session.strTourImage = 3;
				break;
				default:
					session.strTourImage = 1;
				break;
			}
		}
	}
}