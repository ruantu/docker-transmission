FROM alpine:edge

ADD file /file/

RUN set -x \
  && apk add --no-cache --virtual .deps \
      jq \
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
  && cat /file/settings.json | jq '.' > ${HOME}/.config/transmission-daemon/settings.json \
  && cat /file/entrypoint.sh > /entrypoint.sh \
  && chmod +x /entrypoint.sh \
  && rm -rf /file \
  && apk del --no-cache .deps \
  && echo done

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "transmission-daemon", "--foreground" ]
