# run "act" locally
build:
	bash -c "time act"

# get a shell in the container
debug-shell:
	docker exec -it act-build-bionic-debs-build bash || docker ps

# install "act" bin for local testing
get-act:
	# local actions broken https://github.com/nektos/act/issues/756
	go install github.com/nektos/act@v0.2.23
	sudo ln -s $(HOME)/go/bin/act /usr/local/bin/

# update the list of packages in the github actions yaml
update:
	sed -i .bak -e 's@pkg: \[.*\]@pkg: [$(shell script/listpkg $(CURDIR)/recipes)]@' "$(CURDIR)/.github/workflows/bionic.yaml"

local-docker:
	docker build docker/bionic/ -t deb-build
	docker run -it --rm -v $(CURDIR)/recipes:/app/recipes --name deb-build --entrypoint /bin/bash deb-build