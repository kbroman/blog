all: build

build:
	R -e "blogdown::build_site()"

serve:
	R -e "blogdown::serve_site(port=4004)"

deploy: build
	cd public;git add .;git commit -m "Build site";git push origin gh-pages

# default post title
TITLE="title"
# to create a new post with a particular title:
# make new TITLE="blah blah blah"
new:
	R -e 'blogdown::new_post(title="\"$(TITLE)\"", author="Karl", ext=".Rmd")'
	emacs content/post/
