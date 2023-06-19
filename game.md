---
layout: page
title: game
permalink: /game/
---
{% include breadcrumb-cat.html %}

<h1 class="cat-title">🕹️GAME</h1>

<ul class="cat-list">
  {% assign category = page.category | default: page.title %}

  {% for post in site.categories[category] %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
    <!-- <small>{{ post.date | date_to_string }}</small> -->
  {% endfor %}
</ul>