<!doctype html>
<html>
<head>
<!-- #include file="include/webInfo.asp" -->
</head>

<body>
<div id="container">
  <nav>
  	<a class="p1" href="#"></a>
  	<a class="p2" href="#"></a>
  	<a class="p3" href="#"></a>
  	<a class="p4" href="#"></a>
  </nav>
  <div id="content">
  	<div class="bg"></div>
  	<div class="cloud"><img src="images/cloud.png"/></div>
  	<div class="road"><img src="images/road.gif"/></div>
  	<div class="building"><img src="images/building.gif"/></div>
  	<div class="building2"><img src="images/building2.png"/></div>
  	<div class="metro"><img src="images/metro.png"/></div>
  	<div class="bridge"><img src="images/bridge.png"/></div>
  	<div class="building3-1"><img src="images/building3-1.png"/></div>
  	<div class="building3-2"><img src="images/building3-2.png"/></div>
  	<div class="building3-3"><img src="images/building3-3.png"/></div>
  	<div class="building4">
		<div class="shop1"><img src="images/shop1.png"/></div>
		<div class="shop2"><img src="images/shop2.png"/></div>
		<div class="fireStation"><img src="images/fireStation.png"/></div>
		<div class="police"><img src="images/police.png"/></div>
		<div class="shop4"><img src="images/shop4.png"/></div>
		<div class="tree"><img src="images/tree.png"/></div>
		<div class="shop3"><img src="images/shop3.png"/></div>
  	</div>
  	<div class="street2"><img src="images/street2.png"/></div>
  	<div id="cars">
  		<div class="bus"><img src="images/bus.png"/></div>
  		<div class="carPolice"><img src="images/carPolice.png"/></div>
  		<div class="carGreen"><img src="images/carGreen.png"/></div>
  		<div class="carBlue"><img src="images/carBlue.png"/></div>
  		<div class="man"><img src="images/man.png"/></div>
  		<div class="carFire"><img src="images/carFire.png"/></div>
  		<div class="truck"><img src="images/truck.png"/></div>
  		
  		<div class="carRed"><img src="images/carRed.png"/></div>
  		<div class="carYellow"><img src="images/carYellow.png"/></div>
  		<div class="ambulance"><img src="images/ambulance.png"/></div>
  	</div>
  	<div class="street"><img src="images/street.png"/></div>
  </div><!--End of content-->
  <div id="footer">
    footer 從這裡開始
  </div><!--End of footer-->
</div><!--End of container-->
<script>
	$(document).ready(function(){
		var windowH = $(window).height();
		function rwd(){
			$('#content').css('height',windowH);
			$('.cloud').css('top',windowH - 404);
		}
		$(window).resize(function(){
			rwd();
		});
		
		redrawDotNav();
		
		$(window).bind('scroll',function(e){
			parallaxScroll();
			redrawDotNav();
		});
		
		function slide(dotClass,dotPosition){
			$(dotClass).click(function(){
				$('html, body').animate({
					scrollTop: dotPosition
				}, 1000, function() {
					parallaxScroll(); // Callback is required for iOS
				});
				return false;
			});
		}
		slide('.p1',0);
		slide('.p2',1500);
		slide('.p3',3000);
		slide('.p4',4600);		
	});
	function parallaxScroll(){
		var scrolled = $(window).scrollTop();
		$('.cloud').css('left',(0-(scrolled*.2))+'px');
		$('.building').css('right',(0-(scrolled*.3))+'px');
		$('.building2').css('left',(300-(scrolled*.87))+'px');
		$('.road, .bridge, .building4, .street2, #cars, .street').css('left',(0-(scrolled*.89))+'px');
		$('.building3-1').css('left',(80-(scrolled*.85))+'px');
		$('.building3-2').css('left',(2419-(scrolled*.89))+'px');
		$('.building3-3').css('left',(6846-(scrolled*.89))+'px');
	}

	function redrawDotNav(){
		var sectionTop = $(document).scrollTop(),
			section1Top =  0,
			section2Top =  $('.shop2').offset().left + 1000,
			section3Top =  $('.police').offset().left + 3000,
			section4Top =  $('.shop3').offset().left + 4600;
		$('nav a').removeClass('active');
		if( sectionTop >= section1Top && sectionTop < section2Top){
			$('.p1').addClass('active');
		} else if (sectionTop >= section2Top && sectionTop < section3Top){
			$('.p2').addClass('active');
		} else if (sectionTop >= section3Top && sectionTop < section4Top){
			$('.p3').addClass('active');
		} else if (sectionTop > section4Top){
			$('.p4').addClass('active');
		}
	}
</script>
</body>
</html>