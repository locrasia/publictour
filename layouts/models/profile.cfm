<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>#rc.strMetaTitle#</title>
		<meta name="description" content="#rc.strMetaDescription#"/>
		<meta name="keywords" content="#rc.strMetaKeywords#"/>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1" />

		<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="/assets/css/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="/assets/css/style-homeTour.css">
		<link rel="stylesheet" href="/assets/css/style-home.css">
		<link rel="stylesheet" href="/assets/css/style-models.css">
		<link rel="stylesheet" href="/assets/css/style-common.css">
		<link rel="stylesheet" href="/assets/css/style-responsive.css">
		<link rel="stylesheet" href="/assets/fancybox2/source/jquery.fancybox.css?v=2.1.5" media="screen" />
		<link rel="stylesheet" href="/assets/fancybox2/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
		<link rel="stylesheet" href="/assets/fancybox2/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />

		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/fancybox2/lib/jquery.mousewheel-3.0.6.pack.js"></script>
		<script src="/assets/fancybox2/source/jquery.fancybox.js?v=2.1.5"></script>
		<script src="/assets/fancybox2/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
		<script src="/assets/fancybox2/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
		<script src="/assets/fancybox2/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/scripts.js"></script>
		<script src="/assets/js/profile.js"></script>
	</head>
	<body>
	    <!--- Header --->
	    #view("common/header")#
	    <!--- Content --->
	    <div class="container">
	  		#body#
	  	</div>
	    <!-- Footer -->
	    #view('common/footer')#
	</body>
	</html>
</cfoutput>