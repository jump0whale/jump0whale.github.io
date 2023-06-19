---
layout: page
title: comp
permalink: /comp/
---
{% include breadcrumb-cat.html %}

<h1 class="cat-title">💻COMP</h1>

<ul class="cat-list">
  {% assign category = page.category | default: page.title %}

  {% for post in site.categories[category] %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a><br>
    </li>
    <!-- <small>{{ post.date | date_to_string }}</small> -->
  {% endfor %}
</ul>