FILENAME = Arbeit

all: bericht

pdf: bericht clean

# note: latexmk will use the instructions in latexmkrc to create the glossary
bericht:
	latexmk -pdf $(FILENAME)

# if you do not have latexmk:
# LaTeX muss insgesamt 3 mal ausgeführt werden, 2 mal für biber + glossar
# und noch einmal für Labels.
bericht-nolatexmk:
	pdflatex -interaction=nonstopmode -shell-escape $(FILENAME).tex
	biber $(FILENAME)
	makeglossaries $(FILENAME)
	pdflatex -interaction=nonstopmode -shell-escape $(FILENAME).tex
	pdflatex -interaction=nonstopmode -shell-escape $(FILENAME).tex

clean:
	latexmk -c $(FILENAME)
	rm -f *~ *.bbl $(FILENAME).run.xml

Clean: clean
	latexmk -C $(FILENAME)
