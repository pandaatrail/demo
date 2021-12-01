# Example of rump running in a container
# build: docker build -t temp/rump -f Dockerfile.example .
# run: docker run --rm temp/rump

FROM golang:alpine

RUN apk add --no-cache git
RUN git clone https://github.com/stickermule/rump.git
WORKDIR ./rump
RUN ./bin/build.sh
RUN mv rump--linux-amd64 /usr/local/bin/rump

ENTRYPOINT ["tail", "-f", "/dev/null"]