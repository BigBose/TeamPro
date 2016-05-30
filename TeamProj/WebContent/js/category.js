$(document).ready(function(){
	// HTML markup implementation, overlap mode, initilaize collapsed
	$( '#menu' ).multilevelpushmenu({
		containersToPush: [$( '#pushobj' )],
		collapsed: true,

		// Just for fun also changing the look of the menu
		wrapperClass: 'mlpm_w',
		menuInactiveClass: 'mlpm_inactive'
	});
});



function layer_open(el) {

	   
	   $(".pop-layer").hide();
	    $(".pop-layer:eq(0)").show();
	    
	    $(".signup").click(function () {
	        $(".pop-layer").hide()
	        $(".pop-layer:eq(1)").fadeIn()
	    });
	    
	   var temp = $('#' + el);
	   var bg = temp.prev().hasClass('bg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	   if (bg) {
	      $('.layer').fadeIn(); //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다.
	   } else {
	      temp.fadeIn();
	   }

	   // 화면의 중앙에 레이어를 띄운다.
	   if (temp.outerHeight() < $(document).height())
	      temp.css('margin-top', '-' + temp.outerHeight() / 2 + 'px');
	   else
	      temp.css('top', '0px');
	   if (temp.outerWidth() < $(document).width())
	      temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
	   else
	      temp.css('left', '0px');


	   $('.layer .bg').click(function(e) { //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
	      $('.layer').fadeOut();
	      e.preventDefault();
	   });

	}
