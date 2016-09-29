<!doctype html>
<html lang="{{ config.language }}">
	{% include 'includes/head.swig' %}
	<body class="homebody">
	{% include 'includes/svg.swig' %}
	{% include 'includes/footer.swig' %}
	<script type="text/javascript" src="/js/snap.svg-min.js"></script>
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
					$("#btn-close").css({'transform': 'rotate(45deg)'});
				    $(".hide").hide();
				}
				hideAll = !hideAll;
			}
		})();
	</script>
	</body>
</html>
