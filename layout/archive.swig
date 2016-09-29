{% extends 'includes/layout.swig' %}

{% block body %}
{% if is_archive() %}
	site.categories.find({name: 'Diary'}).posts.sort('date', -1).limit(14)
{% else %}
	<div class="blog-wrapper">
		{% include 'includes/overview.swig' %}
		<div class="content">
			{% include 'includes/article_sort.swig' %}
			{% include 'includes/weibo.swig' %}
			{% include 'includes/recent-posts.swig' %}
		</div>
	</div>
{% endif %}

{% endblock %}
