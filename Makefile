TYPES  = hpc embedded fullstack mlai full
PDF    = pdf
LATEX  = /usr/bin/pdflatex -interaction=nonstopmode
SRCS   = resume.tex $(shell find cv -name "*.tex")
JUNK   = *.aux *.log *.out *.fls *.fdb_latexmk *.synctex.gz

.PHONY: all clean distclean $(TYPES)

all: $(TYPES)

$(PDF):
	mkdir -p $@

# hpc
hpc: $(PDF)/resume-hpc.pdf
$(PDF)/resume-hpc.pdf: $(SRCS) | $(PDF)
	$(LATEX) -output-directory=$(PDF) -jobname=resume-hpc '\def\cvtype{hpc}\input{resume}'

# embedded
embedded: $(PDF)/resume-embedded.pdf
$(PDF)/resume-embedded.pdf: $(SRCS) | $(PDF)
	$(LATEX) -output-directory=$(PDF) -jobname=resume-embedded '\def\cvtype{embedded}\input{resume}'

# fullstack (11pt font)
fullstack: $(PDF)/resume-fullstack.pdf
$(PDF)/resume-fullstack.pdf: $(SRCS) | $(PDF)
	$(LATEX) -output-directory=$(PDF) -jobname=resume-fullstack '\def\cvtype{fullstack}\def\cvfontsize{11pt}\input{resume}'

# mlai
mlai: $(PDF)/resume-mlai.pdf
$(PDF)/resume-mlai.pdf: $(SRCS) | $(PDF)
	$(LATEX) -output-directory=$(PDF) -jobname=resume-mlai '\def\cvtype{mlai}\input{resume}'

# full
full: $(PDF)/resume-full.pdf
$(PDF)/resume-full.pdf: $(SRCS) | $(PDF)
	$(LATEX) -output-directory=$(PDF) -jobname=resume-full '\def\cvtype{full}\input{resume}'

clean:
	rm -f $(PDF)/*.aux $(PDF)/*.log $(PDF)/*.out $(PDF)/*.fls $(PDF)/*.fdb_latexmk $(PDF)/*.synctex.gz

distclean: clean
	rm -rf $(PDF)
