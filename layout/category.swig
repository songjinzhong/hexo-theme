{% extends 'includes/layout.swig' %}

{% block body %}

{% if is_category() %}
	{% for cat in site.categories %}
        <li class="category-list-item">
        {% if cat.name === page.category %}
          <a class="active" href="{{url_for(cat.path)}}">{{cat.name}}</a>
        {% else %}
          <a href="{{url_for(cat.path)}}">{{cat.name}}</a>
        {% endif %}
          <span class="category-list-count">{{cat.posts}}</span>
        </li>
    {% endfor %}
{% endif %}

{% endblock %}