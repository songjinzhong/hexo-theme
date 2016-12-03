{% extends 'includes/layout.swig' %}

{% block body %}
 	<div class="post info">
 		<h1 class="overview">
 			{% include 'includes/overview.swig' %}
 		</h1>
 		<div class="about-me clear">
 			<p class="header"><strong>My Projects</strong><span>/我的项目</span></p>
 			<div id="projects"></div>
 		</div>
 		<div class="last-update">
 			<span>最后修改时间:{{date(page.date, 'YYYY年MM月DD日')}}</span>
 		</div>
 		{% if page.comments %}
	 		<div class="duoshuo-part" id="comments">
				{% include 'includes/duoshuo.swig' %}
			</div>
		{% endif %}
 		{% include 'includes/web-info.swig' %}
 	</div>
{% endblock %}
