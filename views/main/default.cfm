<cfoutput>
	<div class="marginBottom-10 mobile"></div>
	<section id="banner-panel" class="banner-panel">
		<div id="myCarousel" class="carousel slide">
			  <!-- Carousel items -->
		    <div class="carousel-inner">
			    <div class="active item">
			    	<img class="bannerHome" src="/assets/img/panelHome.png"/>
			    	<div class="carousel-caption mobile-carousel-panner">
	                  	<h3>we specialise in the erotic - not the extreme!</h3>
	                </div>    
			    </div>
		  	</div>
		  	
		</div>

		<div class="row icon-desModel">
			<div class="col-md-4 col-sm-12 col-xs-12 text-center text-bigsize mobi-margin-bottom-10 main-counting-gallery">
				<a class="text-black">
					<img src="/assets/img/logo-girls.png" class="image-modelLogo"/>
					#NumberFormat(application.stcPageContent.stcLayout['stc#application.strToday#'].stcCounts.intModels)# Models
				</a>	
			</div>
			<div class="col-md-4 col-sm-12 col-xs-12 text-center text-pink text-bigsize mobi-margin-bottom-10 main-counting-gallery">
				<i class="fa fa-camera"></i> #NumberFormat(application.stcPageContent.stcLayout['stc#application.strToday#'].stcCounts.intImages)# Images
			</div>
			<div class="col-md-4 col-sm-12 col-xs-12 text-center text-blue text-bigsize mobi-margin-bottom-10 main-counting-gallery">
				<i class="fa fa-film"></i> #NumberFormat(application.stcPageContent.stcLayout['stc#application.strToday#'].stcCounts.intVideos)# Videos	
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<p class="text-center home-text-des">
					Experience the thrill of seeing these sexy babes undress in front of you, slowly removing their garments piece by piece to leave just enough for your imagination to go wild. As they slowly tease you with their bodies, we can guarantee it will leave you wanting to see more and more with each click...
				</p>
			</div>
		</div>

		<div class="row grey-background">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center mobi-font-size-20">Highest-quality HD videos ready to either download or stream online</h2>
					</div>
					<div class="col-md-8 col-md-offset-2">
						<div class="embed-responsive embed-responsive-4by3 border-white-5">
						  	<iframe class="embed-responsive-item" src="http://www.youtube.com/embed/1cuTxz9nBkM?vq=hd720&showinfo=0&rel=0"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">

				<div class="row joinnow-black-block">
					<div class="col-md-8 col-sm-8 joinnow-left desktop">
						Get access to over #NumberFormat(Int((application.stcPageContent.stcLayout['stc#application.strToday#'].stcCounts.intVideos/100))*100)# HD Videos
					</div>
					<div class="col-md-4 col-sm-4 col-xs-12 joinnow-right">
						<a href="/index.cfm/join" class="btn">Join Now</a>
					</div>
				</div>

				<div class="col-md-12">
					<div class="row">
						<div class="sectionContent">
							<h2 class="text-pink pull-left-title">Latest Updates</h2>
							<p class="sub-sectionContentTitle sub-pull-left-title">Ultra sized photos now upto 5,600 pixels</p>
							<cfset i = 1>
							<div class="row">
							<cfloop query="rc.qryLatestUpdates">
								<cfif listFind(application.stcThisSite.stcSetTypes.strVideos,gallery_type)>
									<div class="col-md-3 col-xs-6 item-row">
										<div class="image-blue ip6-height">
											<a href="/index.cfm/models/#model_link#" class="hide-underline">
												<img class="img-responsive opacity-0-4-margin-25" src="/images/v2/tour_images/tn260#tour_pic1#">
												<img class="img-responsive" src="/images/v2/tour_images/tn260#tour_pic2#">
												<img class="img-responsive opacity-0-4" src="/images/v2/tour_images/tn260#tour_pic3#">
												<cfif gallery_type NEQ 4>
													<div class="box-in-video">
														<cfswitch expression="#gallery_type#">
															<cfcase value="5">Bonus Video!</cfcase>
															<cfcase value="6">Model of the Month!</cfcase>
															<cfcase value="12">Model of the Year Bonus!</cfcase>
															<cfcase value="13">Newcomer of the Year Bonus!</cfcase>
															<cfcase value="14">Interview Video</cfcase>
															<cfcase value="16">Guest Editor Bonus</cfcase>
															<cfcase value="18">Tease @ Home</cfcase>
															<cfcase value="20">Behind the Scenes</cfcase>
														</cfswitch>
													</div>
												</cfif>
											</a>
										</div>
										<div class="personalContent">
											<p><a href="/index.cfm/models/#model_link#" class="text-blue Myriad-Pro-Condensed-25">#model_display_name#</a></p>
											<div><span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(release_date,"dd.mm.yyyy")#</span> <span class="text-blue mobile-block Myriad-Pro-Condensed-25"><span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> <i class="fa fa-film"></i> #video_total_time#</span></div>
										</div>
									</div>
								<cfelseif listFind(application.stcThisSite.stcSetTypes.strPhotos,gallery_type)>
									<div class="col-md-3 col-xs-6 item-row">
										<div class="image-pink ip6-height">
											<a href="/index.cfm/models/#model_link#" class="hide-underline">
												<img class="img-responsive" src="/images/v2/tour_images/tn260#Evaluate("tour_pic#session.strTourImage#")#">
											</a>
											<cfif gallery_type NEQ 1>
												<div class="box-in-image">
													<cfswitch expression="#gallery_type#">
														<cfcase value="2">Bonus Set</cfcase>
														<cfcase value="3">Model of the Month Bonus</cfcase>
														<cfcase value="7">Prestige Tease</cfcase>
														<cfcase value="10">Model of the Year Bonus</cfcase>
														<cfcase value="11">Newcomer of the Year Bonus</cfcase>
														<cfcase value="15">Guest Editor Bonus</cfcase>
														<cfcase value="17">Tease @ Home</cfcase>
														<cfcase value="19">Behind the Scenes</cfcase>
													</cfswitch>
												</div>
											</cfif>
										</div>
										<div class="personalContent">
											<p><a href="/index.cfm/models/#model_link#" class="text-pink Myriad-Pro-Condensed-25">#model_display_name#</a></p>
											<div>
												<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(release_date,"dd.mm.yyyy")#</span> 
												<span class="text-pink mobile-block Myriad-Pro-Condensed-25">
													<span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;
													</span>
													 <i class="fa fa-camera"></i> #gallery_n_images#
												</span>
											</div>
										</div>
									</div>
								</cfif>
								<cfif (i%4 eq 0) or (i eq rc.qryLatestUpdates.RecordCount)>
									</div>
									<cfif i lt rc.qryLatestUpdates.RecordCount>
										 <div class="row">
									</cfif>
								</cfif>
								<cfset i++>
							</cfloop>
							<div class="row">
								<div class="col-md-4 col-md-offset-4  col-sm-12 col-xs-12 text-center">
									<a href="/index.cfm/updates" class="btn button-pink btn-lg btn-block main-button">More Updates</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">

				<div class="row joinnow-black-block">
					<div class="col-md-9 col-sm-9 joinnow-left desktop font-size-19">
						Over 1,500,000 images, all 100% exclusive to OnlyTease.com
					</div>
					<div class="col-md-3 col-sm-3 joinnow-right">
						<a href="/index.cfm/join" class="btn">Join Now</a>
					</div>
				</div>

				<div class="col-md-12">
					<div class="row">
						<div class="sectionContent">
							<div class="row">
								<div class="col-md-6">
									<h2>Top Voted Teases</h2>
									<p class="sub-sectionContentTitle text-bold">Top voted teases chosen by the OnlyTease community</p>
									<div class="row">
										<cfloop from="1" to="2" index="i">
											<cfset strQueryName = application.stcPageContent.stcHome["stc#application.strToday#"]["qryMonth#i#"]>
											<cfloop query="#strQueryName#">
												<div class="col-md-6 col-xs-6 item-row max-height-499">
													<div class="image-black ip6-height models-img-needview">
														<img class="img-responsive" src="/images/v2/tour_images/tn260#Evaluate("tour_pic#session.strTourImage#")#">
														<cfif gallery_type NEQ 1>
															<div class="box-in-image">
																<cfswitch expression="#gallery_type#">
																	<cfcase value="2">Bonus Set</cfcase>
																	<cfcase value="3">Model of the Month Bonus</cfcase>
																	<cfcase value="7">Prestige Tease</cfcase>
																	<cfcase value="10">Model of the Year Bonus</cfcase>
																	<cfcase value="11">Newcomer of the Year Bonus</cfcase>
																	<cfcase value="15">Guest Editor Bonus</cfcase>
																	<cfcase value="17">Tease @ Home</cfcase>
																	<cfcase value="19">Behind the Scenes</cfcase>
																</cfswitch>
															</div>
														</cfif>
														<div class="button-view models-button-view">
															<a href="/index.cfm/models/#model_link#" class="btn button-pink btn-lg hover-button">View profile</a>
														</div>
													</div>
													<div class="personalContent max-height-110">
														<p>
															<a href="/index.cfm/models/#model_link#" class="text-black pull-left">#model_display_name#</a>
														</p>
														<p class="no-margin home-top-voted">
															<span class="mobile-block mobi-margin-bottom-10 text-bold helvetica-16 desktop">
																<i class="fa fa-camera"></i> #gallery_n_images#&nbsp;&nbsp;&nbsp;&nbsp; 
																<span class="text-pink helvetica-16 desktop">
																	<cfif DateFormat(release_date,"mmmm") EQ DateFormat(NOW(),"mmmm")>
																		#DateFormat(release_date,"mmmm")#'s Leader
																	<cfelse>
																		#DateFormat(release_date,"mmmm yyyy")#
																	</cfif>
																</span>
															</span>
															<p class="mobile-block mobi-margin-bottom-10  helvetica-16 mobile">
																<i class="fa fa-camera"></i> #gallery_n_images#
															</p>
															<p class="text-pink pull-right mobile-block mobile-not-float helvetica-16 mobile">
																<cfif DateFormat(release_date,"mmmm") EQ DateFormat(NOW(),"mmmm")>
																	#DateFormat(release_date,"mmmm")#'s Leader
																<cfelse>
																	#DateFormat(release_date,"mmmm yyyy")#
																</cfif>
															</p>
														</p>
													</div>
												</div>
											</cfloop>
										</cfloop>
									</div>
									<div class="row">
										<div class="col-md-12">
											<a href="/index.cfm/join" class="btn button-black btn-block btn-lg">Vote for your favourite tease!</a>
										</div>
									</div>
								</div>
								
								<div class="col-md-6">
									<h2>Recently Added Models</h2>
									<p class="sub-sectionContentTitle text-bold">Introducing the latest OnlyTease models</p>
									<div class="row">
										<cfloop query="rc.qryLatestModels">
											<div class="col-md-6 col-xs-6 item-row max-height-499">
												<div class="image-pink ip6-height models-img-needview">
													<img class="img-responsive" src="/tour/images/models/260x390/#Replace(model_link," ","-")#_cover_#model_id#.jpg" alt="#model_display_name# at #application.stcThisSite.strSiteName#" title="#model_display_name# at #application.stcThisSite.strSiteName#">
													<div class="button-view models-button-view">
														<a href="/index.cfm/models/#model_link#" class="btn button-pink btn-lg">View profile</a>
													</div>
												</div>
												<div class="personalContent max-height-110 ">
													<p><a href="/index.cfm/models/#model_link#" class="text-pink pull-left">#model_display_name#</a></p>
													<p class="text-pink">
														<span class="mobile-block mobi-margin-bottom-10 helvetica-16 pull-left">
															<i class="fa fa-camera"></i> #model_n_images#&nbsp;|&nbsp; 
															<i class="fa fa-list-ul"></i> #model_n_galleries# <span class="desktop">&nbsp;|&nbsp;</span> 
															<br class="mobile">
															<i class="fa fa-video-camera"></i> #model_n_videos#
														</span>
													</p>
												</div>
											</div>
										</cfloop>
									</div>
									<div class="row">
										<div class="col-md-12">
											<a href="/index.cfm/models" class="btn button-grey btn-block btn-lg">View all models</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	    <div class="row">
		    <div class="col-md-12 col-sm-12 col-xs-12">
		    	<div class="background-center background-member-benefits-home">
		    		<div class="caption-baner">
			    		<h3 class="text-black">MEMBERSHIP BENEFITS</h3>
			    		<p class="helvetica-16">Over 1,500,000 exclusive images</p>
			    		<p class="helvetica-16">Over 2,700 exclusive videos, including many in HD</p>
			    		<p class="helvetica-16">New updates every single day</p>
			    		<p class="helvetica-16">Images available in three size (1000, 2000, or 3000 pixels)</p>
			    		<p class="helvetica-16">Download all sets as zip files to keep</p>
			    		<p class="helvetica-16">100% exclusive content</p>
			    		<p class="helvetica-16">Private members'forum</p>
			    		<p class="helvetica-16">"My OnlyTease" customisable home page</p>
			    		<button type="button" class="btn button-green btn-block btn-lg">Become a member today</button>
			    	</div>
		    	</div>
		    </div>
		    <div class="col-md-12 col-sm-12 col-xs-12">
		  		<div class="col-md-6 membership-tabs">
		  			<a class="big-button" href="/index.cfm/join">
			  			<div class="title_text_tab_left">BECOME A MEMBER</div>
			  			<div class="text_tab_left"><p class="helvetica-20">Find out why we're the best tease site on the net</p></div>
			  			<div class="title_text_tab_left"><i class="fa fa-check"></i></div>
			  		</a>
		  		</div>
		  		<div class="col-md-6 membership-tabs">
		  			<a class="big-button" href="/index.cfm/features">
			  			<div class="title_text_tab_right">CONTINUE EXPLORING</div>
			  			<div class="text_tab_right"><p class="helvetica-20">Take the tour &amp; learn more about OnlyTease</p></div>
			  			<div class="title_text_tab_right"><i class="fa fa-chevron-right"></i></div>
			  		</a>
		  		</div>
		  	</div>
	  	</div>
	  	
	  	<div class="clear"></div>
	  	<div class="row background-blue">
	  		<div class="col-md-12 text-center">
		  		<p><i class="fa fa-twitter fa-2x"></i><span class="text-onlyallSites">@OnlyallSites</span></p>
		  		<p class="spanFollowUS">Porchia W is feeling frisky in the House of Tease today</p>
		  		<p class="spanFollowUS">##FriskyFriday ##FoxyFriday ##FantasyFriday ##Tease ##OnlyAllSites</p>
		  		<p class="spanFollowUS-date">1:02 PM - 31 Jul 2015</p>
	    		<a href="https://twitter.com/OnlyAllSites" target="_blank"><button type="button" class="btn button-white btn-lg main-button">Follow us</button></a>
	  		</div>
	  	</div>
	</section>
</cfoutput>
		