FROM golang:1.23-alpine AS build
WORKDIR /src
COPY go.mod ./
COPY . .
RUN go mod tidy
ARG SERVICE=api
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /service ./cmd/${SERVICE}
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /service /service
ENTRYPOINT ["/service"]
