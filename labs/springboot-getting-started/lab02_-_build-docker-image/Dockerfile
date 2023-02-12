#
# @see https://docs.docker.com/engine/reference/builder/ oficialni dockerfile reference documentation
#
FROM alpine:latest

# Install bash because it can be used in CMD/ENTRYPOINT instructions /which we will use in docker run phase/
# @see https://stackoverflow.com/questions/44803982/how-do-i-run-a-bash-script-in-an-alpine-docker-container/44804509#44804509
RUN apk add --no-cache --upgrade bash

CMD ["/bin/sh"]
