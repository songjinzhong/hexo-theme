{% set i = 4 %}
{% set sort_posts = site.posts.sort('date', -1) %}

{% for postItem in sort_posts.toArray() %}
	{% if i > 0 %}
		{% set cate = page.categories %}
		{% set flag = false %}
		{% for cat in page.categories %}
			{% if flag == false %}
				{% for p_cat in postItem.categories %}
					{% if cat.name == p_cat.name %}
						{% set flag = true %}
					{% endif %}
				{% endfor %}
			{% endif %}
		{% endfor %}
		{% if flag == false %}
			{% for tag in page.tags %}
				{% if flag == false %}
					{% for p_tag in postItem.tags %}
						{% if tag.name == p_tag.name %}
							{% set flag = true %}
						{% endif %}
					{% endfor %}
				{% endif %}
			{% endfor %}
		{% endif %}
		{% if flag == true %}
			{% if page !== postItem %}
				{% set i = i -1 %}
				<li>
					<span>{{ date(postItem.date, 'YYYY.MM.DD') }}</span><a href="{{config.root}}{{postItem.path}}">{{postItem.title}}</a>
					<p>{{truncate(strip_html(postItem.content),{length : 40})}}</p>
				</li>
			{% endif %}
		{% endif %}
	{% endif %}
{% endfor %}