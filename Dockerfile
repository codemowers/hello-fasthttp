FROM golang:1.19-alpine

WORKDIR /usr/src/demoserver

COPY go.mod go.sum ./

RUN go mod download

COPY cmd/main.go ./cmd/main.go

RUN go build -o /usr/bin/server cmd/main.go

CMD ["/usr/bin/server"]