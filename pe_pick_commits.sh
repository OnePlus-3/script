#!/bin/bash

mkdir pe&&cd pe

rm -rf .repo/manifests

repo init -u https://github.com/PixelExperience/manifest -b twelve-plus

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd system/bpf
	git fetch "https://github.com/LineageOS/android_system_bpf" refs/changes/91/320591/1 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/1 && git cherry-pick FETCH_HEAD
cd ../..
