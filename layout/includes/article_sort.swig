<div class="archives_sort">
	<h2>文章分类</h2>
	<ul>
		{% if site.categories and site.categories.length %}
			{# 统计 categories #}
			{% set sort_posts = site.posts.sort('date', -1) %}
			{% set catMuch = {} %}
			{% for postItem in sort_posts.toArray() %}
				{% for cat in postItem.categories %}
		  			{% if !catMuch[cat.name] %}
		  				{% set catMuch[cat.name] = 0 %}
		  			{% endif %}
		  			{% set catMuch[cat.name] = catMuch[cat.name] +1 %}
			  	{% endfor %}
			{% endfor %}
			{% set id = 9 %}
			{% for a in site.categories %}
				{% if id > 0 %}
				<li>
					<a href="{{ url_for('/blog/categories/'+a.name) }}">{{a.name}}</a>
					<span>{{catMuch[a.name]}}</span>
				</li>
				{% set id = id - 1 %}
				{% endif %}
			{% endfor %}
			<li><a href="{{ url_for('/blog/categories') }}">{{__('more_archives')}}...</a></li>
      	{% endif %}
	</ul>
</div>