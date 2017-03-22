{% extends 'includes/layout.swig' %}

{% block body %}
 	<div class="post info">
 		<h1 class="overview">
 			{% include 'includes/overview.swig' %}
 		</h1>
 		<div class="about-me clear">
 			<p class="header"><strong>My Projects</strong><span>/From GitHub</span></p>
 			<div id="projects"></div>
 		</div>
    <div class="github-source">
      <p>
        本页已经在 <a href="https://github.com/songjinzhong/showGitHubProjects" target="_blank">GitHub</a> 上开源，欢迎来访。
      </p>
    </div>
    <div class="last-update">
      <span>最后修改时间:{{date(page.date, 'YYYY年MM月DD日')}}</span>
    </div>
 		{% if page.comments %}
{# 	 		<div class="duoshuo-part" id="comments">
				{% include 'includes/duoshuo.swig' %}
			</div> #}
      <div class="disqus-part" id="comments">
        {% include 'includes/disqus.swig' %}
      </div>
		{% endif %}
 		{% include 'includes/web-info.swig' %}
 	</div>
{% endblock %}
