all: scene.png

overlay.pdf: overlay.tex
	pdflatex overlay.tex
	pdflatex overlay.tex

overlay.png: overlay.pdf
	mudraw -r 200 -c rgba -o overlay.png overlay.pdf

contour.pdf: contour.tex
	pdflatex contour.tex
	pdflatex contour.tex

contour.png: contour.pdf
	mudraw -r 200 -c rgba -b 8 -o contour.png contour.pdf

scene.png: scene.pov
	povray +W150 +H85 +d scene.pov

composited-low.png: overlay.png scene.png
	composite -gravity center overlay.png -geometry 600x340 scene.png composited-low.png

high.png: scene.pov
	povray +W600 +H340 +Q11 +A0.0 +AM1 +R5 +Ohigh.png scene.pov

composited-high.png: contour.png high.png
	composite -gravity center contour.png -geometry 600x340 high.png composited-high.png

complete.png: composited-high.png overlay.png
	composite -gravity center overlay.png -geometry 600x340 composited-high.png complete.png
