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
	    {% if firstPost.categories.length %}
	    {# 组织分类的链接列表 #}
	    <span>{{ __('category_title') }}
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
	    <span>
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
	</div>
{% endif %}