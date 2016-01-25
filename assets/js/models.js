var page = 1;
var limit = 12;
var strFilter = 'lastest_updates';

$(document).on('mouseenter', '.filter', function () {
	$(this).parent().css('background','#268cb0');
	$(this).css('color','#fff');
});

$(document).on('mouseleave', '.filter', function () {
	$(this).parent().css('background','#f2f3f3');
	$(this).css('color','#268cb0');
});

$(document).on('click',"#loadmore",function(e){
	e.preventDefault();
	$loading_more = $('<div class="row models-loading-more-spin" id="loading-more"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
	$('#div_loadmore').hide();
	$('#listModels').append($loading_more);
	loadMore();
});

$(document).on('click',".filter",function(e){
	e.preventDefault();
	$('html, body').animate({
        scrollTop: $("#filter").offset().top
    }, 500);

    strFilter = $(this).attr('data-filter');
	page = 0;
	limit = 24;

	$('.filter').each(function(){
		$(this).parent().removeClass('active');
		if($(this).attr('data-filter') == strFilter){
			$(this).parent().addClass('active');
		}
	});
	$loading_filter = $('<div class="row models-loading-filter-spin" id="loading-filter"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
	$('#listModels').empty();
	$('#div_loadmore').hide();
	$('#listModels').append($loading_filter);
	loadMore();
});

function loadMore(){
    $.ajax({
        type: "post",
        url:  "/index.cfm/models/loadMore",
        data: {
            'page':page++,
            'limit':limit,
            'filter':strFilter
        },
        dataType: "html",
        success: function (data) {
        	$('#listModels').append(data);
        	$('#loading-filter').remove();
        	$('#loading-more').remove();
        	if(strFilter.length > 1){
				$('#div_loadmore').show();
			}else{
				$('#div_loadmore').hide();
			}
        },
        error: function () {

        }
    });
}