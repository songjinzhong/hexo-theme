{% if site.posts.length > 0 %}
	{% set sort_posts = site.posts.sort('date', -1) %}
	{% set firstPost = sort_posts.toArray()[0] %}
	{% set postTitle = firstPost.title || trim(strip_html(firstPost.content))  %}
	<div class="recent-one">
		<h3>
			<a href="{{ config.root }}{{ firstPost.path }}">
				{% if postTitle.length < 80 %}
					{{ postTitle }}
				{% else %}
				    {{ truncate( postTitle, {length: 80}) }}
				{% endif %}
			</a>
		</h3>
		<p class="page-title-sub">
		    {# 显示时间 #}
		    <span id = "page-title-date">{{ date(firstPost.date, 'M-D') }}</span>
		    {% if firstPost.categories.length %}
		    {# 组织分类的链接列表 #}
		    <span id = "post-title-categories">{{ __('category_title') }}
		    {% set i = 0 %}
		    {% for cat in firstPost.categories %}
		      {% if i !== 0 %}
		        {{'/'}}
		      {% endif %}
		      {% set i = i + 1 %}
		      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
		    {% endfor %}
		    </span>
		    {% endif %}
		    {# 组织标签的链接列表 #}
		    {% if firstPost.tags.length %}
		    <span id = "post-title-tags">
		    {{ __('tag_title') }}
		    {% set i = 0 %}
		    {% for tag in firstPost.tags %}
		      {% if i !== 0 %}
		        {{'/'}}
		      {% endif %}
		      {% set i = i + 1 %}
		      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
		    {% endfor %}
		    </span>
		    {% endif %}
		    {# 有些在文章的头部指定了照片，也显示出来 #}
		    {% if firstPost.photos %}
		      <br>
		      {% set i = 0 %}
		      {% for photo in firstPost.photos %}
		        {% set i = i + 1 %}
		        {% if i <= 3 %}
		          {# 这里使用了 fancybox 的一些功能，具体后面了解 #}
		          <a class="fancybox-thumb" rel="fancybox-thumb" href="{{photo}}">
		            <img src="{{photo}}" />
		          </a>
		        {% endif %}
		      {% endfor %}
		    {% endif %}
		</p>
		<p>{{ truncate(firstPost.content,{length: 200}) }}<a href="{{ url_for(firstPost.path) }}">阅读全文 <font>»</font></a>
		</p>
	</div>
{% endif %}

<div class="recent-posts">
	<h2>
		{{ __('recent_post') }}
		<a href="{{url_for(config.archive_dir)}}">
			{{ __('archives_sort') }}
		</a>
	</h2>
	{% include 'post-more.swig' %}
</div>