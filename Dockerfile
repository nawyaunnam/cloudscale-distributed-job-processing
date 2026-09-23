FROM golang:1.23-alpine AS build
WORKDIR /src
COPY go.mod ./
RUN go mod download
COPY . .
ARG SERVICE=api
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /service ./cmd/${SERVICE}
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /service /service
ENTRYPOINT ["/service"]

