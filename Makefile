all:
	flutter build linux

apk:
	flutter build apk --split-per-abi --target-platform android-arm64

codegen:
	flutter_rust_bridge_codegen -r smoldot-flutter/src/api.rs -d lib/bridge_generated.dart --llvm-path /usr/lib/llvm-14/lib/libclang.so.1

init:
	cargo install cargo-expand
	cargo install flutter_rust_bridge_codegen
