FROM python:3.9.22-alpine3.22

ENV TZ=Asia/Shanghai
ENV ARGS=

RUN mkdir /root/app

RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo "$TZ" > /etc/timezone \

COPY * /root/app

RUN pip install -r /root/app/requirements.txt

ENTRYPOINT ["python3", "/root/app/teslamate_fix_addrs.py"]
