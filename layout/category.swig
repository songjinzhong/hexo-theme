{% extends 'includes/layout.swig' %}

{% block body %}

{% if is_category() %}
    <div class="blog-content categories">
        <h1 class="overview">
          {% include 'includes/overview.swig' %}
        </h1>
        <div class="cate-content">
            {% include 'includes/archive_sort.swig' %}
        </div>
        <div class="duoshuo-part">
          {% include 'includes/duoshuo.swig' %}
        </div>
        {% include 'includes/web-info.swig' %}
    </div>
{% endif %}

{% endblock %}