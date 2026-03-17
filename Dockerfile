FROM python:3.14.3-alpine3.23

RUN pip install detect-secrets==1.5.0
RUN apk --no-cache add git less openssh
RUN apk add jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
