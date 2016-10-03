{% set sort_posts = site.posts.sort('date', -1) %}
<div class="cate-header">
	<h2>
		{% if is_archive() %}
			归档分类
		{% else %}
			文章分类
		{% endif %}
	{% if is_archive() %}
		<a href="{{config.root}}{{config.category_dir}}">{{__('show_cate')}}</a>
	{% elseif is_category or page.layout == categories %}
		<a href="{{config.root}}{{config.archive_dir}}">{{__('show_arch')}}</a>
	{% endif %}
	</h2>
	<ul>
		{% if site.categories and site.categories.length %}
				{% if page.layout == 'categories' %}
					{% for a in site.categories %}
						<li>
							<a href="{{ url_for('/blog/categories/'+a.name) }}">{{a.name}}</a>
						</li>
					{% endfor %}
				{% elseif is_category() %}
					{% for a in site.categories %}
						{% if a.name == page.category %}
							<li class="cate-choose">
						{% else %}
							<li>
						{% endif %}
							<a href="{{ url_for('/blog/categories/'+a.name)}}">{{a.name}}</a>
						</li>
					{% endfor %}
					<li class="cate-all"><a href="{{ url_for('/blog/categories/')}}">{{__('all_categories')}}</a></li>
				{% elseif is_archive() %}
					{% set lastYear = '0000' %}
					{% for postItem in sort_posts.toArray() %}
						{% set thisYear = date(postItem.date, 'YYYY') %}
						{% if lastYear !== thisYear %}
							{% set lastYear = thisYear %}
							{% if is_year() and thisYear == page.year %}
							<li class="cate-choose">
							{% else %}
							<li>
							{% endif %}
								<a href="{{config.root}}{{config.archive_dir}}/{{thisYear}}">{{thisYear}}</a>
							</li>
						{% endif %}
					{% endfor %}
				{% endif %}
      	{% endif %}
	</ul>
</div>

<div class="cate-detail">
	{% if site.posts.length > 0 %}
		{% set howMuch = {} %}
	    {% for postItem in sort_posts.toArray() %}
	      	{% set thisYear = date(postItem.date, 'YYYY') %}
	      	{% if !howMuch[thisYear] %}
	        	{% set howMuch[thisYear] = 0 %}
	      	{% endif %}
	      	{% if page.layout == 'categories' %}
	      		{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
	      	{% elseif is_category() %}
	      		{% for cat in postItem.categories %}
	      			{% if cat.name == page.category %}
	      				{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
	      			{% endif %}
	      		{% endfor %}
	      	{% elseif is_archive() %}
	      		{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
	      	{% endif %}
	    {% endfor %}
		{% set lastMonth = '00' %}
	    {% set lastYear = '0000' %}
	    {% for postItem in sort_posts.toArray() %}
	    	{% set thisYear = date(postItem.date, 'YYYY') %}
	    	{% if thisYear !==lastYear %}
	    		{% set now_year = false %}
	    		{% if is_year() %}
	    			{% if page.year == thisYear %}
	    				{% set now_year = true %}
	    			{% endif %}
	    		{% endif %}
	    		{% if lastYear != '0000' and !is_year()%}
	    			</ul>
	    		{% endif %}
	    		{% set lastYear = thisYear %}
	    		{% if !is_year() or now_year %}
		    		<h3>
		    		<a href="{{ config.root }}{{ config.archive_dir }}/{{lastYear}}">{{ lastYear }}</a>
		    		<span>(
	    				{{ __('total_title') }}
						{{ howMuch[thisYear] }}
						{% if 1 >= howMuch[thisYear] %}
							{{ __('post_title') }}
						{% else %}
							{{ __('posts_title') }}
						{% endif %}
		    		)</span>
		    		</h3>
		    	{% endif %}
		    	{% if !is_year() or now_year %}
	    		<ul>
	    		{% endif %}
	    	{% endif %}
	    	{% set cate_flag = false %}
	    	{% if is_category() %}
	    		{% for cat in postItem.categories %}
	    			{% if cat.name == page.category %}
	    				{% set cate_flag = true %}
	    			{% endif %}
	    		{% endfor %}
	    	{% endif %}
	    	{% set arch_flag = false %}
	    	{% if is_year() %}
	    		{% set postyear = date(postItem.date, 'YYYY') %}
	    		{% if page.year == postyear %}
	    			{% set arch_flag = true %}
	    		{% endif %}
	    	{% elseif is_archive() %}
	    		{% set arch_flag = true %}
	    	{% endif %}
	    	{% if page.layout == 'categories' or cate_flag or arch_flag%}
	    		{% if is_year() %}
			    	{% set thisMonth = date(postItem.date, 'MM') %}
			    	{% if lastMonth !== thisMonth %}
			    		{% if lastMonth !== '00' %}
			    			</ul>
			    		{% endif %}
			    		{% set lastMonth = thisMonth %}
			    		<h4>{{thisMonth}}</h4>
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
				 	</li>
		    	{% else %}
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
				 	</li>
		 		{% endif %}
		 	{% endif %}
	    {% endfor %}
	    </ul>
	{% endif %}
</div>