{% extends 'includes/layout.swig' %}

{% block body %}
	<div id="blog-content">
		{% include 'includes/overview.swig' %}
		<div class="content">
			{% include 'includes/article_sort.swig' %}
			{% include 'includes/weibo.swig' %}
			{% include 'includes/recent-posts.swig' %}
		</div>
		<div class="duoshuo-part">
			{#% include 'includes/duoshuo.swig' %#}
		</div>
		{% include 'includes/web-info.swig' %}
	</div>
{% endblock %}
