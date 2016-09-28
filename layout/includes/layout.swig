<!doctype html>
<html lang="{{ config.language }}">
{% include 'head.swig' %}
<body>
  <div id="content-outer">
    <div id="content-inner">
      {# {% autoescape false %}{{ body }}{% endautoescape %} #}
      {% block body %}{% endblock %}
    </div>
  </div>
{% if page.comments && (theme.duoshuo_shortname || config.duoshuo_shortname) %}
  {% include 'duoshuo.swig' %}
{% endif %}
{% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
  {% include 'disqus.swig' %}
{% endif %}
{% if page.comments && (config.uyan_id || theme.uyan_id) %}
  {% include 'uyan.swig' %}
{% endif %}
{% include 'footer.swig' %}
