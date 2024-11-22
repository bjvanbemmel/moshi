FROM golang:1.22.8-alpine AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
RUN go build -o ./build

FROM scratch AS prod
WORKDIR /app
COPY --from=build /app/build ./app-prod
CMD [ "./app-prod" ]

FROM golang:1.22.8-alpine AS debug
WORKDIR /app
RUN apk add git
RUN go install github.com/air-verse/air@v1.52.3
COPY go.mod go.sum .air.toml ./
RUN go mod download
CMD [ "air", "-c", ".air.toml" ]
