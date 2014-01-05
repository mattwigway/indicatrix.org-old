all: site deploy

site:
	jekyll build

fast:
	jekyll build --no-lsi

deploy:
	rm -rf ../blog_site/*
	cp -ar _site/* ../blog_site