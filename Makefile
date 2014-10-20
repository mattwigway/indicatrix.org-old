all: site deploy

site:
	jekyll

fast:
	jekyll

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
