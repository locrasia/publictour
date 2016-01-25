<cfoutput>
<cfset request.layout = false>
<div class="row-per-more">
	<cfloop from="1" to="#ArrayLen(rc.arrGalleries)#" index="i">
		<cfset stcGallery = rc.arrGalleries[i]>
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
		<cfif ((i-4) mod 4) eq 0 or (i-4) eq (ArrayLen(rc.arrGalleries) - 4)>
			</div>
			<cfif (i - 4) lt (ArrayLen(rc.arrGalleries) - 4)>
				<div class="row-per-more">
			</cfif>
		</cfif>
	</cfloop>
<script type="text/javascript">
	if(#rc.bEnd#){
		if(#rc.mobile# == true){
			$('##div_loadmore_mobile').remove();
		}	
		else{
			$('##div_loadmore_desktop').remove();
		}
	}
</script>
</cfoutput>
