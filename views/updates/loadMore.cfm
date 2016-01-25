<cfoutput>
	<cfset request.layout = false>
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
						<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(model.datRelease, "dd.mm.yyyy")#</span> <span class="text-pink mobile-block Myriad-Pro-Condensed-25">
						<span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> <i class="fa fa-camera"></i> #model.intImages#</span>
					</div>
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
						<span class="mobile-block mobi-margin-bottom-10 Myriad-Pro-Condensed-25">#DateFormat(model.datRelease, "dd.mm.yyyy")#</span>
						<span class="text-blue mobile-block Myriad-Pro-Condensed-25"><span class="desktop">&nbsp;&nbsp;|&nbsp;&nbsp;</span> <i class="fa fa-film"></i> #model.strVideoTime#</span>
					</div>
				</div>
			</div>
		</cfif>
	</cfloop>
</cfoutput>