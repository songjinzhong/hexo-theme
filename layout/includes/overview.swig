<a href="{{config.root}}{{config.rss_dir}}" class="web-feed" title="RSS订阅" target="_blank"></a>
<i class="search-icon"></i>
<a href="{{ config.root }}">{{config.title}}</a>
<font>» </font>

{% if page.layout == 'blog' %}
<font>{{ __('blog') }}</font>

{% elseif page.layout == 'categories' %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">{{ __('blog') }}</a>
<font>» {{__('article_cat')}}</font>

{% elseif is_category() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">{{ __('blog') }}</a>
<font>» </font>
<a href="{{ config.root }}{{config.category_dir}}">{{__('article_cat')}}</a>
<font>» {{page.category}}</font>

{% elseif is_archive() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">{{ __('blog') }}</a>
	{% if is_year() %}
		<font>» </font>
		<a href="{{config.root}}{{config.archive_dir}}">{{__('article_arc')}}</a>
		<font>» {{page.year}}</font>
	{% else %}
		<font>» {{__('article_arc')}}</font>
	{% endif %}
{% elseif is_tag() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">{{ __('blog') }}</a>
<font>» </font>
<font>{{ __('tag_title') }}</font>
<font>» </font>
<font>{{page.tag}}</font>

{% elseif is_post() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">{{ __('blog') }}</a>
<font>» </font>
<a href="{{config.root}}{{config.archive_dir}}">{{__('article_arc')}}</a>
{% endif %}
{% include 'search.swig' %}