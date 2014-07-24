all: site deploy

site:
	jekyll build

fast:
	jekyll build --no-lsi

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
