all: site deploy

site:
	jekyll build

serve:
	jekyll serve --drafts

fast:
	jekyll build

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
