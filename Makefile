build:
	bash -c "time act"

debug-shell:
	docker exec -it act-build-bionic-debs-build bash || docker ps

get-act:
	# local actions broken https://github.com/nektos/act/issues/756
	go install github.com/nektos/act@v0.2.23
	sudo ln -s $(HOME)/go/bin/act /usr/local/bin/