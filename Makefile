all: site deploy

site:
	jekyll build

serve:
	jekyll serve

fast:
	jekyll build

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
