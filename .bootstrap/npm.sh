#!/usr/bin/env bash

if [ ! -d "${HOME}/.npm-packages" ] ; then
	sudo apt-get -qqy install python-software-properties python g++ make
	sudo add-apt-repository -y ppa:chris-lea/node.js
	sudo apt-get -qqy update
	sudo apt-get -qqy install nodejs

	echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ${HOME}/.bashrc
	echo 'PATH=${PATH}:${NPM_PACKAGES}/bin' >> ${HOME}/.bashrc
	echo 'NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"' >> ${HOME}/.bashrc
	echo 'prefix=${HOME}/.npm-packages' >> ${HOME}/.npmrc
	echo 'MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ${HOME}/.bashrc

	source ${HOME}/.bashrc

	npm install -g bower grunt-cli yo cordova generator-angularjs-cordova
	#workaround for missing deps when executing cordova build
	npm install -g shelljs q where
fi