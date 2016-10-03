{% extends 'includes/layout.swig' %}

{% block body %}
 	<div class="post">
 		<h1 class="overview">
 			{% include 'includes/overview.swig' %}
 		</h1>
 		<div class="post-info">
 			<h1>{{page.title}}</h1>
 			<div class="author-info">
 				<p class="author">{{__('author')}}:<a href="{{config.root}}">{{__('name')}}</a></p>
 				{# 时间 #}
 				<p class="date">{{__('time')}}:
 				<span>{{ date(page.date, 'YYYY/MM/DD') }}</span>
 				</p>
 				{#分类和标签#}
 				<p class="cat-arc">
 					{% if page.categories.length %}
		    			{# 组织分类的链接列表 #}
						<span>{{ __('category_title') }}:
					    {% set i = 0 %}
					    {% for cat in page.categories %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
					    {% endfor %}
					    </span>
				    {% endif %}
				    {# 组织标签的链接列表 #}
				    {% if page.tags.length %}
					    <span>
					    {{ __('tag_title') }}:
					    {% set i = 0 %}
					    {% for tag in page.tags %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
					    {% endfor %}
					    </span>
					{% endif %}
 				</p>
 			</div>
 		</div>
 		<div class="post-markdown">
 			{{page.content}}
 		</div>
 		<div class="pre-next">
 			{% if page.prev %}
 				<div class="pre-page">
 					<a href="{{config.root}}{{page.prev.path}}">{{page.prev.title}}</a>
 				</div>
 			{% endif %}
 			{% if page.next %}
 				<div class="pre-page">
 					<a href="{{config.root}}{{page.next.path}}">{{page.next.title}}</a>
 				</div>
 			{% endif %}
 		</div>
 		<div class="post-footer">
 			<h3>{{__('page_footer_header')}}</h3>
 			<ul>
 				<li>
 					<span>版权声明：自由转载-非商用-非衍生-保持署名</span><a href="https://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh">(创意共享3.0许可证)</a>
 				</li>
 				<li>
 					<span>发表日期：{{date(page.date, 'YYYY-MM-DD HH:mm:ss')}}</span>
 				</li>
 				<li>
 					{% if page.categories.length %}
		    			{# 组织分类的链接列表 #}
						<span>{{ __('category_title') }}:
					    {% set i = 0 %}
					    {% for cat in page.categories %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
					    {% endfor %}
					    </span>
				    {% endif %}
 				</li>
 				<li>
				    {# 组织标签的链接列表 #}
				    {% if page.tags.length %}
					    <span>
					    {{ __('tag_title') }}:
					    {% set i = 0 %}
					    {% for tag in page.tags %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
					    {% endfor %}
					    </span>
					{% endif %}
 				</li>
 				<li>
 					<span>最后编辑：{{date(page.updated, 'YYYY-MM-DD HH:mm:ss')}}</span>
 				</li>
 				<li>
 					<span>{{__('contacts')}}</span>
 				</li>
 			</ul>
 		</div>
 		<div class="duoshuo-part">
			{% include 'includes/duoshuo.swig' %}
		</div>
 		{% include 'includes/web-info.swig' %}
 	</div>
{% endblock %}
