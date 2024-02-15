function slideStart(obj,cnt, rolling){
	var $self = obj;
	var $slideSection = $self.find(".slideSection"); 
	var $btnSlidePrev = $self.find(".btnSlidePrev"); 
	var $btnSlideNext = $self.find(".btnSlideNext");
	var slideLength = $slideSection.length;
	var $initPageIdx = 0, 
		$curPageIdx = 0, 
		$prevPageIdx, 
		$nextPageIdx,
		$autoPlay = $self.attr('autoPlay'),
		$setTo;
	
	function setting(){
		var slidePaging = '';
		for(var i = 0; i < slideLength; i++){
			var className = '';
			if(i == 0){
				className = 'active';
			}
			slidePaging = slidePaging + ('<li class="'+ className +'">'+ Number(i + 1) +'</li>');
		}
		if(slideLength >= 3){
			$slideSection.first().addClass("active");
			$slideSection.first().next().addClass("next");
			$slideSection.last().addClass("prev");
			$self.append('<ul class="slideDots">'+ slidePaging +'</ul>');			
			init();						
		}else if (slideLength == 1){
			$slideSection.addClass("active");
			$btnSlidePrev.hide();
			$btnSlideNext.hide();
			$self.css("margin-bottom", "-80px");
		}else{//리스트가 2일때
			$self.find('.slideList').append($slideSection.eq(0).clone(true));
			$self.find('.slideList').append($slideSection.eq(1).clone(true));
			$slideSection = $self.find(".slideSection"); 
			slideLength = $slideSection.length;
			
			$slideSection.eq(0).addClass("active");
			$slideSection.eq(1).addClass("next");
			$slideSection.last().addClass("prev");
			init();		
		}
	} 
	
	function init(){
		if($autoPlay && !rolling) autoPlay();
		if($autoPlay && rolling) rollingAutoPlay();
		$self.find(".slideDots li").on("click", function(){
			clearTimeout($setTo); 
			$curPageIdx = $(this).index();			
			setElement();
		});
		
		$btnSlidePrev.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx--;		
			setElement();
			e.preventDefault();
		});
		
		$btnSlideNext.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx++;		
			setElement();
			e.preventDefault();
		});
				
		$slideSection.on("click", function(e){
			clearTimeout($setTo); 
			$curPageIdx = $(this).index();
			setElement();
		});
	}
	
	function autoPlay(){
		var autoSc=cnt? cnt : 5000;
		$setTo = setTimeout(function(){      	
			$btnSlideNext.click();
		},autoSc);
	}
	function rollingAutoPlay(){
		$(window).on('scroll',function(){
			var height = $(window).scrollTop() + $(window).height();
			if (height < $self.offset().top || height >=$self.offset().top + 200 + $self.parents(".section").height()) {
			console.log( $self.offset().top);
				$self.removeClass('playing');
				clearTimeout($setTo);
			}
			else{
				if(!$self.hasClass('playing')){
					$self.addClass('playing')
					setTimeout(function(){
						$btnSlideNext.click();

					},autoSc);
				}
			}
		});
		var autoSc = cnt;
			//console.log(autoSc);
		$setTo = setTimeout(function(){
			$btnSlideNext.click();
		},autoSc);


	}