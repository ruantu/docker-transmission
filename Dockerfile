FROM alpine:edge

RUN set -x \
  && apk add --no-cache --virtual .deps \
      jo jq \
  && apk add --no-cache \
      transmission-cli \
      transmission-daemon \
      transmission-extra \
      transmission-remote \
  && mkdir -p \
      ${HOME}/downloads/watch \
      ${HOME}/downloads/complete \
      ${HOME}/downloads/incomplete \
      ${HOME}/.config/transmission-daemon \
  && jo \
      'rpc-port'=9091 \
      'rpc-enabled'=true \
      'peer-port'=9092 \
      'peer-port-random-on-start'=false \
      'lpd-enabled'=true \
      'watch-dir'="${HOME}/downloads/watch" \
      'watch-dir-enabled'=true \
      'download-dir'="${HOME}/downloads/complete" \
      'incomplete-dir'="${HOME}/downloads/incomplete" \
      'incomplete-dir-enabled'=true \
   | jq '.' > ${HOME}/.config/transmission-daemon/settings.json \
  && apk del --no-cache .deps \
  && echo done

CMD [ "transmission-daemon", "--foreground" ]
