<!doctype html>
<html lang="{{ config.language }}">
	{% include 'includes/head.swig' %}
	<body class="homebody">
	<div class="demo" style="position: absolute;height: 100%;width: 100%;opacity: 0.6;background: #000000;"></div>
	{% include 'includes/svg.swig' %}
	{% include 'includes/footer.swig' %}
	<script type="text/javascript" src="/js/snap.svg-min.js"></script>
	<script type="text/javascript" src="/js/jquery.fireworks.js"></script>
	<script type="text/javascript">
		(function(){
			$("#btn-close").on('click', showHideToggle);
			var hideAll = false;
			function showHideToggle() {
				if(hideAll) {
					$("header").removeAttr('style');
					$("#btn-close").removeAttr('style');
				    $(".hide").show();
				} else {
					$("header").height($("header").height()).css({    'background': 'rgba(0,0,0,0)'});
					$("#btn-close").css({'transform': 'rotate(45deg)','color':'white'});
				    $(".hide").hide();
				}
				hideAll = !hideAll;
			}
		})();
		if(document.body.clientWidth > 1000){
			$('.demo').fireworks({ 
			  sound: true, // sound effect
			  opacity: 0.5, 
			  width: '100%', 
			  height: '100%' 
			});
		}
	</script>
	</body>
</html>
