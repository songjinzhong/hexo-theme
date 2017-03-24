{% set key = page.path %}
{% if is_post() %}
    {% set key = ds_key(page.path) %}
{% endif %}
{% set title = page.title %}
{% set url = config.url + config.root + page.path %}
<div id="disqus_thread">
    <p class="disqus-error">Disqus 被墙了，很遗憾，评论无法显示！</p>
</div>
<script>
var disqus_config = function () {
    this.page.url = "{{ url }}";
    this.page.identifier = "{{ key }}";
};
</script>