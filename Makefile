
.env:
	case "$$(uname -s)" in \
	  Linux*)   echo PYGAME_DISPLAY="$$DISPLAY" > $@;; \
	  Darwin*)  echo PYGAME_DISPLAY="host.docker.internal:0" > $@;; \
	  CYGWIN*)  echo PYGAME_DISPLAY="host.docker.internal:0" > $@;; \
	  MINGW*)   echo PYGAME_DISPLAY="host.docker.internal:0" > $@;; \
	  *)        echo "UNKNOWN uname output:$$(uname -s)";; \
	esac

build: .env
	docker-compose build

up: .env
	docker-compose up -d

exec: .env
	docker-compose exec app bash

down: .env
	docker-compose down
