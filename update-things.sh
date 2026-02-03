#!/bin/bash

cd anki/victor
git pull origin Viccyware-tester
cd EXTERNALS
git pull origin viccyware
cd ../../vic-cloudless
git pull origin main
cd ../wired
git pull origin main
cd ../../external/purplpkg
git pull origin main
