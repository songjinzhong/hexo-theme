{% if theme.scripts !== undefined && theme.scripts.length > 0 %}
	{# scripts list from config.yml #}
	{% for url in theme.scripts %}
	<script src="{{ url_for(url) }}"></script>
	{% endfor %}
	{# baidi Analytics #}
	{% if config.baidu_tongji or theme.baidu_tongji %}
		{% include 'baidu-tongji.swig' %}
	{% endif %}

	{# google Analytics #}
	{% if config.google_tongji or theme.google_tongji %}
		{% include 'google-tongji.swig' %}
	{% endif %}
	{# for highlight.js,but now in hexo #}
	{#{% if is_post() %}
		<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.7.0/highlight.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			  $('pre code').each(function(i, block) {
			    hljs.highlightBlock(block);
			  });
			});
		</script>
	{% endif %}#}
{% endif %}