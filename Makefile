all:
	flutter build linux

apk:
	flutter build apk --split-per-abi --target-platform android-arm64
