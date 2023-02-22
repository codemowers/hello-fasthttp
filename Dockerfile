FROM golang:1.19 AS build
WORKDIR /usr/src/demoserver
COPY go.mod go.sum ./
RUN go mod download
COPY cmd/main.go ./cmd/main.go
RUN go build -ldflags "-linkmode 'external' -extldflags '-static'" -o /usr/bin/server cmd/main.go

FROM scratch
WORKDIR /
COPY --from=build /usr/bin/server /server
ENTRYPOINT ["/server"]
