{% extends 'includes/layout.swig' %}

{% block body %}
	site.categories.find({name: 'Diary'}).posts.sort('date', -1).limit(14)

{% endblock %}
