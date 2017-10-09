var Yadadya = {
	params: {
		$body: $(".g-body"),
		$animated: [],
		isDesctop: window.matchMedia("(min-width: 1101px)"),
		isTablet: window.matchMedia("(max-width: 1100px)"),
		isMobile: window.matchMedia("(max-width: 720px)"),
		rem: parseFloat(getComputedStyle($("html")[0]).fontSize),
		windowPoint: parseInt($(window).height() * 0.9),
		resetItems: {},
		supportFunc: {},
	},
	resize: function(func){
		$(window).on("resize", func);
	},
	reset: function(){		
	},
	mobile: function(){		
	},
	tablet: function(){
	},
	desctop: function(){
	},
	run: function(){
		Yadadya.params.rem = parseFloat(getComputedStyle($("html")[0]).fontSize);
		Yadadya.params.windowPoint = parseInt($(window).height() * 0.9);
		if (Yadadya.params.isMobile.matches) {
			Yadadya.mobile();
	    } else if (Yadadya.params.isTablet.matches) {
	    	Yadadya.tablet();
	    } else {
	    	
	    	Yadadya.desctop();
	    }
	},
	DOMReady: function(func){
		$(document).on('turbolinks:load', function(){
			func();
		});
	},
	scroll: function(func){
		$(window).scroll(func);
	}
}
Yadadya.resize(function(){
	Yadadya.reset();
	Yadadya.run();
});

$(window).on("turbolinks:load", function(){
	$(".g-img-wrapper").each(function(){
		$(this).css({width: $(this).find(".g-img-wrapper__bg").outerWidth()});
	});
});

