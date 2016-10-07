<!doctype html>
<html lang="{{ config.language }}">
{% include 'head.swig' %}
<body>
    {% block body %}{% endblock %}
    {% include 'back-to-top.swig' %}
	{% include 'footer.swig' %}
</body>
</html>
