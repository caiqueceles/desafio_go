FROM golang:1.16-alpine as builder

WORKDIR /go/scr/app

# COPY go.mod ./
# COPY go.sum ./
# RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -o /app main.go
# RUN go build -o /docker-gs-ping
FROM scratch

COPY --from=builder /app /app

CMD ["/app"]

# EXPOSE 8080

# CMD [ "/docker-gs-ping" ]