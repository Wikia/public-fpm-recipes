# fpm-recipes

This repo builds debs by running [fpm-cookery](https://github.com/bernd/fpm-cookery) on the Github Actions platform.
Debs can be downloaded [directly from github](https://github.com/frankfarmer/public-fpm-recipes/actions/workflows/bionic.yaml?query=is%3Acompleted) after every push

The build is located in [.github/workflows/bionic.yaml](./.github/workflows/bionic.yaml)

## Debugging

For debugging, it's possible to run the action locally using [nektos/act](https://github.com/nektos/act)
(the act project is new and actively developed as of 2020 and thus can be unstable in some edge cases)

The included makefile includes shortcuts for getting a shell into a failed local build container:

`make build || make debug-shell`


