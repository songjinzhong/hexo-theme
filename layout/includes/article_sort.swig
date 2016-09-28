<div class="right-part">
	<div class="entry">
		<h2>文章分类</h2>
		<ul>
			{% if site.categories and site.categories.length %}
				{% set id = 10 %}
					{% for a in site.categories %}
						{% if id > 0 %}
						<li>
							<a href="{{ url_for('/blog/categories/'+a.name) }}">{{a.name}}</a>
						</li>
						{% set id = id - 1 %}
						{% endif %}
					{% endfor %}
					<li><a href="{{ url_for('/blog/categories') }}">More...</a></li>
	      	{% endif %}
		</ul>
	</div>
</div>