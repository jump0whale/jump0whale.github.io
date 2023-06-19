---
layout: page
title: archive
permalink: /archive/
---
{% include breadcrumb-cat.html %}
<ul>
	{% for post in site.posts %}
	{% assign currentdate = post.date | date: "%Y" %}
	{% if currentdate != date %}
		{% unless forloop.first %}{% endunless %}
		<h2>{{ currentdate }}</h2>
		{% assign date = currentdate %}
	{% endif %}
		<li><a href="{{ post.url }}">{{ post.title }}</a></li>
	{% if forloop.last %}{% endif %}
	{% endfor %}
</ul>
