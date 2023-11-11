.PHONY: init_docker
init_docker:
	./init.sh

.PHONY: build-ros
build-ros: 
	docker build -f Dockerfiles/noetic_tools.Dockerfile -t noetic_tools:0.01 Dockerfiles/

.PHONY: build-sasa
build-sasa: 
	docker build -f Dockerfiles/Sasa_build.Dockerfile -t sasa:0.01 Dockerfiles/

.PHONY: build-all
build-all:
	build-ros
	build-sasa

.PHONY: black
black:
	black my_pkg

.PHONY: flake8
flake8:
	flake8 --version
	flake8 my_pkg

.PHONY: format-codestyle
format-codestyle: black flake8
