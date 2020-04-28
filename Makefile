.PHONY=publish build clean

TO_PUBLISH=index.xhtml Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf CourantTheorem.pdf Poisson.pdf Prolongation.pdf logo-skull.svg logo-biohazard.svg

build: Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf CourantTheorem.pdf Poisson.pdf Prolongation.pdf

%.pdf: %.tex
	latexmk --lualatex $^

publish: build
	rsync -avz --progress -e 'ssh -p 22016' $(TO_PUBLISH) shvetz@mech.math.msu.su:~/public_html/coronavirus/

clean:
	latexmk -c

gh-pages: build
	-git clone https://github.com/urbic/COVID-19.git gh-pages
	cd gh-pages && git rm *
	cp $(TO_PUBLISH) gh-pages
	cd gh-pages && git add -A && git ci -m Update && git push origin gh-pages
