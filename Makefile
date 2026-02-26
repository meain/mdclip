install: build-release
	cp .build/release/mdclip ~/.local/bin/mdclip

build-release:
	swift build -c release
