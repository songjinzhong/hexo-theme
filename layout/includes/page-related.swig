{% set i = 4 %}
{% set after_now_page = false %}
{% set sort_posts = site.posts.sort('date', -1) %}

{% for postItem in sort_posts.toArray() %}
	{% if page == postItem %}
		{% set after_now_page = true %}
	{% endif %}
	{% if i > 2 and after_now_page %}
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
					<span>{{ date(postItem.date, 'YYYY.MM.DD') }}</span><a href="{{url_for(postItem.path)}}">{{postItem.title}}</a>
					<p>{{truncate(strip_html(postItem.content),{length : 40})}}</p>
				</li>
			{% endif %}
		{% endif %}
	{% endif %}
{% endfor %}
{# another try #}
{% if i > 0 %}
{% set after_now_page = false %}
{% set sort_posts = site.posts.sort('date', 1) %}
{% for postItem in sort_posts.toArray() %}
	{% if page == postItem %}
		{% set after_now_page = true %}
	{% endif %}
	{% if i > 0 and after_now_page %}
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
					<span>{{ date(postItem.date, 'YYYY.MM.DD') }}</span><a href="{{url_for(postItem.path)}}">{{postItem.title}}</a>
					<p>{{truncate(strip_html(postItem.content),{length : 40})}}</p>
				</li>
			{% endif %}
		{% endif %}
	{% endif %}
{% endfor %}
{% endif %}
{# third try #}
{% if i > 0 %}
{% set after_now_page = false %}
{% set counts = 0 %}
{% set sort_posts = site.posts.sort('date', -1) %}
{% for postItem in sort_posts.toArray() %}
	{% if page == postItem %}
		{% set after_now_page = true %}
	{% endif %}
	{% if i > 0 and after_now_page %}
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
				{% if counts < 2 %}
					{% set counts = counts + 1 %}
				{% else %}
					{% set i = i -1 %}
					<li>
						<span>{{ date(postItem.date, 'YYYY.MM.DD') }}</span><a href="{{url_for(postItem.path)}}">{{postItem.title}}</a>
						<p>{{truncate(strip_html(postItem.content),{length : 40})}}</p>
					</li>
				{% endif %}
			{% endif %}
		{% endif %}
	{% endif %}
{% endfor %}
{% endif %}
{% if i == 4 %}
	<li>
		<p>没有相关文章</p>
	</li>
{% endif %}