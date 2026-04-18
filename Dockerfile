# Same base as CI (.github/workflows/main.yml). amd64 for Apple Silicon pull + runner parity.
# Default local build is `make pdf-docker` (docker run this image directly — best layer cache).
# Use `make docker-book-image` only if you want a local tag from this file.
FROM --platform=linux/amd64 kyledickersoncomposer/docker-lilypond:latest

WORKDIR /workdir

CMD ["make", "pdf"]
