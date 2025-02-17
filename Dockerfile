FROM python:3.7.6-alpine3.11

RUN pip install detect-secrets==1.4.0
RUN apk --no-cache add git less openssh
RUN apk add jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
