<cfoutput>
	<cfset request.layout = false>
	<cfloop query="rc.qryModels">
		<a href="">
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
					<p class="text-pink models-text-pink">
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
		</a>
	</cfloop>
</cfoutput>
