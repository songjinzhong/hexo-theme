{% set pageTitle = page.title || config.subtitle || '' %}
{% if is_archive() %}
  {% set pageTitle = _p('article_arc') %}
{% endif %}
{% if is_tag() %}
  {% set pageTitle = __('tag_title') + ': ' + page.tag %}
{% endif %}
{% if is_category() %}
  {% set pageTitle = __('category_title') + ': ' + page.category %}
{% endif %}
{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}
{% set pageTitle = pageTitle + ' | ' + config.title %}
<head>
  <title>{% block title %}{{ pageTitle }}{% endblock %}</title>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  {% if page.layout == 'about' %}
    <meta name="viewport" content="width=1024">
  {% else %}
    <meta name="viewport" content="width=device-width, initial-scale=1">
  {% endif %}
  <meta name="apple-mobile-web-app-capable" content="yes">
  {% if theme.author %}
  <meta name="author" content="{{theme.author}}">
  {% endif %}
  {% if theme.email %}
  <meta name="email" content="{{theme.email}}">
  {% endif %}
  {% if theme.keywords %}
  <meta name="keywords" lang="{{theme.kw_lang}}" content="{{theme.keywords}}">
  {% endif %}
  {% set metaDescription = trim(strip_html(page.description || page.excerpt || page.content || config.description)) %}
  {% if metaDescription.length > 200 %}
    <meta name="description" content="{{ truncate( metaDescription, {length: 200}) }}">
  {% else %}
    <meta name="description" content="{{ metaDescription }}">
  {% endif %}
  {% if config.feed || theme.feed %}
    {{ feed_tag(config.feed.path || theme.feed.path, {title: config.title, type: config.feed.type || theme.feed.type}) }}
  {% endif %}
  {% if config.favicon || theme.favicon%}
    {{ favicon_tag(config.favicon || theme.favicon) }}
  {% endif %}
  {% if theme.stylesheets !== undefined && theme.stylesheets.length > 0 %}
  {{ css(theme.stylesheets) }}
  {% endif %}
  <!-- 重定向 www.yuren.space -->
  <script type="text/javascript">
      if(window.location.href.search("http://www.yuren.space") != -1){
          window.location.replace(window.location.href.replace("www.yuren.space","yuren.space"));
      }
  </script>
</head>
