$(document).ready(function(){

	turnOffBlockDay();
	turnOnBlockDay();
	// turnOffCreditCheckBox();
	// turnOffPayNow();
	turnOnPayNow();
	$('#us-online').parent().parent().hide();
	$('#eu-bank').parent().parent().hide();
	$('#member_ot').hide();
	// $('#div_member2').on('click',function(){return false;});
	$('#paynow_eu').parent().hide();

	$('#site_oas').on('click',function(){
		$(this).removeClass('unselect').addClass('select');
		$('#site_ot').removeClass('select').addClass('unselect');
		initSelectSite();
		resetBlockDay();
		$('#member_oas').show();
		$('#member_ot').hide();
		turnOffPayNow();
		turnOffCreditCheckBox();
		turnOffBlockDay();
		turnOnBlockDay();
		showHidePayNow();
		resetImageIcon();
		$('#us-online').parent().parent().hide();
		$('#eu-bank').parent().parent().hide();
		$('#credit-card').parent().parent().show();
		$('#debit-card').parent().parent().show();
		$('#cash').parent().parent().show();
		$('#epoch').parent().parent().show();
		$('#ccbill').parent().parent().show();
		$('#paypal').parent().parent().show();
		$('html, body').animate({
	        scrollTop: $("#div_member2").offset().top
	    }, 500);
	    // $('.rightCheckbox').parent().parent().addClass('unselect');
	});

	$('#site_ot').on('click',function(){
		$(this).removeClass('unselect').addClass('select');
		$('#site_oas').removeClass('select').addClass('unselect');
		initSelectSite();
		resetBlockDay();
		$('#member_ot').show();
		$('#member_oas').hide();
		turnOffPayNow();
		turnOffCreditCheckBox();
		turnOffBlockDay();
		turnOnBlockDay();
		showHidePayNow();
		resetImageIcon();
		$('#us-online').parent().parent().show();
		$('#eu-bank').parent().parent().show();
		$('#credit-card').parent().parent().show();
		$('#debit-card').parent().parent().show();
		$('#cash').parent().parent().show();
		$('#epoch').parent().parent().show();
		$('#ccbill').parent().parent().show();
		$('#paypal').parent().parent().show();
		$('html, body').animate({
	        scrollTop: $("#div_member2").offset().top
	    }, 500);
	    // $('.rightCheckbox').parent().parent().addClass('unselect');
	});

	$('#cash').on('click',function(){
		$('#ccbill').parent().parent().hide();
		$('#epoch').parent().parent().hide();
		$('#paypal').parent().parent().hide();
		showHidePayNow();
	});

	$('#credit-card').on('click',function(){
		$('#ccbill').parent().parent().show();
		$('#ccbill').parent().parent().removeClass('margin-top-10');
		$('#epoch').parent().parent().show();
		$('#paypal').parent().parent().show();
		showHidePayNow();
	});

	$('#debit-card').on('click',function(){
		$('#ccbill').parent().parent().show();
		$('#ccbill').parent().parent().removeClass('margin-top-10');
		$('#epoch').parent().parent().show();
		$('#paypal').parent().parent().show();
		showHidePayNow();
	});

	$('#us-online').on('click',function(){
		$('#ccbill').parent().parent().show();
		$('#epoch').parent().parent().hide();
		$('#paypal').parent().parent().show();
		if($('#epoch').is(':checked')){
			$('.rightCheckbox').prop("checked", false);
			resetImageIcon();
		}
		// $('#ccbill').prop("checked", true);
		$('#ccbill').parent().parent().addClass('margin-top-10');
		showHidePayNow();
	});

	$('#eu-bank').on('click',function(){
		$('#ccbill').parent().parent().show();
		$('#epoch').parent().parent().hide();
		$('#paypal').parent().parent().show();
		if($('#epoch').is(':checked')){
			$('.rightCheckbox').prop("checked", false);
			resetImageIcon();
		}
		// $('#ccbill').prop("checked", true);
		if($('#ccbill').is(':checked')){
			$('#paynow').parent().hide();
			$('#paynow_eu').parent().show();
		}
		$('#ccbill').parent().parent().addClass('margin-top-10');
	});


	$('#epoch').on('click',function(){
		$(this).next().children().attr('src','/assets/img/icon/logo-2.png');
		$('#ccbill').next().children().attr('src','/assets/img/icon/logo-22.png');
		$('#paypal').next().children().attr('src','/assets/img/icon/logo-11.png');
		showHidePayNow();
	});


	$('#paypal').on('click',function(){
		$(this).next().children().attr('src','/assets/img/icon/logo-3.png');
		$('#ccbill').next().children().attr('src','/assets/img/icon/logo-22.png');
		$('#epoch').next().children().attr('src','/assets/img/icon/logo-33.png');
		showHidePayNow();
	});

	$('#ccbill').on('click',function(){
		if($('#eu-bank').is(':checked')){
			$('#paynow').parent().hide();
			$('#paynow_eu').parent().show();
		}
		$(this).next().children().attr('src','/assets/img/icon/logo-1.png');
		$('#paypal').next().children().attr('src','/assets/img/icon/logo-11.png');
		$('#epoch').next().children().attr('src','/assets/img/icon/logo-33.png');	
	});

	$('.customeCheckbox').on('change',function(){
		if($('.leftCheckbox').is(':checked') && $('.rightCheckbox').is(':checked')){
			turnOnPayNow();
		}else{
			turnOffPayNow();
		}
	});

	$('.leftCheckbox').on('click',function(){
		$('.leftCheckbox').prop("checked", false);
		$(this).prop("checked", true);
		// $('.rightCheckbox').prop("disabled", false);
		// $('.rightCheckbox').parent().parent().removeClass('unselect');
	});

	$('.rightCheckbox').on('click',function(){
		$('.rightCheckbox').prop("checked", false);
		$(this).prop("checked", true);
	});
});

