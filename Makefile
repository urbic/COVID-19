.PHONY=publish build clean

TO_PUBLISH=index.xhtml Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf logo-skull.svg logo-biohazard.svg

build: Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf

*.pdf: *.tex
	latexmk --lualatex $^

publish: build
	rsync -avz --progress -e 'ssh -p 00000' $(TO_PUBLISH) shvetz@mech.math.msu.su:~/public_html/coronavirus/

clean:
	latexmk -c

gh-pages: build
	-git clone https://github.com/urbic/COVID-19.git gh-pages
	cd gh-pages && git rm *
	cp $(TO_PUBLISH) gh-pages
	cd gh-pages && git add -A && git ci -m Update && git push origin gh-pages
