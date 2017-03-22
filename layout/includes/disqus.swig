{% set key = page.path %}
{% if is_post() %}
    {% set key = ds_key(page.path) %}
{% endif %}
{% set title = page.title %}
{% set url = config.url + config.root + page.path %}
<div id="disqus_thread">
    <p>Disqus 被墙了，请翻墙查看评论！</p>
</div>
<script>
var disqus_config = function () {
    this.page.url = "{{ url }}";  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = "{{ key }}"; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://yurenspace.disqus.com/embed.js';
s.async = true;
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>