function resetImageIcon(){
	$('#ccbill').next().children().attr('src','/assets/img/icon/logo-22.png');
	$('#paypal').next().children().attr('src','/assets/img/icon/logo-11.png');
	$('#epoch').next().children().attr('src','/assets/img/icon/logo-33.png');	
}

function resetBlockDay(){
	$('.block-day').removeClass('select');
	$('.block-day').find('.check-icon').remove();
	$('.block-day').find('.save-ing').show();
}

function showHidePayNow(){
	$('#paynow').parent().show();
	$('#paynow_eu').parent().hide();
}

function initSelectSite(){
	$('#div_member2').removeClass('unselect');
	$('#div_member3').addClass('unselect');
	$('#text_selected').text('');
}

function turnOffBlockDay(){
	$('.block-day').off('click');
}

function turnOnBlockDay(){
	$div_check ='<div class="check-icon"><i class="fa fa-check"></i></div>';
	$('.block-day').on('click',function(){
		resetBlockDay();
		$(this).addClass('select');
		if(!applePhone()) {
			$(this).addClass('select').find('.save-ing').hide();
		}
		$(this).children('.save-ing').before($div_check);
		// $(this).append($div_check).insertBefore('.save-ing');
		var number_day = $(this).find('.number-day').text();
		var text_recurring = $(this).find('.recurring').text();
		$('#div_member3').removeClass('unselect');
		$('#text_selected').text('You have selected a '+number_day+' days '+text_recurring+' membership');
		if($('#ccbill').is(':checked') == false && $('#eu-bank').is(':checked') == false){
			showHidePayNow();
		}
		turnOnCreditCheckBox();
		$('html, body').animate({
	        scrollTop: $("#div_member3").offset().top
	    }, 500);
	});
}

function turnOffCreditCheckBox(){
	$('.customeCheckbox').prop("disabled", true);
	$('.customeCheckbox').prop("checked", false);
}

function turnOnCreditCheckBox(){
	if(!$('.leftCheckbox').is(':checked')){
		$('.leftCheckbox').first().prop("checked", true);
	}
	if(!$('.rightCheckbox').is(':checked')){
		$('.rightCheckbox').first().prop("checked", true);
		$('#epoch').next().children().attr('src','/assets/img/icon/logo-2.png');	
	}
	$('.customeCheckbox').prop("disabled", false);
	turnOnPayNow();
}

function turnOffPayNow(){
	$('#paynow').unbind('click');
	$('#paynow').on('click',function(){return false;});
}

function turnOnPayNow(){
	$('#paynow').unbind('click');
	$('#paynow').on('click',function(e){
		e.preventDefault();
		var subscribe_value = $('div.block-day.select').attr('data-subscribe-value');
		var payment_left_value = $('.leftCheckbox:checked').attr('data-payment-left');
		var payment_right_value = $('.rightCheckbox:checked').attr('data-payment-right');
		var site_selected = "";
		if($('#site_oas').hasClass('select')){
			site_selected = "site_oas";
		}else if($('#site_ot').hasClass('select')){
			site_selected = "site_ot";
		}
		$.ajax({
	        type: "post",
	        url:  "/index.cfm/join/pass",
	        data: {
	         	'subscribe_value':subscribe_value,
	         	'payment_left_value':payment_left_value,
	         	'payment_right_value':payment_right_value,
	         	'site_selected':site_selected
	        },
	        dataType: "json",
	        success: function (data) {
	        	if(data.success == true){
	    //     		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
					// document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
					// try {
					// 	var pageTracker = _gat._getTracker("UA-830743-36");
					// 	pageTracker._setDomainName("."+ $('#domainName').val());
					// 	pageTracker._setAllowLinker(true);
					// 	pageTracker._setAllowHash(false);
					// 	pageTracker._link(data.link);
					// } catch(err) {
					// 	window.location.reload();
					// }
					window.location.href = data.link;
	        	}
	        	else{
	        		window.location.reload();
	        	}
	        },
	        error: function () {
	        	window.location.reload();
	        }
	    });	
	});
}


function applePhone() {
	if((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i))) 
  	{
	 	return true;
	}
	else {
  		return false;
	}
}