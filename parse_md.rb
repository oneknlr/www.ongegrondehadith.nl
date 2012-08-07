#!/usr/bin/env ruby


require 'redcarpet'

orig = open('./index.html').read

content = Redcarpet::Markdown.new(Redcarpet::Render::XHTML).render open('./CONTENT.md').read

result = orig.gsub(/<!-- BEGIN CONTENT.*END CONTENT -->/m,
                   "<!-- BEGIN CONTENT-->\n\n#{content}\n\n<!--END CONTENT -->")

open('./index.html', 'w'){ |f| f.write result }
