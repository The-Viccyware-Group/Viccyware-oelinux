#!/bin/bash
echo "Pulling Viccyware changes"
git pull --recurse-submodules
cd anki/victor
git checkout Viccyware-tester
./update-viccyware.sh
cd ../wired
git checkout main
git pull
cd ../../
