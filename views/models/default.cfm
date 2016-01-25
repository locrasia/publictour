<cfoutput>
	<div class="row desktop not-show-on-ipad">
		<div class="col-md-12">
			<h1 class="title-Section">
				TODAYS FEATURED MODELS
			</h1>
			<p class="text-center text-des-section">
				Below are three of our most popular models, and below that all our models...
			</p>
		</div>
	</div>

	<div class="row models-block-models-3 desktop not-show-on-ipad">
		<cfloop query="rc.qry3FeaturedModel">
			<div class="col-md-4 col-sm-4 col-xs-12 models-img-needview">
				<img class="img-responsive" src="/tour/images/models/330x495/#model_link#_cover_#model_id#.jpg"/>
				<div class="models-button-view">
					<a href="/index.cfm/models/#model_link#" type="button" class="btn">View profile</a>
				</div>
			</div>
		</cfloop>
	</div>

	<div class="row joinnow-black-block desktop not-show-on-ipad">
		<div class="col-md-10 col-sm-9 joinnow-left models-joinnow-left desktop">
			To access all our archive of over 1,500,000 photo and videos, all 100% exclusive to OnlyTease.com
		</div>
		<div class="col-md-2 col-sm-3 col-xs-12 joinnow-right">
			<a href="/index.cfm/join" class="btn">Join Now</a>
		</div>
	</div>

	<div class="row" id="filter">
		<div class="col-md-12">
			<h1 class="title-Section">
				View all our models
			</h1>
			<p class="text-center text-des-section">
				Click on the model to view samples of their sets available within the Members Area.
			</p>
		</div>
	</div>

	<div class="row models-block-search desktop">
		<div class="col-md-12 margin-left-39-percent">
			Search models by first letter:
		</div>
		<cfset active_lastest = "">
		<cfset active_newest = "">
		<cfif session.stcModels.strFilter eq 'Latest-updates'>
			<cfset active_lastest = "active">
			<cfset active_newest = "">
		<cfelseif session.stcModels.strFilter eq 'Newest'>
			<cfset active_newest = "active">
			<cfset active_lastest = "">
		</cfif>
		<div class="col-md-2 models-search-button #active_lastest#">
			<a href="" data-filter="lastest_updates" class="filter">Latest updates</a>
		</div>
		<div class="col-md-2 models-search-button #active_newest#">
			<a href="" data-filter="newest_models" class="filter">Newest models</a>
		</div>
		<div class="col-md-8 models-search-letters">
			<cfloop from="65" to="90" index="this_letter">
				<cfif ListContains(rc.letter_list, "#Chr(this_letter)#")>
					<span>
						<a href="" data-filter="#Chr(this_letter)#" class="filter">#Chr(this_letter)#</a>
					</span>
				</cfif>
			</cfloop>
		</div>
	</div>

	<!--- show list models --->
	<div class="row" id="listModels">
		<cfset count = 1>
		<cfloop query="rc.qryModels">
			<div class="col-md-3 col-sm-6 col-xs-6 marginTop-10px model-block">
				<div class="col-md-12 col-sm-12 col-xs-12 model-block-img">
					<a href="/index.cfm/models/#model_link#"><img class="img-responsive" src="/tour/images/models/260x390/#Replace(model_link," ", "-", "ALL")#_cover_#model_id#.jpg"/></a>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 model-block-info desktop">
					<p class="models-name-text">
						<a href="/index.cfm/models/#model_link#" class="text-pink models-text-pink">
							#model_display_name#
						</a>
					</p>
					<p class="text-pink models-text-pink models-num-info">
					  	<span>
					  		<i class="fa fa-list-ul"></i> #NumberFormat(model_gallery_count)# |
						</span>
						<span>
							<i class="fa fa-camera"></i> #NumberFormat(model_image_count)#
							|
						</span> 
						<span>
							<i class="fa fa-video-camera"></i> #NumberFormat(model_video_count)#
						</span>
					</p>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 model-block-info-mobi mobile">
					<p class="models-name-text">
						<a href="/index.cfm/models/#model_link#" class="text-pink models-text-pink">
							#model_display_name#
						</a>
					</p>
				</div>
				<div class="fullwidth model-button-view mobile">
					<a class="btn" href="/index.cfm/models/#model_link#">
						View Model
					</a>
				</div>
			</div>
			<cfset count += 1>
			<cfif count == 7>
				<div class="col-md-12 col-sm-12 col-xs-12 marginTop-10px bg-black mobile">
					<div class="col-md-8 joinnow-left desktop">
						Get access to over #NumberFormat(Int((application.stcPageContent.stcLayout['stc#application.strToday#'].stcCounts.intVideos/100))*100)# HD Videos
					</div>
					<div class="col-md-4 col-xs-12 joinnow-right">
						<a href="/index.cfm/join" class="btn">Join Now</a>
					</div>
				</div>
			</cfif>

		</cfloop>
	</div>

	<div class="models-section-loadmore" id="div_loadmore">
		<a href="" class="btn models-loadmore" id="loadmore">Load More</a>
	</div>

	<div class="models-section-loadmore button-search-mobi mobile #active_lastest#" >
		<a href="" data-filter="lastest_updates" class="btn btn-latestupdate-mobi filter">latest updates</a>
	</div>
	<div class="newestmodels-mobi button-search-mobi mobile #active_newest#" >
		<a href="" data-filter="newest_models" class="btn btn-newestmodels-mobi filter">newest models</a>
	</div>

	<div class="filter-mobi mobile">
		<p>Search models by first letter:</p>
		<p>
			<div class="box-search-alphabet">
				<p class="">
					<cfloop from="65" to="73" index="this_letter">
						<cfif ListContains(rc.letter_list, "#Chr(this_letter)#")>
							<span>
								<a href="" data-filter="#Chr(this_letter)#" class="filter">#Chr(this_letter)#</a>
							</span>
						</cfif>
					</cfloop>
				</p>
				<p class="">
					<cfloop from="74" to="82" index="this_letter">
						<cfif ListContains(rc.letter_list, "#Chr(this_letter)#")>
							<span>
								<a href="" data-filter="#Chr(this_letter)#" class="filter">#Chr(this_letter)#</a>
							</span>
						</cfif>
					</cfloop>
				</p>
				<p class="">
					<cfloop from="83" to="90" index="this_letter">
						<cfif ListContains(rc.letter_list, "#Chr(this_letter)#")>
							<span>
								<a href="" data-filter="#Chr(this_letter)#" class="filter">#Chr(this_letter)#</a>
							</span>
						</cfif>
					</cfloop>
				</p>
			</div>
		</p>
	</div>	

	<div class="row models-block-search desktop">
		<div class="col-md-12 margin-left-39-percent">
			Search models by first letter:
		</div>
		<div class="col-md-2 models-search-button #active_lastest#">
			<a href="" data-filter="lastest_updates" class="filter">Latest updates</a>
		</div>
		<div class="col-md-2 models-search-button #active_newest#">
			<a href="" data-filter="newest_models" class="filter">Newest models</a>
		</div>
		<div class="col-md-8 models-search-letters">
			<cfloop from="65" to="90" index="this_letter">
				<cfif ListContains(rc.letter_list, "#Chr(this_letter)#")>
					<span>
						<a href="" data-filter="#Chr(this_letter)#" class="filter">#Chr(this_letter)#</a>
					</span>
				</cfif>
			</cfloop>
		</div>
	</div>

	<div class="row mobile">
	    <div class="col-md-12 col-sm-12 col-xs-12 padding-0">
	    	<div class="background-center background-member-benefits-model">
	    		<div class="caption-baner">
		    		<h3 class="text-black">MEMBERSHIP BENEFITS</h3>
		    		<p>Over 1,500,000 exclusive images</p>
		    		<p>Over 2,700 exclusive videos, including many in HD</p>
		    		<p>New updates every single day</p>
		    		<p>Images available in three size (1000, 2000, or 3000 pixels)</p>
		    		<p>Download all sets as zip files to keep</p>
		    		<p>100% exclusive content</p>
		    		<p>Private members'forum</p>
		    		<p>"My OnlyTease" customisable home page</p>
		    		<button type="button" class="btn button-green btn-block btn-lg">Become a member today</button>
		    	</div>
	    	</div>
	    </div>
  	</div>

	<div class="row models-choice">
		<div class="col-md-6 membership-tabs">
  			<a class="big-button" href="/index.cfm/join">
	  			<div class="title_text_tab_left">BECOME A MEMBER</div>
	  			<div class="text_tab_left"><p>Find out why we're the best tease site on the net</p></div>
	  			<div class="title_text_tab_left"><i class="fa fa-check"></i></div>
	  		</a>
  		</div>
  		<div class="col-md-6 membership-tabs">
  			<a class="big-button" href="/index.cfm/join">
	  			<div class="title_text_tab_right">CONTINUE EXPLORING</div>
	  			<div class="text_tab_right"><p>Take the tour &amp; learn more about OnlyTease</p></div>
	  			<div class="title_text_tab_right"><i class="fa fa-chevron-right"></i></div>
	  		</a>
  		</div>
	</div>
</cfoutput>
