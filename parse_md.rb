#!/usr/bin/env ruby


require 'maruku'

orig = open('./index.html').read

content = Maruku.new(open('./CONTENT.md').read).to_html

result = orig.gsub(/<!-- BEGIN CONTENT.*END CONTENT -->/m,
                   "<!-- BEGIN CONTENT-->\n\n#{content}\n\n<!--END CONTENT -->")

open('./index.html', 'w'){ |f| f.write result }
