var page = 1;
var limit = 16;
var strFilter = "";



$(document).ready(function () {

    if($('.tabs-other-sites-ul').length > 0 ) {
        $('.tabs-other-sites-ul').children('li').first().addClass('active');

        var $curTab = $('.tabs-other-sites-ul').children('li').first();
        
        if($curTab.hasClass('tab-oo')) {
            $('.other-sites-img-container').css("border-bottom", "10px solid #ec008c");
        }
        if($curTab.hasClass('tab-os'))  {
            $('.other-sites-img-container').css("border-bottom", "10px solid #623F91");
        }

        if($curTab.hasClass('tab-oss'))  {
            $('.other-sites-img-container').css("border-bottom", "10px solid #94B55C");
        }
    }

    if($('.tab-content-other-site').length > 0 ) {
        $('.tab-content-other-site').first().addClass('active');
    }

    if($('.tabs-other-sites-ul-mobi').length > 0 ) {
        $('.tabs-other-sites-ul-mobi').children('li').first().addClass('active');
    }

    if($('.tab-content-other-site-mobi').length > 0 ) {
        $('.tab-content-other-site-mobi').first().addClass('active');
    }
});


$(document).on('click',"#loadmore_dekstop",function(e){
	e.preventDefault();
	$loading_more = $('<div class="row models-loading-more-spin" id="loading-more"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
	$('#div_loadmore_desktop').hide();
	$('#listSets').append($loading_more);
	strFilter = $('#strFilter').val();
    loadMoreProfile()
});

$(document).on('click',"#loadmore_mobile",function(e){
    e.preventDefault();
    limit = 8;
    $loading_more = $('<div class="row models-loading-more-spin" id="loading-more"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
    $('#div_loadmore_mobile').hide();
    $('#listSets').append($loading_more);
    strFilter = $('#strFilter').val();
    loadMoreProfile()
});

function loadMoreProfile(){
    $.ajax({
        type: "post",
        url:  "/index.cfm/models/loadMoreProfile",
        data: {
            'page':page++,
            'limit':limit,
            'strFilter':strFilter
        },
        dataType: "html",
        success: function (data) {
        	$('#listSets').append(data);
        	$('#loading-more').remove();
            if(limit == 8){
                $('#div_loadmore_mobile').show();
            }else{
                $('#div_loadmore_desktop').show();  
            }
        },
        error: function () {

        }
    });
}