Yadadya.resetItems = {
	pointsSlider: null,
    pointsSliderSlide: null,
    whomSlider: null,
    whomSliderSlide: null,
    organizersSlider: null,
    organizersSliderSlide: null,

}
Yadadya.reset = function(){
	if(Yadadya.resetItems.pointsSlider){
        Yadadya.resetItems.whatSliderSlide = Yadadya.resetItems.pointsSlider.getCurrentSlide();
        Yadadya.resetItems.pointsSlider.destroySlider();
        Yadadya.resetItems.pointsSlider = null;
    }
    if(Yadadya.resetItems.whomSlider){
        Yadadya.resetItems.whomSliderSlide = Yadadya.resetItems.whomSlider.getCurrentSlide();
        Yadadya.resetItems.whomSlider.destroySlider();
        Yadadya.resetItems.whomSlider = null;
    }
	if(Yadadya.resetItems.speakersSlider){
        Yadadya.resetItems.speakersSliderSlide = Yadadya.resetItems.speakersSlider.getCurrentSlide();
        Yadadya.resetItems.speakersSlider.destroySlider();
        Yadadya.resetItems.speakersSlider = null;
    }
	if(Yadadya.resetItems.organizersSlider){
        Yadadya.resetItems.organizersSliderSlide = Yadadya.resetItems.organizersSlider.getCurrentSlide();
        Yadadya.resetItems.organizersSlider.destroySlider();
        Yadadya.resetItems.organizersSlider = null;
    }

}
Yadadya.tablet = function(){
	$(".g-what-list__item, .g-why-list__item").css({height: "auto"});
	Yadadya.resetItems.organizersSlider = $("#organizers-slider").bxSlider({
		minSlides: 3,
		maxSlides: 4,
		moveSlides: 1,
		mouseDrag: true,
		slideWidth: parseInt(24.5 * Yadadya.params.rem, 10),
		slideMargin: parseInt(Yadadya.params.rem, 10),
		startSlide: Yadadya.resetItems.organizersSliderSlide || 0
	});

	Yadadya.resetItems.pointsSlider = $("#points-slider").bxSlider({
		minSlides: 2,
		maxSlides: 3,
		moveSlides: 2,
		slideWidth: parseInt(25.8 * Yadadya.params.rem, 10),
		slideMargin: parseInt(5 * Yadadya.params.rem / 6, 10),
		mouseDrag: true,
		startSlide: Yadadya.resetItems.pointsSliderSlide || 0
	});
	Yadadya.resetItems.whomSlider = $("#whom-slider").bxSlider({
		minSlides: 2,
		maxSlides: 4,
		moveSlides: 2,
		slideWidth: parseInt(25.8 * Yadadya.params.rem, 10),
		slideMargin: parseInt(5 * Yadadya.params.rem / 6, 10),
		mouseDrag: true,
		startSlide: Yadadya.resetItems.whomSliderSlide || 0
	});
	var maxHeight = 0;
	$("#points-slider").find(".g-icons__item").each(function(){
		if(maxHeight < $(this).outerHeight())
			maxHeight = $(this).outerHeight();
	}).css({height: maxHeight});
	maxHeight = 0;
	$("#whom-slider").find(".g-icons__item").each(function(){
		if(maxHeight < $(this).outerHeight())
			maxHeight = $(this).outerHeight();
	}).css({height: maxHeight});
}
Yadadya.mobile = function(){
	Yadadya.resetItems.organizersSlider = $("#organizers-slider").bxSlider({
		minSlides: 2,
		maxSlides: 3,
		moveSlides: 1,
		slideWidth: parseInt(14.5 * Yadadya.params.rem, 10),
		slideMargin: parseInt(Yadadya.params.rem, 10),
		mouseDrag: true,
		startSlide: Yadadya.resetItems.organizersSliderSlide || 0
	});

	Yadadya.resetItems.pointsSlider = $("#points-slider").bxSlider({
		minSlides: 1,
		maxSlides: 1,
		moveSlides: 1,
		adaptiveHeight: true,
		mouseDrag: true,
		startSlide: Yadadya.resetItems.pointsSliderSlide || 0
	});
	Yadadya.resetItems.whomSlider = $("#whom-slider").bxSlider({
		minSlides: 1,
		maxSlides: 1,
		moveSlides: 1,
		adaptiveHeight: true,
		mouseDrag: true,
		startSlide: Yadadya.resetItems.whomSliderSlide || 0
	});
	Yadadya.resetItems.speakersSlider = $("#speakers-slider").bxSlider({
		minSlides: 1,
		maxSlides: 1,
		moveSlides: 1,
		adaptiveHeight: true,
		mouseDrag: true,
		startSlide: Yadadya.resetItems.speakersSliderSlide || 0
	});
}
Yadadya.DOMReady(function(){
	Yadadya.run();
	if (Yadadya.params.isMobile.matches)
		Yadadya.params.$animated = $(".js-animation.js-animation_mobile");
	else if (Yadadya.params.isTablet.matches)
		Yadadya.params.$animated = $(".js-animation.js-animation_tablet");
	else
		Yadadya.params.$animated = $(".js-animation");
	Yadadya.params.$animated.each(function(){
		$(this).css({
			"visibility": "hidden",
        	"animation-name": "none"});
	});
	var tiltSettings = {
				movement: {
					imgWrapper : {
						translation : {x: -5, y: -5, z: -5},
						rotation : {x: 0, y: 0, z: 0},
						reverseAnimation : {duration : 200, easing : 'easeOutQuad'}
					}
				}
			};
	$(".js-tilter").each(function(){
		new TiltFx(this, tiltSettings);
	});
	$(".js-input-phone").inputmask("+7 (999) 999-99-99");
	function setErrorInput($input, state){
        $input.parents(".g-input").toggleClass("g-input_error", state);
    }
    function setSuccessInput($input, state){
        $input.parents(".g-input").toggleClass("g-input_success", state);
    }
    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
	$(".js-input").on("focus", function(){
	    setErrorInput($(this), false);
	    setSuccessInput($(this), false);
	});
	function togglePopup($popup){
		Yadadya.params.$body.toggleClass("g-body_overflow");
		$popup.fadeToggle();
	};
	function openTooltip($target){
		var $tooltip = $target.find(".g-radio__info-wrapper");
		var indent = 10;
		$target.removeClass("g-radio__info_bottom");
		$tooltip.removeAttr("style").find(".g-radio__info-arrow").removeAttr("style");
		if($tooltip.offset().top - $(window).scrollTop() < 0)
			$target.addClass("g-radio__info_bottom");
		if($tooltip.offset().left < 0){
			$tooltip.find(".g-radio__info-arrow").css({"margin-left": $tooltip.offset().left - indent});
			$tooltip.css({"margin-left": indent - $tooltip.offset().left});
		} else if($tooltip.offset().left + $tooltip.outerWidth() > $(window).width()){
			var pos = $tooltip.offset().left + $tooltip.outerWidth() - $(window).width() + indent;
			$tooltip.find(".g-radio__info-arrow").css({"margin-left": pos});
			$tooltip.css({"margin-left": -pos});
		}
		$target.addClass("g-radio__info_open");
	}
	$(".js-btn").on("click", function(){
		$('html, body').animate({scrollTop: $($(this).attr("href")).offset().top - 60}, 500);
	});
	if (!Yadadya.params.isMobile.matches){
		var $speak_wrapper = $(".g-speakers__list"),
	        $speakers = $speak_wrapper.find(".g-speakers__item"),
	        counter = 4;
	        if (Yadadya.params.isMobile.matches)
	            counter = 1;
	        else if (Yadadya.params.isTablet.matches)
	            counter = 3;
	        for(var i = 0; i < counter; i++)
	            $("<div>", {class: "g-speakers__colum"}).appendTo($speak_wrapper);
	        var $colums = $speak_wrapper.find(".g-speakers__colum");
	        $speakers.each(function(idx){
	            $(this).appendTo(
	                $colums.eq(idx % counter)
	            );
	        });
	}
	$(document).on("click", function(e){
		var $target = $(e.target).closest(".g-radio__info");
		if($target.length){
			e.preventDefault();
			if(!$target.hasClass(".g-radio__info_open"))
				$(".g-radio__info").removeClass("g-radio__info_open");	
			openTooltip($target);
			return false;
		}
		else
			$(".g-radio__info").removeClass("g-radio__info_open");


	});

  // Закрываем все попапы
	$("#approval-popup").on("click", function(ev){
		
		if($(ev.target).hasClass("g-popup") || $(ev.target).closest(".js-close").length == 1)
			togglePopup($("#approval-popup"));
	});
  $("#success-nocost-popup").on("click", function(ev){
    
    if($(ev.target).hasClass("g-popup") || $(ev.target).closest(".js-close").length == 1)
      togglePopup($("#success-nocost-popup"));
  });
  $("#success-cost-popup").on("click", function(ev){
    
    if($(ev.target).hasClass("g-popup") || $(ev.target).closest(".js-close").length == 1)
    {
      togglePopup($("#success-cost-popup"));
    }
  });


	$(document).on("submit", ".g-form", function(e){
            e.preventDefault();
            var $inputs = $(this).find(".js-input"),
                error = false;
            $inputs.each(function(){
                switch($(this).attr("name")) {
                    case "name":
                        if($(this).val() == ""){
                            error = true;
                            setErrorInput($(this), true);
                        } else
	                        setSuccessInput($(this), true);
                        break;
                    case "company":
                        if($(this).val() == ""){
                            error = true;
                            setErrorInput($(this), true);
                        } else
	                        setSuccessInput($(this), true);
                        break;
                    case "email":
                        if(!validateEmail($(this).val())){
                            error = true;
                            setErrorInput($(this), true);
                        } else
	                        setSuccessInput($(this), true);
                        break;
                    case "phone":
                        if(!$(this).inputmask("isComplete")){
                            error = true;
                            setErrorInput($(this), true);
                        } else
	                        setSuccessInput($(this), true);
                    default:
                        break;
                };
            });
            if(!error){
            	var $form = $(this);
            	$form.find("input").attr("disabled", true);
            	setTimeout(function(){
            		togglePopup($("#success-popup"));
            		$inputs.each(function(){
	                    $(this).val("").parents(".g-input").removeClass("g-input_success");
	                });
	                $form.find("input").removeAttr("disabled");
            	}, 1000);
            }
            return false;
        });
});
Yadadya.scroll(function(){
	Yadadya.params.$animated.each(function(){
		if($(this).offset().top < $(window).scrollTop() + Yadadya.params.windowPoint && !$(this).hasClass("js-animation_animated"))
			$(this).removeAttr("style").css({"animation-delay": $(this).data("animation-delay")}).addClass("js-animation_animated");

	});
});