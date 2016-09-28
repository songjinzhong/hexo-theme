{% extends 'includes/layout.swig' %}

{% block body %}

<div class="blog-wrapper">
	{% include 'includes/overview.swig' %}
	<div class="content">
		{% include 'includes/article_sort.swig' %}
		{% include 'includes/weibo.swig' %}
		{% include 'includes/recent-posts.swig' %}
	</div>
</div>

{% endblock %}
