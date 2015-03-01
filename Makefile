all: site

site:
	jekyll build

serve:
	jekyll serve --drafts

deploy:
	rsync -r _site/ mattwigway_indicatrix@ssh.phx.nearlyfreespeech.net:
