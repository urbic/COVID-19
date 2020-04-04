.PHONY=publish build

TO_PUBLISH=index.xhtml Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf logo-skull.svg logo-biohazard.svg

build: Routh.pdf EulerKernel.pdf Oscillations.pdf Hamilton.pdf IntrinsicForces.pdf Noether.pdf

*.pdf: *.tex
	latexmk --lualatex $^

publish: build
	rsync -avz --progress -e 'ssh -p 22016' $(TO_PUBLISH) shvetz@mech.math.msu.su:~/public_html/coronavirus/
