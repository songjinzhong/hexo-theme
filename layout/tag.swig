{% extends 'includes/layout.swig' %}

{% block body %}

{% if is_tag() %}
	{{page.tag}}
{% endif %}

{% endblock %}
