---
layout: page
title: idea
permalink: /idea/
---
{% include breadcrumb-cat.html %}

{% assign category = page.category | default: page.title %}
{% for post in site.categories[category] %}
<div>
<h4><a href="{{ site.baseurl }}{{ post.url }}" class="link-dark">{{ post.title }}</a></h4>
{%- assign date_format = site.date_format | default: "%y. %m. %d" -%}
📅 {{ post.date | date: date_format }}

{% for tag in post.tags %}
<a href="/tags/{{ tag }}/" class="badge rounded-pill text-bg-light">🏷️{{ tag }}</a>
{% endfor %}
</div><hr>

{% endfor %}