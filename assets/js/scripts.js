$(document).ready(function() {
	$(".clhomemenu").addClass('height-1');
	if($('.fancybox').length > 0) {
		$('.fancybox').fancybox();
	}

	setMenuActive();

	$('.carousel').each(function(){
        $(this).carousel({
            interval: false
        });
    });
});

function setMenuActive() {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");
    path = decodeURIComponent(path);

    if(path != "") {
    	$('.main-menu-item').each(function () {
	    	$(this).removeClass('active');
	    });
     	$('.main-menu-item').each(function () {
	        var href = $(this).attr('href');
	    	if (path === href) {
	           	$(this).addClass('active');
	        }
	    });
    }

    if(path.search('models') > 0) {
    	$('.main-menu-item[href="/index.cfm/models"]').addClass('active');
    }
}

$(document).on("click",".navbar-header .navbar-toggle", function(event) {
	$("#homemenu").removeClass('height-1');
});

$(document).on('mouseenter', '.models-img-needview', function () {
 	$(this).children('.models-button-view').css({
 		width: $(this).children('img').width()
 	});
 	$(this).children('.models-button-view').show();
});

$(document).on('mouseleave', '.models-img-needview', function () {
 	$(this).children('.models-button-view').hide();
});

$(document).on('click', '.tab-oo', function () {
	$('.other-sites-img-container').css("border-bottom", "10px solid #ec008c");
})

$(document).on('click', '.tab-os', function () {
	$('.other-sites-img-container').css("border-bottom", "10px solid #623F91");
})

$(document).on('click', '.tab-oss', function () {
	$('.other-sites-img-container').css("border-bottom", "10px solid #94B55C");
})


