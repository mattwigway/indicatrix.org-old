all: site deploy

site:
	jekyll

fast:
	jekyll --no-lsi

deploy:
	rm -rf ../blog_site/*
	cp -ar _site/* ../blog_site