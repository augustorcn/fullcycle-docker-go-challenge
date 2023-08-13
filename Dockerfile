FROM golang:latest AS golang-build

WORKDIR /usr/app

COPY src/main.go /usr/app
RUN go build -o print-challenge-text main.go && \
    mv print-challenge-text /bin

FROM scratch

COPY --from=golang-build /bin/print-challenge-text bin/print-challenge-text
WORKDIR /bin
ENTRYPOINT [ "print-challenge-text" ]