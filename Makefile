all: site deploy

site:
	jekyll

fast:
	jekyll --no-lsi

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
