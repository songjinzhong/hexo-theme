{% extends 'includes/layout.swig' %}

{% block body %}
	<div id="toc">
		<div class="toc-header">
			<i class="toc-icon"></i>
			文章目录
		</div>
		{{ toc(page.content) }}
	</div>
 	<div class="post">
 		<h1 class="overview">
 			{% include 'includes/overview.swig' %}
 		</h1>
 		<div class="post-info">
 			<h1>{{page.title}}</h1>
 			<div class="author-info">
 				<p class="author">{{__('author')}}:<a href="{{url_for(config.web_info_dir)}}">{{__('name')}}</a></p>
 				{# 时间 #}
 				<p class="date">{{__('time')}}:
 				<span>{{ date(page.date, 'YYYY/MM/DD') }}</span>
 				</p>
 				{#分类和标签#}
 				<p class="cat-arc">
 					<span>{{ __('category_title') }}:
 						{% if page.categories.length %}
		    			{# 组织分类的链接列表 #}
					    {% set i = 0 %}
					    {% for cat in page.categories %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
					    {% endfor %}
					  {% else %}
					  	<a href="#">{{__('no_item')}}</a>
				    {% endif %}
				  </span>
				    {# 组织标签的链接列表 #}
				  <span>{{ __('tag_title') }}:
				    {% if page.tags.length %}
					    {% set i = 0 %}
					    {% for tag in page.tags %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
					  		{% endfor %}
						{% else %}
					  	<a href="#">{{__('no_item')}}</a>
						{% endif %}
					</span>
 				</p>
 			</div>
 		</div>
 		<div class="post-markdown">
 			{% include 'includes/pachong.swig' %}
 			{{page.excerpt}}
 			{% if page.photos %}
 			<p>
 				<span class="span-img"><img class="img-mid" src="{{page.photos[0]}}" alt="图片来源网上" title="图片来源于网络"></span>
 			</p>
 			{% endif %}
 			{{page.more}}
 		</div>
 		<div class="pre-next clear">
 			{% if page.prev %}
 				<div class="pre-page">
 					<i class="pre-icon"></i>
 					<a href="{{url_for(page.prev.path)}}">{{page.prev.title}}</a>
 				</div>
 			{% endif %}
 			{% if page.next %}
 				<div class="next-page">
 					<a href="{{url_for(page.next.path)}}">{{page.next.title}}</a>
 					<i class="next-icon"></i>
 				</div>
 			{% endif %}
 		</div>
 		<div class="post-footer">
 			<a href="{{url_for(config.rss_dir)}}" class="post-feed" target="_black">Feed <i class="feed-icon"></i></a>
 			<h3>{{__('page_footer_header')}}</h3>
 			<ul>
 				<li>
 					<span>版权声明：</span><span>自由转载-非商用-保持署名</span><a href="https://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh">(创意共享3.0许可证)</a>
 				</li>
 				<li>
 					<span>发表日期：</span><span>{{date(page.date, 'YYYY-MM-DD HH:mm:ss')}}</span>
 				</li>
 				<li>
 					<span>本文{{ __('category_title') }}：</span><span>
	 					{% if page.categories.length %}
		    			{# 组织分类的链接列表 #}
					    {% set i = 0 %}
					    {% for cat in page.categories %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
					    {% endfor %}
						{% else %}
								<a href="#">{{__('no_item')}}</a>
					  {% endif %}
				  </span>
 				</li>
 				<li>
 					<span>本文{{ __('tag_title') }}：</span><span>
				    {# 组织标签的链接列表 #}
				    {% if page.tags.length %}
					    {% set i = 0 %}
					    {% for tag in page.tags %}
					      {% if i !== 0 %}
					        {{'/'}}
					      {% endif %}
					      {% set i = i + 1 %}
					      <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
					    {% endfor %}
						{% else %}
							<a href="#">{{__('no_item')}}</a>
						{% endif %}
					</span>
 				</li>
 				<li>
 					<span>最后编辑：</span><span>{{date(page.updated, 'YYYY-MM-DD HH:mm:ss')}}</span>
 				</li>
 				<li>
 					<span>{{__('contacts')}}：</span><span><a href="{{theme.github}}">GitHub<i class="github"></i></a><a href="{{theme.weibo}}">微博<i class="weibo"></i></a></span>
 				</li>
 				<li>
 					<span>{{__('share')}}：</span>
 					<span>
						<div class="ds-share" data-thread-key="{{page.path}}" data-title="{{page.title}}" data-images="" data-content="{{truncate(strip_html(page.content),{length : 120})}}" data-url="{{page.permalink}}">
						    <div class="ds-share-inline">
						      <ul  class="ds-share-icons-16">
						        <li><a class="ds-weibo" href="javascript:void(0);" data-service="weibo">微博</a></li>
						        <li><a class="ds-qzone" href="javascript:void(0);" data-service="qzone">QQ空间</a></li>
						        <li><a class="ds-wechat" href="javascript:void(0);" data-service="wechat">微信</a></li>
						      </ul>
						      <div class="ds-share-icons-more">
						      </div>
						    </div>
					 	</div>
 					</span>
 				</li>
 			</ul>
 		</div>
 		<div class="page-related">
 			<h2>{{ __('related_post') }}</h2>
 			<ul>
 				{% include 'includes/page-related.swig' %}
 			</ul>
 		</div>
 		{% if page.comments %}
{# 	 		<div class="duoshuo-part" id="comments">
				{% include 'includes/duoshuo.swig' %}
			</div> #}
			<div class="disqus-part" id="comments">
				{% include 'includes/disqus.swig' %}
			</div>
		{% endif %}
 		{% include 'includes/web-info.swig' %}
 	</div>
{% endblock %}
