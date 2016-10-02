{% if page.layout == 'blog' %}
<a href="{{config.rss_dir}}" class="web-feed" title="RSS订阅" target="_blank"></a>
<a href="{{ config.root }}">渔人</a>
<font>» 博客</font>

{% elseif page.layout == 'categories' %}
<a href="{{ config.root }}{{config.rss_dir}}" class="web-feed" title="RSS订阅" target="_blank"></a>
<a href="{{ config.root }}">渔人</a>
<font>» </font>
<a href="{{ config.root }}{{ config.blog_home_dir }}">博客</a>
<font>» 文章分类</font>

{% endif %}