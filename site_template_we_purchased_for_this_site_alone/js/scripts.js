$(document).ready(function () {

/*****************************************************************************
	CONTACT FORM - you can change your notification message here
*****************************************************************************/
   	$("#ajax-contact-form").submit(function() {
				var str = $(this).serialize();		
				$.ajax({
					type: "POST",
					url: "contact_form/contact_process.php",
					data: str,
					success: function(msg) {
						// Message Sent - Show the 'Thank You' message and hide the form
						if(msg == 'OK') {
							result = '<div class="notification_ok">Your message has been sent. Thank you!</div>';
							$("#fields").hide();
						} else {
							result = msg;
						}
						$('#note').html(result);
					}
				});
				return false;
			});

//tooltip 
$("[rel=tooltip]").tooltip();
$("[data-rel=tooltip]").tooltip();
$('#bottom').tooltip();

/***************************************************
	CENTER CONTENT
***************************************************/
$(function() {
    $(window).on('resize', function resize()  {
        $(window).off('resize', resize);
        setTimeout(function () {
            var content = $('#content');
            var top = (window.innerHeight - content.height()) / 2;
            content.css('top', Math.max(0, top) + 'px');
            $(window).on('resize', resize);
        }, 50);
    }).resize();
});
	
/*****************************************************************************
	HEADER & SCROLL
******************************************************************************/	

   $(window).scroll(function () {
	var scaleBg = -$(window).scrollTop() / 4;
		if ($(window).scrollTop() > 1) {
            $('#header').addClass('show-header');
        } else {
            $('#header').removeClass('show-header');
        }
	});

    $('.scroll').smoothScroll({
        offset:-78,
        speed: 800
    });
 
// Mobile Menu Toggle
	$('#nav-toggle').click(function () {
		 if ($('#header').hasClass('responsive-menu')) {
            $('#header').removeClass('responsive-menu');
        } else {
            $('#header').addClass('responsive-menu');
        }
	 });
	$('#menu li a').click(function () {
        if ($('#header').hasClass('responsive-menu')) {
            $('#header').removeClass('responsive-menu');
        }
    });

/*****************************************************************************
	ADD YOU PARALLAX IMAGES HERE
*****************************************************************************/	

( function ( $ ) {
'use strict';
$(document).ready(function(){
$(window).bind('load', function () {
		parallaxInit();						  
	});
	function parallaxInit() {
		testMobile = isMobile.any();
		if (testMobile == null)
		{
			$('#charts .well').parallax("50%", 0.3);
			$('#milestones .well').parallax("50%", 0.3);
			$('#work .well').parallax("50%", 0.3);
			$('#clients_parallax .well').parallax("50%", 0.3);
		}
	}	
	parallaxInit();	 
});	
//Mobile Detect
var testMobile;
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
}( jQuery ));

/*****************************************************************************
	MILESTONE COUNTERS - ADD YOUR PERCENTAGES HERE
******************************************************************************/

	jQuery('#counter-1').appear(function() {
		$('#counter-1').countTo({
			from: 0,
			to: 1440,
			speed: 4000,
			refreshInterval: 50,
			onComplete: function(value) { 
			//console.debug(this); 
			}
			});
		});
	jQuery('#counter-2').appear(function() {
		$('#counter-2').countTo({
			from: 0,
			to: 90,
			speed: 4000,
			refreshInterval: 50,
			onComplete: function(value) { 
			//console.debug(this); 
			}
			});
		});
	jQuery('#counter-3').appear(function() {
		 $('#counter-3').countTo({
			from: 0,
			to: 2001,
			speed: 4000,
			refreshInterval: 50,
			onComplete: function(value) { 
			//console.debug(this); 
			}
			});
		});	
	});

/*****************************************************************************
	TICKER - ADD YOUR TEXT HERE
******************************************************************************/

(function(a){a.fn.airport=function(g,n){var b=a.extend({transition_speed:1000,loop:true,fill_space:false,colors:null},n),m=a(this),j=["a","b","c","d","e","f","g"," ","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","-","1","2","3","4","5","6","7","8","9","0"],h,c,d=0,i=g.length,f=g.length;function e(p,o){return p+new Array(o-p.length+1).join(" ")}m.empty();while(i--){if(g[i].length>d){d=g[i].length}}while(f--){g[f]=e(g[f],d)}h=d;while(h--){var k=document.createElement("span");k.className="c"+h;m.prepend(k)}if(b.colors){c=b.colors.replace(/\s+/g,"").split(",")}function l(x,w,v,u){var q=m.find(".c"+x),r=g[v]?g[v].substring(u,u+1):null,p,s,o=g[v]?a.trim(g[v]).length:null,t=g[v-1]?a.trim(g[v-1]).length:a.trim(g[0]).length;if(v>=g.length){if(!b.loop){clearTimeout(p);return}p=setTimeout(function(){l(0,0,0,0)},10)}else{if(u>=d){p=setTimeout(function(){if(b.colors){s=c[~~(Math.random()*c.length)];m.css("color",s.substring(0,1)==="#"?s:"#"+s)}l(0,0,v+1,0)},b.transition_speed)}else{q.html((j[w]===" ")?"&nbsp;":j[w]);p=setTimeout(function(){if(w>j.length){l(x+1,0,v,u+1)}else{if(j[w]!==r.toLowerCase()){l(x,w+1,v,u)}else{q.html((r===" "&&b.fill_space)?"&nbsp;":r);if(o<t){if(x>o){for(x;x<t;x++){m.find(".c"+x).html("")}u=d}}l(x+1,0,v,u+1)}}},10)}}}l(0,0,0,0)}})(jQuery);

<!--TICKER - add your text here -->

$(".ticker").airport([ "creating web sites","to stand out from the crowd","drinking cups of tea" ]);


  

