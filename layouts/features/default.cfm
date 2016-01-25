<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>#rc.strMetaTitle#</title>
		<meta name="keywords" content="#rc.strMetaKeywords#" />
		<meta name="description" content="#rc.strMetaDescription#"/>
		<meta name="news_keywords" content="" />
		<meta name="viewport" content="initial-scale=1, maximum-scale=1" />

		<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="/assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="/assets/css/jquery.mCustomScrollbar.min.css">
		<link rel="stylesheet" href="/assets/css/style-homeTour.css">
		<link rel="stylesheet" href="/assets/css/style-home.css">
		<link rel="stylesheet" href="/assets/css/style-features.css">
		<link rel="stylesheet" href="/assets/css/style-common.css">
		<link rel="stylesheet" href="/assets/css/style-responsive.css">

		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/scripts.js"></script>
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