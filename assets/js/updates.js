var page = 1;

$(document).ready(function () {
    var date = new Date();
    var m = date.getMonth() + 1;
    $('.dek-search-month').each(function () {
        if($(this).attr('data-month') == m) {
            $(this).addClass('filter-active-month');
        }
    })
});

$(document).on('click',"#loadmore",function(e){
	e.preventDefault();
    $loading = $('<div class="row updates-loading-spin" id="loading"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
    $('#div_loadmore').hide();
    $('#listModels').append($loading);
	loadMore();
});


$(document).on('click',".searchbytime",function(e){
    e.preventDefault();
});

$(document).on('click',".search-month",function(e){
    $('.search-month').each(function(){
        $(this).removeClass('filter-active-month');
    });
    $(this).addClass('filter-active-month');
});

$(document).on('click',".search-year",function(){
    $('.search-year').each(function(){
        $(this).removeClass('filter-active-year');
    });
    $(this).addClass('filter-active-year');
});

$(document).on('click',"#search-archive-desktop",function(e){
    e.preventDefault();
    var month = $('.filter-active-month').attr('data-month');
    var year = $('.filter-active-year').attr('data-year');
    $('html, body').animate({
        scrollTop: $("#search").offset().top
    }, 500);
    $loading = $('<div class="row search-loading-spin" id="loading"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
    $('#div_loadmore').hide();
    $('#listModels').empty();
    $('#listModels').append($loading);
    searchArchive(month, year);
});

$(document).on('click',"#search-archive-mobile",function(e){
    e.preventDefault();
    var month = $('#moblie-month-select option:selected').val();

    var year = $('#moblie-year-select option:selected').val();
    $('html, body').animate({
        scrollTop: $("#search").offset().top
    }, 500);
    $loading = $('<div class="row search-loading-spin" id="loading"><div class="col-md-12"><i class="fa fa-spinner fa-spin fa-2x"></i></div></div>');
    $('#div_loadmore').hide();
    $('#listModels').empty();
    $('#listModels').append($loading);
    $('#moblie-month-select').text($('#moblie-month-select option:selected').attr('month-name'));
    searchArchive(month, year);
});

function loadMore(){
    $.ajax({
        type: "post",
        url:  "/index.cfm/updates/loadMore",
        data: {
            'page':page++
        },
        dataType: "html",
        success: function (data) {
        	$('#loading').remove();
        	$('#listModels').append(data);
        	$('#div_loadmore').show();
        },
        error: function () {

        }
    });
}

function searchArchive(month,year){
     $.ajax({
        type: "post",
        url:  "/index.cfm/updates/searchArchive",
        data: {
            'intMonth':month,
            'intYear' :year
        },
        dataType: "html",
        success: function (data) {
            $('#loading').remove();
            $('#listModels').append(data);
        },
        error: function () {

        }
    });
}