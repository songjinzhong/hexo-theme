{% extends 'includes/layout.swig' %}

{% block body %}
	<div class="blog-content clear">
		<h1 class="overview clear">
			{% include 'includes/overview.swig' %}
		</h1>
		<div class="content clear">
			<div class="left-part">
				{% include 'includes/article_sort.swig' %}
{# 			{% include 'includes/weibo.swig' %}#}
			</div>
			<div class="recent-one">
				{% include 'includes/recent-one.swig' %}
			</div>
			<div class="recent-two">
				{% include 'includes/recent-two.swig' %}
			</div>
			<div class="recent-posts">
				{% include 'includes/recent-posts.swig' %}
			</div>
		</div>
{# 		<div class="duoshuo-part">
			{% include 'includes/duoshuo.swig' %}
		</div> #}
		<div class="disqus-part">
			{% include 'includes/disqus.swig' %}
		</div>
		{% include 'includes/web-info.swig' %}
	</div>
{% endblock %}
