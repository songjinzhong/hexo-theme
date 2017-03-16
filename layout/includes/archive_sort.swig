{% set sort_posts = site.posts.sort('date', -1) %}
{% set howMuch = {} %}
{% set catMuch = {} %}
{% set tagMuch = {} %}
{% for postItem in sort_posts.toArray() %}
  	{% set thisYear = date(postItem.date, 'YYYY') %}
  	{% if !howMuch[thisYear] %}
    	{% set howMuch[thisYear] = 0 %}
  	{% endif %}
  	{% if page.layout == 'categories' %}
  		{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
  		{% for cat in postItem.categories %}
  			{% if !catMuch[cat.name] %}
  				{% set catMuch[cat.name] = 0 %}
  			{% endif %}
  			{% set catMuch[cat.name] = catMuch[cat.name] +1 %}
  		{% endfor %}
  	{% elseif is_category() %}
  		{% for cat in postItem.categories %}
  			{% if !catMuch[cat.name] %}
  				{% set catMuch[cat.name] = 0 %}
  			{% endif %}
  			{% set catMuch[cat.name] = catMuch[cat.name] +1 %}
  			{% if cat.name == page.category %}
  				{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
  			{% endif %}
  		{% endfor %}
  	{% elseif is_tag() %}
  		{% for tag in postItem.tags %}
  			{% if !tagMuch[tag.name] %}
  				{% set tagMuch[tag.name] = 0 %}
  			{% endif %}
  			{% set tagMuch[tag.name] = tagMuch[tag.name] +1 %}
  			{% if tag.name == page.tag %}
  				{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
  			{% endif %}
  		{% endfor %}
  	{% elseif is_archive() %}
  		{% set howMuch[thisYear] = howMuch[thisYear] + 1 %}

  	{% endif %}
{% endfor %}
<div class="cate-header">
	<h2>
		{% if is_archive() %}
			{{__('arc_sort')}}
		{% elseif is_tag() %}
			{{__('tag_sort')}}
		{% elseif is_category() or page.layout === 'categories'%}
			{{__('cat_sort')}}
		{% endif %}
	{% if is_archive() %}
		<a href="{{url_for(config.category_dir)}}">{{__('show_cate')}}</a>
	{% elseif is_category() or page.layout == 'categories' %}
		<a href="{{url_for(config.archive_dir)}}">{{__('show_arch')}}</a>
	{% elseif is_tag() %}
		<a href="{{url_for(config.archive_dir)}}">{{__('show_arch')}}</a>
	{% endif %}
	</h2>
	<ul>
		{% if site.categories and site.categories.length %}
				{% if page.layout == 'categories' %}
					{% for a in site.categories %}
						<li>
							<a href="{{ url_for('/blog/categories/'+a.name) }}">{{a.name}}</a>
							<span>{{catMuch[a.name]}}</span>
						</li>
					{% endfor %}
				{% elseif is_tag() %}
					{% for tag in site.tags %}
						{% if tag.name == page.tag %}
						<li class="cate-choose">
						{% else %}
							<li>
						{% endif %}
							<a href="{{url_for(tag.path)}}">{{tag.name}}</a>
							<span>{{tagMuch[tag.name]}}</span>
						<li>
					{% endfor %}
				{% elseif is_category() %}
					{% for a in site.categories %}
						{% if a.name == page.category %}
							<li class="cate-choose">
						{% else %}
							<li>
						{% endif %}
							<a href="{{ url_for(a.path)}}">{{a.name}}</a>
							<span>{{catMuch[a.name]}}</span>
						</li>
					{% endfor %}
					<li class="cate-all"><a href="{{ url_for(config.category_dir)}}">{{__('all_categories')}}</a></li>
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
								<a href="{{url_for(config.archive_dir+'/'+thisYear)}}">{{thisYear}}</a>
								<span>{{howMuch[thisYear]}}</span>
							</li>
						{% endif %}
					{% endfor %}
					{% if is_year() %}
						<li class="cate-all"><a href="{{url_for(config.archive_dir)}}">{{__('all_archives')}}</a></li>
					{% endif %}
				{% endif %}
      	{% endif %}
	</ul>
</div>

<div class="cate-detail">
	{% if site.posts.length > 0 %}
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
	    		{% if lastMonth !== '00' %}
	    			</ul>
	    		{% endif %}
	    		{% set lastMonth = '00' %}
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
	    	{% set tag_flag = false %}
			{% if is_tag() %}
	    		{% for tag in postItem.tags %}
	    			{% if tag.name == page.tag %}
	    				{% set tag_flag = true %}
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
	    	{% if page.layout == 'categories' or cate_flag or tag_flag or arch_flag%}
	    		{% if is_archive() %}
			    	{% set thisMonth = date(postItem.date, 'MM') %}
			    	{% if lastMonth !== thisMonth %}
			    		{% if lastMonth !== '00' %}
			    			</ul>
			    		{% endif %}
			    		{% set lastMonth = thisMonth %}
			    		<h4>{{thisMonth}}{{__('month')}}</h4>
			    		<ul>
			    	{% endif %}
		    		{% if postItem.hot %}
			    	<li class="hot">
			    	{% else %}
			    	<li>
			    	{% endif %}
				 		{% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
				 		<a href="{{ url_for(postItem.path) }}">
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
					    {% if postItem.tags.length %}
						    {% for tag in postItem.tags %}
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
				 	</li>
		    	{% else %}
		    		{% if postItem.hot %}
			    	<li class="hot">
			    	{% else %}
			    	<li>
			    	{% endif %}
				 		{% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
				 		<a href="{{ url_for(postItem.path) }}">
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
					    {% if postItem.tags.length %}
						    {% for tag in postItem.tags %}
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
				 	</li>
		 		{% endif %}
		 	{% endif %}
	    {% endfor %}
	    </ul>
	    {% if is_archive() %}
	    	</ul>
	    {% endif %}
	{% endif %}
</div>