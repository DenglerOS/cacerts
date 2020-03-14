ARG     BASE_IMG=$BASE_IMG
FROM    $BASE_IMG AS base

RUN     apk --update --no-cache upgrade



FROM    base as build

RUN	apk --update --no-cache add \
	ca-certificates



FROM	scratch

COPY 	--from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
