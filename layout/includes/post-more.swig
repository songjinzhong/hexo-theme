

{% if site.posts.length > 0 %}
    <h1>{{ __('archive_title') }}
    {% if sort_posts.length %}
      <span class="posts-count">
      {{ __('total_title') }}
      {{ sort_posts.length }}
      {% if 1 === site.posts.length %}
        {{ __('post_title') }}
      {% else %}
        {{ __('posts_title') }}
      {% endif %}
      </span>
    {% else %}
        {{ __('not_post') }}
    {% endif %}
    </h1>
    {% set howMuch = {} %}
    {% for postItem in sort_posts %}
      {% set thisYear = date(postItem.date, 'YYYY') %}
      {% if !howMuch[thisYear] %}
        {% set howMuch[thisYear] = 0 %}
      {% endif %}
      {% set howMuch[thisYear] = howMuch[thisYear] + 1 %}
    {% endfor %}
    {% set lastYear %}
    {% for postItem in sort_posts.toArray() %}
      {% set thisYear = date(postItem.date, 'YYYY') %}
      {% if thisYear !== lastYear %}
        {% set lastYear = thisYear %}
        <h3 class="archive-year-title">{{ thisYear }}
        {% if howMuch[thisYear] %}
          <span class="posts-count">
          {{ __('total_title') }}
          {{ howMuch[thisYear] }}
          {% if 1 === howMuch[thisYear] %}
            {{ __('post_title') }}
          {% else %}
            {{ __('posts_title') }}
          {% endif %}
          </span>
        {% else %}
            {{ __('not_post') }}
        {% endif %}
        </h3>
      {% endif %}
        <div class="post-title-item">
          {% set postTitle = postItem.title || trim(strip_html(postItem.content))  %}
          <a href="{{ config.root }}{{ postItem.path }}">
          {% if postTitle.length < 80 %}
            {{ postTitle }}
          {% else %}
            {{ truncate( postTitle, {length: 80}) }}
          {% endif %}
          </a>
          <p class="page-title-sub">
            <span id = "post-title-date">{{ date(postItem.date, 'M-D') }}</span>
            {% if postItem.categories.length %}
            <span id = "post-title-categories">{{ __('category_title') }}
            {% set i = 0 %}
            {% for cat in postItem.categories %}
              {% if i !== 0 %}
                {{'/'}}
              {% endif %}
              {% set i = i + 1 %}
              <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
            {% endfor %}
            </span>
            {% endif %}
            {% if postItem.tags.length %}
            <span id = "post-title-tags">
            {{ __('tag_title') }}
            {% set i = 0 %}
            {% for tag in postItem.tags %}
              {% if i !== 0 %}
                {{'/'}}
              {% endif %}
              {% set i = i + 1 %}
              <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
            {% endfor %}
            </span>
            {% endif %}
          </p>
          
        </div>
    {% endfor %}
  </div>
{% endif %}