FROM --platform=linux/amd64 kyledickersoncomposer/docker-lilypond:latest

WORKDIR /workdir

COPY . .

RUN mkdir -p bin && \
	lualatex -interaction=nonstopmode -shell-escape main.tex && \
	biber main && \
	makeglossaries main && \
	makeindex main.idx -s main.ist -o main.ind && \
	lualatex -interaction=nonstopmode -shell-escape main.tex && \
	lualatex -interaction=nonstopmode -shell-escape main.tex && \
	mv main.pdf bin/
