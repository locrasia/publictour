<cfoutput>
	<div class="row" id="search">
		<div class="col-md-12">
			<h1 class="title-Section">REGULAR UPDATES</h1>
			<p class="text-center text-des-section">
				Below are some of our more recent updates. Remember we update OnlyTease.com with at least 3 sets a day, all 100% exclusive.
			</p>
		</div>
	</div>

	<div class="row" id="listModels">
		<cfloop array="#rc.arrLatestUpdates#" index="model">
			<cfif listFind(application.stcThisSite.stcSetTypes.strPhotos,model.strGalleryType)>
				<div class="col-md-3 col-xs-6 item-row">
					<div class="image-pink ip6-height">
						<a href="/index.cfm/models/#model.strModelLink#"><img class="img-responsive" src="/images/v2/tour_images/tn260#Evaluate("model.strTourPic#session.strTourImage#")#"></a>
						<cfif model.strType neq "">
							<div class="box-in-image">
								#model.strType#
							</div>
						</cfif>		
					</div>
					<div class="personalContent">
						<p><a href="/index.cfm/models/#model.strModelLink#" class="text-pink">#model.strModelName#</a></p>
						<div>
							<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(model.datRelease, "dd.mm.yyyy")#</span> 
							<span class="text-pink mobile-block Myriad-Pro-Condensed-25"><span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> <i class="fa fa-camera"></i> #model.intImages#</span></div>
							+
							+
							+
							+
							+
					</div>
				</div>
			<cfelseif listFind(application.stcThisSite.stcSetTypes.strVideos,model.strGalleryType)>
				<div class="col-md-3 col-xs-6 item-row">
					<div class="image-blue ip6-height">
						<a href="/index.cfm/models/#model.strModelLink#" class="hide-underline">
							<img class="img-responsive opacity-0-4-margin-26" src="/images/v2/tour_images/tn260#model.strTourPic1#">
							<img class="img-responsive" src="/images/v2/tour_images/tn260#model.strTourPic2#">
							<img class="img-responsive opacity-0-4" src="/images/v2/tour_images/tn260#model.strTourPic3#">
						</a>
						<cfif model.strType neq "">
							<div class="box-in-video">
								#model.strType#
							</div>
						</cfif>	
					</div>
					<div class="personalContent">
						<p><a href="/index.cfm/models/#model.strModelLink#" class="text-blue">#model.strModelName#</a></p>
						<div>
							<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(model.datRelease, "dd.mm.yyyy")#</span> <span class="text-blue mobile-block Myriad-Pro-Condensed-25">
							<span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> <i class="fa fa-film"></i> #model.strVideoTime#</span>
						</div>
					</div>
				</div>
			</cfif>
		</cfloop>
	</div>

	<div class="row updates-section-loadmore">
		<div class="col-md-12" id="div_loadmore">
			<a href="##" class="updates-loadmore btn-filter-archive" id="loadmore">Load More</a>
		</div>
	</div>

	<div class="row joinnow-black-block">
		<div class="col-md-9 col-sm-9 joinnow-left desktop">
			Get access to over 1,500,000 images and 3,500 Videos
		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 joinnow-right">
			<a href="/index.cfm/join" class="btn">Join Now</a>
		</div>
	</div>

	<div class="row updates-archive">
		<div class="col-md-12 col-sm-12 col-xs-12 updates-archive-img desktop">
			<img class="img-responsive" src="/assets/img/updates-updatearchive.jpg"/>
		</div>
		<div class="udates-archive-circle desktop">
			GET ACCESS TO<br> OVER <span class="text-bold"> 13 YEARS </span><br> WORTH OF EXCLUSIVE<br> PICTURES & VIDEOS
		</div>
		<div class="update-archive-rectangle">
			<p class="text-pink rectangle-header">Updates Archive</p>
			<p class="rectangle-des">View all our past updates for the last 10 years, simply select a month and year and click Search Archive</p>
			<p class="updates-archive-filter">
				<div class="col-md-6 desktop">
					<p class="text-bold">Select year:</p>
					<p>
						<div class="table-responsive updates-table-container">
							<table class="table filter-archive">
						      	<tbody class="filter-content">
						      		<tr>
						      			<cfset i = 1>
						      			<cfloop from="#rc.intEndYear#" to="#rc.intStartYear#" index="y" step="-1">
						      				<td class="search-year <cfif #y# eq #rc.intEndYear#>filter-active-year</cfif>" data-year="#y#"><a class="searchbytime" href="##">#y#</a></td>
						      				<cfif (i mod 6) eq 0>
						      					</tr>	
						      					<cfif y gt #rc.intStartYear#>
						      						<tr>
						      					</cfif>
						      				</cfif>
						      				<cfset i++>
						      			</cfloop>
						      	</tbody>
							</table>
						</div>
					</p>
				</div>
				<div class="col-md-6 desktop">
					<p class="text-bold">Select month:</p>
					<p>
						<div class="table-responsive updates-table-container">
							<table class="table filter-archive">
						      	<tbody class="filter-content">
						      		<tr>
						      			<td class="dek-search-month search-month" data-month="1"><a class="searchbytime" href="##">JAN</a></td>
						      			<td class="dek-search-month search-month" data-month="2"><a class="searchbytime" href="##">FEB</a></td>
						      			<td class="dek-search-month search-month" data-month="3"><a class="searchbytime" href="##">MAR</a></td>
						      			<td class="dek-search-month search-month" data-month="4"><a class="searchbytime" href="##">APR</a></td>
						      			<td class="dek-search-month search-month" data-month="5"><a class="searchbytime" href="##">MAY</a></td>
						      			<td class="dek-search-month search-month" data-month="6"><a class="searchbytime" href="##">JUN</a></td>
						      		</tr>
						      		<tr>
						      			<td class="dek-search-month search-month" data-month="7"><a class="searchbytime" href="##">JUL</a></td>
						      			<td class="dek-search-month search-month" data-month="8"><a class="searchbytime" href="##">AUG</a></td>
						      			<td class="dek-search-month search-month" data-month="9"><a class="searchbytime" href="##">SEP</a></td>
						      			<td class="dek-search-month search-month" data-month="10"><a class="searchbytime" href="##">OCT</a></td>
						      			<td class="dek-search-month search-month" data-month="11"><a class="searchbytime" href="##">NOV</a></td>
						      			<td class="dek-search-month search-month" data-month="12"><a class="searchbytime" href="##">DEC</a></td>
					      			</tr>
						      	</tbody>
							</table>
						</div>
					</p>
				</div>
				<div class="col-md-12 mobile full-width-col">
					<select class="form-control" id="moblie-year-select">
					  	<option value="0">Select Year:</option>
					  	<cfloop from="#rc.intEndYear#" to="#rc.intStartYear#" index="y" step="-1">
					  		<option class="search-year" value="#y#">#y#</option>
					  	</cfloop>
					</select>
				</div>
				<div class="col-md-12 mobile full-width-col marginTop-10">
					<select class="form-control" id="moblie-month-select">
					  	<option value="0">Select Month:</option>
					  	<cfloop from="1" to="12" index="m" step="+1">
					  		<option class="search-month" value="#m#">#MonthAsString(m)#</option>
					  	</cfloop>
					</select>
				</div>
				<div class="col-md-12 filters-action full-width-col mobile">
					<a href="##" class="updates-loadmore btn-filter-archive" id="search-archive-mobile">SEARCH ARCHIVE</a>
				</div>
				<div class="col-md-12 filters-action full-width-col desktop">
					<a href="##" class="updates-loadmore btn-filter-archive" id="search-archive-desktop">SEARCH ARCHIVE</a>
				</div>
			</p>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12 mobile full-width-col">
	    	<div class="background-center background-member-benefits-update">
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
	    <div class="col-md-12 col-sm-12 col-xs-12 full-width-col">
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
	</div>
</cfoutput>