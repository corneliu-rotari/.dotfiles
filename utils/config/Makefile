DOCKER=sudo docker
.PHONY: build run clean

build:
	$(DOCKER) build -t test .
	$(DOCKER) run --name test -it test

run:
	$(DOCKER) run -it test

clean:
	$(DOCKER) container rm test && $(DOCKER) image rm test && $(DOCKER) builder prune --force
