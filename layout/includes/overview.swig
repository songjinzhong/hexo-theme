<a href="{{config.root}}{{config.rss_dir}}" class="web-feed" title="RSS订阅" target="_blank"></a>
<a href="{{ config.root }}">{{config.title}}</a>
<font>» </font>

{% if page.layout == 'blog' %}
<font>博客</font>

{% elseif page.layout == 'categories' %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">博客</a>
<font>» 文章分类</font>

{% elseif is_category() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">博客</a>
<font>» </font>
<a href="{{ config.root }}{{config.category_dir}}">文章分类</a>
<font>» {{page.category}}</font>
{% elseif is_archive() %}
<a href="{{ config.root }}{{ config.blog_home_dir }}">博客</a>
<font>» 文章分类</font>
{% endif %}