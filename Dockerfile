FROM python:3.9.22-alpine3.22

RUN mkdir /root/app

ENV TZ=Asia/Shanghai
ENV ARGS=

RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo "$TZ" > /etc/timezone \

COPY * /root/app

RUN pip install -r /root/app/requirements.txt

ENTRYPOINT ["python3", "/root/app/teslamate_fix_addrs.py"]
