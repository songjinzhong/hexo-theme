{% include 'includes/head.swig' %}
{% include 'includes/impress.swig' %}
{% include 'includes/footer.swig' %}

<script type="text/javascript">
	if ("ontouchstart" in document.documentElement) { 
	    document.querySelector(".hint").innerHTML = "<p>在左侧或右侧点击继续</p>";
	}
	impress().init();
</script>