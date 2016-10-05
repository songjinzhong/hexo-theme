<h2>
	{{ __('recent_post') }}
	<a href="{{url_for(config.archive_dir)}}">
		{{ __('archives_sort') }}
	</a>
</h2>
{% if site.posts.length > 0 %}
<ul>
 	{% set num = 0 %}
 	{% for postItem in sort_posts %}
	 	{% if num < 10 %}
	 	<li>
	 		<span>{{ date(postItem.date, 'YYYY-MM-DD') }} » </span>
	 		{% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
	 		<a href="{{ url_for(postItem.path) }}">
	 			{% if postTitle.length < 50 %}
	            	{{ postTitle }}
	          	{% else %}
	            	{{ truncate( postTitle, {length: 50}) }}
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