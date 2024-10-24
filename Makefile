ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# PHONY means that it doesn't correspond to a file; it always runs the build commands.

.PHONY: build-all
build-all: build-dynamic

.PHONY: run-all
run-all: run-dynamic

.PHONY: build-dynamic
build-dynamic:
	@cd lib/hello && cargo build --release
	@cp lib/hello/target/release/hello.dll lib/
	go build main_dynamic.go

.PHONY: run-dynamic
run-dynamic: build-dynamic
	@./main_dynamic

# This is just for running the Rust lib tests natively via cargo
.PHONY: test-rust-lib
test-rust-lib:
	@cd lib/hello && cargo test -- --nocapture

.PHONY: clean
clean:
	rm -rf main_dynamic lib/libhello.dll lib/hello/target

