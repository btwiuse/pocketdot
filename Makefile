all:
	flutter build linux

apk:
	flutter build apk --split-per-abi --target-platform android-arm64

codegen:
	flutter_rust_bridge_codegen -r smoldot-flutter/src/api.rs -d lib/bridge_generated.dart

init:
	cargo install cargo-expand
	cargo install flutter_rust_bridge_codegen