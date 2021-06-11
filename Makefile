.PHONY: resume

CC = xelatex
RESUME_DIR = resume
SECURITY_RESUME_DIR = resume/security-content
SECURITY_RESUME_SRCS = $(shell find $(SECURITY_RESUME_DIR) -name '*.tex')
# CV_DIR = examples/cv
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

resume: $(foreach x, security-resume, $x.pdf)

security-resume.pdf: $(RESUME_DIR)/security-resume.tex $(SECURITY_RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<

# cv.pdf: $(RESUME_DIR)/cv.tex $(CV_SRCS)
# 	$(CC) -output-directory=$(RESUME_DIR) $<

# coverletter.pdf: $(RESUME_DIR)/coverletter.tex
# 	$(CC) -output-directory=$(RESUME_DIR) $<

clean:
	rm -rf $(RESUME_DIR)/*.pdf
