<!doctype html>
<html lang="{{ config.language }}">
	{% include 'includes/head.swig' %}
	<body class="homebody">
	<div class="demo" style="position: absolute;height: 100%;width: 100%;opacity: 0.6;background: #000000;"></div>
	{% include 'includes/svg.swig' %}
	{% include 'includes/footer.swig' %}
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
    function getExploreName(){
      var userAgent = navigator.userAgent;
      if(userAgent.indexOf("Opera") > -1){
        return 'Opera';
      }else if(userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1){
        return 'IE';
      }else if(userAgent.indexOf("Edge") > -1){
        return 'Edge';
      }else if(userAgent.indexOf("Firefox") > -1){
        return 'Firefox';
      }else if(userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1){
        return 'Safari';
      }else if(userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1){
        return 'Chrome';
      }else if(!!window.ActiveXObject || "ActiveXObject" in window){
        return 'IE>=11';
      }else{
        return 'Unkonwn';
      }
    }
		if(document.body.clientWidth > 800 && /Safari|Chrome/.test(getExploreName())){
			$('.demo').fireworks({ 
			  sound: false, // sound effect
			  opacity: 0.6, 
			  width: '100%', 
			  height: '100%' 
			});
		}
	</script>
	</body>
</html>
