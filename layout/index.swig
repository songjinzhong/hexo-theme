<!doctype html>
<html lang="{{ config.language }}">
	{% include 'includes/head.swig' %}
	<body class="homebody">
	{% include 'includes/svg.swig' %}
	{% include 'includes/but-view.swig' %}
	{% include 'includes/footer.swig' %}
	<script type="text/javascript" src="/js/snap.svg-min.js"></script>
	<script type="text/javascript">
	(function(){
		$("#btn-view").on('click', showHideToggle);
		var hideAll = false;
		function showHideToggle() {
			if(hideAll) {
			    $(".hide").show();
			    $("#btn-view").html('隐藏');
			    $("#btn-view").css({'top':'50%'});
			} else {
			    $(".hide").hide();
			    $("#btn-view").html('显示');
			    $("#btn-view").css({'top':'90%'});
			}
			hideAll = !hideAll;
		}
	})();
	</script>
	</body>
</html>