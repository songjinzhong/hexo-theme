{% if site.posts.length > 0 %}
	{% set sort_posts = site.posts.sort('date', -1) %}
	{% set firstPost = sort_posts.toArray()[0] %}
	{% set postTitle = firstPost.title || trim(strip_html(firstPost.content))  %}
	<h3>
		<a href="{{ url_for(firstPost.path) }}">
			{% if postTitle.length < 50 %}
				{{ postTitle }}
			{% else %}
			    {{ truncate( postTitle, {length: 50}) }}
			{% endif %}
		</a>
	</h3>
	<span class="post-info">
	    {# 显示时间 #}
	    <span>{{ date(firstPost.date, 'MM/DD') }}</span>
	    <span>{{ __('category_title') }}
	    {% if firstPost.categories.length %}
	    {# 组织分类的链接列表 #}
	    {% set i = 0 %}
	    {% for cat in firstPost.categories %}
	      {% if i !== 0 %}
	        {{'/'}}
	      {% endif %}
	      {% set i = i + 1 %}
	      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
	    {% endfor %}
	    {% else %}
	    	<a href="#">暂无</a>
	    {% endif %}
	    </span>
	    <span>{{ __('tag_title') }}
	    {# 组织标签的链接列表 #}
	    {% if firstPost.tags.length %}
	    {% set i = 0 %}
	    {% for tag in firstPost.tags %}
	      {% if i !== 0 %}
	        {{'/'}}
	      {% endif %}
	      {% set i = i + 1 %}
	      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
	    {% endfor %}
	    {% else %}
	    	<a href="#">暂无</a>
	    {% endif %}
	    </span>
	</span>
	<div class="post-content">
		{# 有些在文章的头部指定了照片，也显示出来 #}
	    {% if firstPost.photos %}
	    	<a class="post-image" href="{{ url_for(firstPost.path) }}">
		    	{% if firstPost.photos.length > 1 %}
		    		<img src="{{ firstPost.photos[1] }}" />
		    	{% else %}
		    		<img src="{{ firstPost.photos[0] }}"/>
		    	{% endif %}   		
	    	</a>
	    {% endif %}
		<p>{{ truncate(strip_html(firstPost.content),{length : 180}) }}<a href="{{ url_for(firstPost.path) }}">阅读全文 <font>»</font></a>
		</p>
		<span><a href="{{url_for(config.web_info_dir)}}">个人简介&联系方式</a></span>
	</div>
{% endif %}