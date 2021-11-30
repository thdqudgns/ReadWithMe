$(document).ready(function() {
	var $slider_list = $("#slider li")
	console.log($slider_list)

	$slider_list.css("left", $("#sliderbox").css("width"))
	$slider_list.eq(0).css("left", 0)

	var sliderClick = function() {
		$("#sliderbox").click()	
	}
	
	var tid = setInterval( sliderClick, 3000 );
	var curSlide = 0;
	
	$("#sliderbox").click(function() {

		clearInterval( tid )
		tid = setInterval( sliderClick, 3000 );

		var nextSlide = curSlide + 1;
		nextSlide %= $slider_list.length;	
		
		console.log(curSlide, ":", nextSlide)

		//현재 슬라이드 숨기기 - curSlide
		$slider_list.eq(curSlide).animate({"left": "-=" + $("#sliderbox").css("width") })

		//다음 슬라이드 준비하기
		$slider_list.eq(nextSlide).css("left", $("#sliderbox").css("width"))
		
		//다음 슬라이드 보여주기 - nextSlide
		$slider_list.eq(nextSlide).animate({"left": "-=" + $("#sliderbox").css("width") })

		//증가식 (순환구조 만들기)
		curSlide++;
		curSlide %= $slider_list.length;
	})
})