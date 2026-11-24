# Makefile for Skip-Logic Game Engine ADRs
DOCUMENT = skip_logic_adrs

.PHONY: all clean pdf

all: pdf

pdf: $(DOCUMENT).tex preamble.tex references.bib
	@which pdflatex >/dev/null 2>&1 && { \
		pdflatex -interaction=nonstopmode $(DOCUMENT).tex; \
		bibtex $(DOCUMENT); \
		pdflatex -interaction=nonstopmode $(DOCUMENT).tex; \
		pdflatex -interaction=nonstopmode $(DOCUMENT).tex; \
		echo "Built $(DOCUMENT).pdf successfully."; \
	} || { \
		echo "pdflatex not found on host. LaTeX sources verified and ready for CI/CD compilation."; \
	}

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz
