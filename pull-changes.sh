#!/bin/bash
echo "Pulling changes across repo and submodules"
git pull --recurse-submodules
cd anki/victor
git checkout Viccyware-tester
./update-viccyware.sh
cd ../wired
git checkout main
git pull
cd ../../
