.PHONY=publish build clean

PDF_FILES=Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf \
	CourantTheorem.pdf Poisson.pdf Prolongation.pdf Legendre.pdf Jacobi.pdf \
	LieAlgebraVariationSymmetries1.pdf \
	LieAlgebraVariationSymmetries1Comments.pdf \
	LieAlgebraVariationSymmetries2.pdf \
	LieAlgebraVariationSymmetries3.pdf \
	ChaosAndDevastation.pdf \
	HappySummer.pdf

TO_PUBLISH=index.xhtml $(PDF_FILES) logo-skull.svg logo-biohazard.svg Legendre.png

build: $(PDF_FILES)

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
