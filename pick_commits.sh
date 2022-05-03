#!/bin/bash

mkdir los&&cd los

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-19.1

repo sync --force-sync

cd art
	git fetch "https://github.com/LineageOS/android_art" refs/changes/97/318097/1 && git cherry-pick FETCH_HEAD
cd ..

cd packages/modules/adb/
	git fetch "https://github.com/LineageOS/android_packages_modules_adb" refs/changes/85/326385/1 && git cherry-pick FETCH_HEAD
cd ../../..

cd packages/modules/NetworkStack
	git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
	git fetch "https://github.com/LineageOS/android_system_bpf" refs/changes/91/320591/1 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/1 && git cherry-pick FETCH_HEAD
cd ../..
