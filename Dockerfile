FROM qwedfrnhgef/eagler

WORKDIR /app

COPY . .

RUN chmod +x main.sh

EXPOSE 8080

CMD ["./main.sh"]
