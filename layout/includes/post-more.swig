{% if site.posts.length > 0 %}
<ul>
 	{% set num = 0 %}
 	{% for postItem in sort_posts %}
	 	{% if num < 9 %}
	 	<li style="list-style:circle">
	 		<span>{{ date(postItem.date, 'YYYY-MM-DD') }} » </span>
	 		{% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
	 		<a href="{{ config.root }}{{ postItem.path }}">
	 			{% if postTitle.length < 80 %}
	            	{{ postTitle }}
	          	{% else %}
	            	{{ truncate( postTitle, {length: 80}) }}
	          	{% endif %}
	 		</a>
          </a>
	 	</li>
	 	{% set num = num + 1 %}
	 	{% endif %}
 	{% endfor %}
	<li>
 		<a href="{{ url_for(config.archive_dir) }}">{{ __('more_articles') }}</a>
 	</li>
</ul>
{% endif %}