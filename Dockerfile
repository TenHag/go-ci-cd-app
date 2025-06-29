FROM golang:1.22.5 as base

WORKDIR /app



COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o main2.exe .

#Final stage 
FROM gcr.io/distroless/base


COPY --from=base /app/main2.exe /

COPY --from=base /app/static ./static
EXPOSE 8080

CMD [ "/main2.exe" ]












