.PHONY: examples

CC = xelatex
RESUME_DIR = resume
SECURITY_RESUME_DIR = resume/security-content
SECURITY_RESUME_SRCS = $(shell find $(SECURITY_RESUME_DIR) -name '*.tex')
# CV_DIR = examples/cv
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex $(SECURITY_RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<

# cv.pdf: $(RESUME_DIR)/cv.tex $(CV_SRCS)
# 	$(CC) -output-directory=$(RESUME_DIR) $<

# coverletter.pdf: $(RESUME_DIR)/coverletter.tex
# 	$(CC) -output-directory=$(RESUME_DIR) $<

clean:
	rm -rf $(RESUME_DIR)/*.pdf
