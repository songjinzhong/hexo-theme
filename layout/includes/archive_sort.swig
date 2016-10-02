{% if page.layout == 'categories' %}

<div class="cate-header">
	<h2>文章分类</h2>
	<ul>
		{% if site.categories and site.categories.length %}
				{% for a in site.categories %}
					<li>
						<a href="{{ url_for('/blog/categories/'+a.name) }}">{{a.name}}</a>
					</li>
				{% endfor %}
      	{% endif %}
	</ul>
</div>

<div class="cate-detail">
	{% if site.posts.length > 0 %}
		{% set sort_posts = site.posts.sort('date', -1) %}
		{% set howMuch = {} %}
	    {% for postItem in sort_posts.toArray() %}
	      	{% set thisYear = date(postItem.date, 'YYYY') %}
	      	{% if !howMuch[thisYear] %}
	        	{% set howMuch[thisYear] = 0 %}
	      	{% endif %}
	      	{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
	    {% endfor %}
	    {% set lastYear = '2050' %}
	    {% for postItem in sort_posts.toArray() %}
	    	{% set thisYear = date(postItem.date, 'YYYY') %}
	    	{% if thisYear !==lastYear %}
	    		{% if lastYear != '2050' %}
	    			</ul>
	    		{% endif %}
	    		{% set lastYear = thisYear %}
	    		<h3>{{ lastYear }}
	    		{% if howMuch[lastYear] %}
	    			<span>
	    				{{ __('total_title') }}
						{{ howMuch[thisYear] }}
						{% if 1 === howMuch[thisYear] %}
							{{ __('post_title') }}
						{% else %}
							{{ __('posts_title') }}
						{% endif %}
	    			</span>
	    		{% endif %}
	    		</h3>
	    		<ul>
	    	{% endif %}
	    	<li>
		 		{% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
		 		<a href="{{ config.root }}{{ postItem.path }}">
		 			{% if postTitle.length < 40 %}
		            	{{ postTitle }}
		          	{% else %}
		            	{{ truncate( postTitle, {length: 40}) }}
		          	{% endif %}
		 		</a>
		 		<span>{{ date(postItem.date, 'YYYY-MM-DD') }} » </span>
		 		<span>
			    {{ __('tag_title') }}
			    {% set i = 0 %}
			    {% for tag in postItem.tags %}
			      {% if i !== 0 %}
			        {{'/'}}
			      {% endif %}
			      {% set i = i + 1 %}
			      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
			    {% endfor %}
			    </span>
	          </a>
		 	</li>
	    {% endfor %}
	    </ul>
	{% endif %}
</div>

{% endif %}