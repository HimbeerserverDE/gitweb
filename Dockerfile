FROM caddy:2.7.4-builder-alpine AS builder
RUN xcaddy build v2.7.4 \
	--with github.com/aksdb/caddy-cgi/v2

FROM caddy:2.7.4-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN apk add cgit python3 py3-markdown py3-pygments
COPY cgitrc /etc/cgitrc
COPY favicon.ico /usr/share/webapps/cgit/himbeericon.ico
COPY himbeerlogo.png /usr/share/webapps/cgit/himbeerlogo.png
