<cfoutput>

	<input type="hidden" id="strFilter" name="strFilter" value="#rc.strFilter#">

	<div class="row models-header" id="filter">
		<div class="col-md-12">
			<p class="text-center models-header-text">
				OUR MODELS
			</p>
			<p class="text-center text-des-section desktop not-show-on-ipad">
				Experience the thrill of seeing these sexy babes undress in front of you.
			</p>
			<p class="text-center text-des-section mobile no-margin ipad-potrait">
				#rc.stcProfile.strName#
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4">
			<p class="text-center">
				<img class="img-responsive" src="/tour/images/models/450x675/#Replace(rc.stcProfile.strLink," ", "-", "ALL")#_cover_#rc.stcProfile.intId#.jpg"/>
			</p>
		</div>
		<div class="col-md-8">
			<h1 class="header-profile desktop not-show-on-ipad">
				#rc.stcProfile.strName#
			</h1>
			<p class="text-profile desktop">
				#replace(rc.stcProfile.strBio,"<p>","<p class='desktop'>", "all")#
			</p>
			<p>
				<div class="col-md-12 param-container">
					<p class="param-header">
						Inside the #application.stcThisSite.strSiteName# members only area you can see #rc.stcProfile.strName# in:
					</p>
					<p class="number-param">
						<span><i class="fa fa-camera"></i> #NumberFormat(rc.stcProfile.intImages)# IMAGES</span>
						<br class="mobile"/>
						<span><i class="fa fa-list-ul"></i> #NumberFormat(rc.stcProfile.intSets)# SET<cfif rc.stcProfile.intSets GT 1>S</cfif></span>
						<br class="mobile"/>
						<cfif rc.stcProfile.intVideos NEQ 0>
							<span><i class="fa fa-video-camera"></i> #NumberFormat(rc.stcProfile.intVideos)# VIDEO<cfif rc.stcProfile.intVideos GT 1>S</cfif></span>
						</cfif>
					</p>
					<cfif rc.stcProfile.strHeight IS NOT "">
						<p>		
							<span class="text-bold">Height:</span> #rc.stcProfile.strHeight#
						</p>
					</cfif>
					<cfif rc.stcProfile.strStarSign IS NOT "">
						<p>
							<span class="text-bold">Star sign:</span> #rc.stcProfile.strStarSign#
						</p>
					</cfif>
					<p>
						<cfif rc.stcProfile.strBust IS NOT "">
							<span class="padding-right-20"><span class="text-bold">Bust:</span> #rc.stcProfile.strBust#</span>
						</cfif>
						<cfif rc.stcProfile.strWaist IS NOT "">
							<span class="padding-right-20"><span class="text-bold">Waist:</span> #rc.stcProfile.strWaist#</span>
						</cfif>
						<cfif rc.stcProfile.strHips IS NOT "">
							<span class="padding-right-20"><span class="text-bold">Hips:</span> #rc.stcProfile.strHips#</span>
						</cfif>
					</p>
					<cfif rc.stcProfile.strRandomFact IS NOT "">
						<p>
							<span class="text-bold">Random fact:</span> #rc.stcProfile.strRandomFact#
						</p>
					</cfif>
				</div>
			</p>
			<p>
		        <div class="col-md-12 no-padding">
		            <div class="email-header model-pro-mailtext">GET EMAIL UPDATES ABOUT #Ucase(rc.stcProfile.strName)#</div>
		            <form class="form-inline">
		                <div class="form-group width-88-per">
		                    <div class="input-group input-group-lg width-88-per">
		                      <input type="text" class="form-control" id="input_email_to_model" placeholder="Enter your email address here ...">
		                      <div class="input-group-addon" id="button_email">SUBSCRIBE</div>
		                    </div>
		                </div>
		            </form>
		        </div>
			</p>
		</div>
	</div>

	<div class="row models-header" id="filter">
		<div class="col-md-12">
			<p class="text-center models-header-text">
				#rc.stcProfile.strName#'s sample sets
			</p>
			<p class="text-center text-des-section marginBottom-10">
				Below you can preview her members area content
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="sectionContent no-margin">
					<div class="row">
						<cfif ArrayLen(rc.stcProfile.arrGalleries) LT 4>
							<cfset intEndRow = ArrayLen(rc.stcProfile.arrGalleries)>
						<cfelse>
							<cfset intEndRow = 4>
						</cfif>
						<cfloop from="1" to="#intEndRow#" index="i">
							<cfset stcGallery = rc.stcProfile.arrGalleries[i]>
							<!--- <cfif !stcGallery.strSetType IS "video"> --->
							<div class="col-md-12 col-xs-12 item-row">
								<div class="col-md-3 col-sm-6 col-xs-6 block-4-image model-profile-latest text-center">
									<img class="img-responsive" src="/images/v2/tour_images/tn260#stcGallery.strTourPic1#">

									<cfif stcGallery.strSetType == 'photo'>
										<div class="box-in-image models-button-zoom">
											<a class="fancybox" href="#application.strCdnUrl#/tour/images/galleries/711x1066/#stcGallery.strFirstModelLink#/#stcGallery.strTourPic1#" title="#rc.stcProfile.strName#" data-fancybox-group="imgforenlarge">
												<span class="pull-left">Click to enlarge</span>
												<span class="pull-right"><i class="fa fa-search-plus"></i></span>
											</a>
										</div>
									</cfif>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6 block-4-image model-profile-latest desktop not-show-on-ipad">
									<img class="img-responsive" src="/images/v2/mailing_list/tn260#stcGallery.strMailingListPic#"/>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6 block-4-image model-profile-latest text-center">
									<img class="img-responsive" src="/images/v2/tour_images/tn260#stcGallery.strTourPic2#"/>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6 block-4-image model-profile-latest desktop not-show-on-ipad">
									<img class="img-responsive" src="/images/v2/tour_images/tn260#stcGallery.strTourPic3#"/>
								</div>
								<div class="col-md-12 col-xs-12">
									<div class="col-md-12 col-xs-12 block-4-content">
									<div class="col-md-8 col-xs-6 block-4-info #stcGallery.strSetType == 'video' ? 'block-4-info-video' : ''#">
										<p class="number-param block-4-numbers #stcGallery.strSetType == 'video' ? 'block-4-numbers-video' : ''# no-padding spacing-5 pull-left">
											<span class="block-4-date desktop">
												<cfif IsDate(stcGallery.dttReleaseDate)>
													#DateFormat(stcGallery.dttReleaseDate, "dd.mm.yyyy")#
												</cfif>
											</span> 
											<span>
												<cfif IsDate(stcGallery.dttReleaseDate)>
												<y class="desktop">|</y>
												</cfif>
												<cfif stcGallery.strSetType != "video">
													<i class="fa fa-camera"></i> #NumberFormat(stcGallery.intImageCount)# 
												<cfelse>
													<i class="fa fa-film"></i> #stcGallery.strVideoLength# 
												</cfif>
											</span>
										</p>
									</div>
									<div class="col-md-4 col-xs-6 block-4-button #stcGallery.strSetType == 'video' ? 'block-4-button-video' : ''#">
										<a href="/index.cfm/join" class="btn">View full set</a>
									</div>
									</div>
								</div>
							</div>
						</cfloop>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row joinnow-black-block desktop">
		<div class="col-md-9 col-sm-9 joinnow-left desktop">
			Get Access to all of #rc.stcProfile.strName#'s sets immediately
		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 joinnow-right">
			<a href="/index.cfm/join" class="btn">Join Now</a>
		</div>
	</div>

	<cfif rc.qryAllGalleries.recordCount GT 4>
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="sectionContent" id="listSets">
						<h2 class="text-pink">More Sets of #rc.stcProfile.strName#</h2>
						<div class="row-per-more">

						<cfif rc.mobile eq false>
							<cfif ArrayLen(rc.stcProfile.arrGalleries) LT 20>
								<cfset intEndRow = ArrayLen(rc.stcProfile.arrGalleries)>
							<cfelse>
								<cfset intEndRow = 20>
							</cfif>
						<cfelseif rc.mobile eq true>
							<cfif ArrayLen(rc.stcProfile.arrGalleries) LT 12>
								<cfset intEndRow = ArrayLen(rc.stcProfile.arrGalleries)>
							<cfelse>
								<cfset intEndRow = 12>
							</cfif>
						</cfif>
						<cfif ArrayLen(rc.stcProfile.arrGalleries) gt 4>
							<cfloop from="5" to="#intEndRow#" index="i">
								<cfset stcGallery = rc.stcProfile.arrGalleries[i]>
								<div class="col-md-3 col-xs-6 item-row">
									<cfif stcGallery.strSetType IS "video">
										<div class="image-blue ip6-height">
											<a href="/index.cfm/join" class="hide-underline">
												<img class="img-responsive opacity-0-4-margin-26" src="/images/v2/tour_images/tn260#stcGallery.strTourPic1#">
												<img class="img-responsive" src="/images/v2/tour_images/tn260#stcGallery.strTourPic2#">
												<img class="img-responsive opacity-0-4" src="/images/v2/tour_images/tn260#stcGallery.strTourPic3#">
											</a>
										</div>
										<div class="personalContent">
											<div>
												<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25 #(rc.mobile == true) ? 'text-center' : ''#">
													<cfif IsDate(stcGallery.dttReleaseDate)>
														#DateFormat(stcGallery.dttReleaseDate, "dd.mm.yyyy")#
													</cfif>
												</span> 
												<span class="text-blue mobile-block Myriad-Pro-Condensed-25 #(rc.mobile == true) ? 'text-center' : ''#">
													<cfif IsDate(stcGallery.dttReleaseDate)>
														<span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
													</cfif>
													<i class="fa fa-film"></i> #stcGallery.strVideoLength#
												</span>
											</div>
										</div>
									<cfelse>
										<div class="image-pink ip6-height text-center">
											<img class="img-responsive img-more-sets" src="/images/v2/tour_images/tn260#stcGallery.strTourPic1#">	
										</div>
										<div class="personalContent">
											<div>
												<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25 #(rc.mobile == true) ? 'text-center' : ''#">
													<cfif IsDate(stcGallery.dttReleaseDate)>
														#DateFormat(stcGallery.dttReleaseDate, "dd.mm.yyyy")#
													</cfif>
												</span> 
												<span class="text-pink mobile-block Myriad-Pro-Condensed-25 #(rc.mobile == true) ? 'text-center' : ''#">
													<cfif IsDate(stcGallery.dttReleaseDate)>
														<span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> 
													</cfif>
													<i class="fa fa-camera"></i> #NumberFormat(stcGallery.intImageCount)#
												</span>
											</div>
										</div>
									</cfif>
								</div>
								<cfif ((i-4) mod 4) eq 0 or (i-4) eq (ArrayLen(rc.stcProfile.arrGalleries) - 4)>
									</div>
									<cfif (i - 4) lt (ArrayLen(rc.stcProfile.arrGalleries) - 4)>
										<div class="row-per-more">
									</cfif>
								</cfif>
							</cfloop>
						</cfif>		
					</div>
				</div>
			</div>
		</div>

		<cfif rc.qryAllGalleries.recordCount GT 20>
			<div class="models-section-loadmore desktop" id="div_loadmore_desktop">
				<a href="" class="btn models-loadmore" id="loadmore_dekstop">Load More</a>
			</div>
		</cfif>

		<cfif rc.qryAllGalleries.recordCount GT 12>
			<div class="models-section-loadmore mobile" id="div_loadmore_mobile">
				<a href="" class="btn models-loadmore" id="loadmore_mobile">Load More</a>
			</div>
		</cfif>
	</cfif>



	<cfset arrlength_othersites = arrayLen(rc.stcProfile.arrOtherModelSets)>
	<cfif application.stcThisSite.strSiteCode IS NOT "oas" or arrlength_othersites gt 0>
		<div class="row desktop not-show-on-ipad">
			<div class="col-md-12 tab-other-sites-container">
				<ul class="nav nav-tabs tabs-other-sites-ul col-xs-12 no-padding">
					<cfloop from="1" to="#arrlength_othersites#" index="siteIndex">
						<li class="col-md-#12/arrlength_othersites# tab-other-sites #rc.stcProfile.arrOtherModelSets[siteIndex].strShortName#">
					    	<a data-toggle="tab" href="###rc.stcProfile.arrOtherModelSets[siteIndex].strShortName#">#rc.stcProfile.arrOtherModelSets[siteIndex].strSite#</a>
					    </li>
					</cfloop>
			  	</ul>

			  	<div class="tab-content">
			  		<cfif ArrayLen(rc.stcProfile.arrOtherModelSets) NEQ 0>
				  		<cfloop from="1" to="#ArrayLen(rc.stcProfile.arrOtherModelSets)#" index="intSiteIndex">
							<cfif ArrayLen(rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages) GT 0>
								<cfset strSiteUrl = "#rc.stcProfile.arrOtherModelSets[intSiteIndex].strUrl#/#rc.strFilter#">
								<cfset imageurl = "">
								<cfif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-oo">
									<cfset imageurl = "/assets/img/logo260/oo-260.jpg">
								<cfelseif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-os">
									<cfset imageurl = "/assets/img/logo260/os-260.jpg">
								<cfelseif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-oss">
									<cfset imageurl = "/assets/img/logo260/oss-260.jpg">
								</cfif>
								<cfif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName neq "">
									<div id="#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#" class="tab-pane fade in tab-content-other-site">
								      	<div class="col-md-12">
								      		<h4>Sets released of #rc.stcProfile.strName# on our other sites</h4>
								      	</div>
								     	<div class="col-md-12 other-sites-img-container">
								     		
									     	<div id="carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#" class="carousel slide" data-ride="carousel">
											  <!-- Wrapper for slides -->
											  	<div class="carousel-inner" role="listbox">
											  		<cfloop from="1" to="#ArrayLen(rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages)#" index="i">
												    	<div class="item  <cfif i eq 1>active</cfif>">
												    		<div class="col-md-3">
												     			<img src="#imageurl#" class="img-responsive" alt="logo"/>
												    		</div>
												      		<div class="col-md-9 no-padding">
												      			<cfset count = 1>
													     		<cfloop array="#rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][2]#" index="image_url">
														     		<div class="col-md-4 #(count lte 3 and rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][1].image_set eq false) ? 'fixed-row-carousel' : ''#">
														     			<img src="#image_url#" class="img-responsive"/>
														     		</div>
														     		<cfset count += 1>
														     	</cfloop>
												      		</div>
												    	</div>
												    </cfloop>
											  	</div>

												  <!-- Left and right controls -->
												<a class="left carousel-control none-background-image" href="##carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#" role="button" data-slide="prev">
												    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
												    <span class="sr-only">Previous</span>
												</a>
												<a class="right carousel-control none-background-image" href="##carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#" role="button" data-slide="next">
												    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
												    <span class="sr-only">Next</span>
												</a>
											</div>	
								     	</div>
								    </div>
							    </cfif>
					   		</cfif>
	  					</cfloop>
	  				</cfif>
				</div>
		  	</div>
		</div>	

		<!--- for mobile view --->
		<div class="row mobile ipad-potrait">
			<div class="col-md-12">
				<div class="tab-other-sites-container">
					<ul class="nav nav-tabs nav-justified">
					    <li class="nav-mobile-justified tab-other-sites-mobi tab-oo active"><a data-toggle="tab" href="##tab-oo-mobi">OO</a></li>
					    <li class="nav-mobile-justified tab-other-sites-mobi tab-os"><a data-toggle="tab" href="##tab-os-mobi">OS</a></li>
					    <li class="nav-mobile-justified tab-other-sites-mobi tab-oss"><a data-toggle="tab" href="##tab-oss-mobi">OSS</a></li>
					</ul>

				  	<div class="tab-content">
				  		<cfif ArrayLen(rc.stcProfile.arrOtherModelSets) NEQ 0>
					  		<cfloop from="1" to="#ArrayLen(rc.stcProfile.arrOtherModelSets)#" index="intSiteIndex">
								<cfif ArrayLen(rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages) GT 0>
									<cfset strSiteUrl = "#rc.stcProfile.arrOtherModelSets[intSiteIndex].strUrl#/#rc.strFilter#">
									<cfset imageurl = "">
									<cfif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-oo">
										<cfset imageurl = "/assets/img/logo260/oo-260.jpg">
									<cfelseif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-os">
										<cfset imageurl = "/assets/img/logo260/os-260.jpg">
									<cfelseif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName eq "tab-oss">
										<cfset imageurl = "/assets/img/logo260/oss-260.jpg">
									</cfif>
									<cfif rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName neq "">
										<div id="#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#-mobi" class="tab-pane fade in tab-content-other-site-mobi">
									      	<div class="col-md-12">
									      		<h4 class="text-white">Sets released of #rc.stcProfile.strName# on our other sites</h4>
									      	</div>
									     	<div class="col-md-12 other-sites-img-container">
									     		
										     	<div id="carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#_mobi" class="carousel slide" data-ride="carousel">
												  <!-- Wrapper for slides -->
												  	<div class="carousel-inner" role="listbox">
												  		<cfloop from="1" to="#ArrayLen(rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages)#" index="i">
													    	<div class="item  <cfif i eq 1>active</cfif>">
													    		<div class="row">
													      			<cfset count = 1>
													      			<cfif rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][1].image_set eq false >
													      				<cfset k = 2>
													      			<cfelse>
													      				<cfset k = 1>	
													      			</cfif>
														     		<cfloop from="1" to="#ArrayLen(rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][2]) - k#" index="j">
															     		<div class="col-md-6 col-sm-6 col-xs-6 text-center #(count lte 2 and rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][1].image_set eq false) ? 'fixed-row-carousel' : ''#">
															     			<img src="#rc.stcProfile.arrOtherModelSets[intSiteIndex].arrTourImages[#i#][2][#j#]#" class="img-responsive"/>
															     		</div>
															     		<cfset count += 1>
															     	</cfloop>
														      	</div>
													    	</div>
													    </cfloop>
												  	</div>

													  <!-- Left and right controls -->
													<a class="left carousel-control none-background-image" href="##carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#_mobi" role="button" data-slide="prev">
													    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
													    <span class="sr-only">Previous</span>
													</a>
													<a class="right carousel-control none-background-image" href="##carousel_#rc.stcProfile.arrOtherModelSets[intSiteIndex].strShortName#_mobi" role="button" data-slide="next">
													    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
													    <span class="sr-only">Next</span>
													</a>
												</div>	
									     	</div>
									    </div>
								    </cfif>
						   		</cfif>
		  					</cfloop>
		  				</cfif>
					</div>
				</div>
			</div>
		</div>	
	</cfif>

	<div class="row models-choice">
		<div class="col-md-6 membership-tabs">
  			<a class="big-button" href="/index.cfm/join">
	  			<div class="title_text_tab_left">BECOME A MEMBER</div>
	  			<div class="text_tab_left"><p>Find out why we're the best tease site on the net</p></div>
	  			<div class="title_text_tab_left"><i class="fa fa-check"></i></div>
	  		</a>
  		</div>
  		<div class="col-md-6 membership-tabs">
  			<a class="big-button" href="/index.cfm/models">
	  			<div class="title_text_tab_right">CONTINUE EXPLORING</div>
	  			<div class="text_tab_right"><p>Take the tour &amp; learn more about OnlyTease</p></div>
	  			<div class="title_text_tab_right"><i class="fa fa-chevron-right"></i></div>
	  		</a>
  		</div>
	</div>
</cfoutput>