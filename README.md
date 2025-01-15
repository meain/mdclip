# mdclip - Copy Markdown as html to html clipboard

A command-line tool that converts Markdown to HTML and copies both formats to the clipboard.

## Features

- Reads Markdown from standard input
- Converts Markdown to HTML using [Down](https://github.com/johnxnguyen/Down)
- Copies both formats to the clipboard:
  - Plain text: Original Markdown content
  - HTML: Converted HTML version

## Installation

### Using Pre-built Binary

1. Download the latest release from the [Releases page](https://github.com/yourusername/mdclip/releases)
2. Extract the tar.gz file
3. Move the binary to your PATH:
   ```bash
   mv mdclip /usr/local/bin/
   ```

### Development (Build from Source)

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/mdclip.git
   cd mdclip
   ```

2. Build the project:
   ```bash
   swift build -c release
   ```

3. Install the binary:
   ```bash
   cp .build/release/mdclip /usr/local/bin/mdclip
   ```

## Usage

Pipe Markdown content to the program:

```bash
echo "This *could* be `completely` **pointless**." | mdclip
```

Or use with a file:

```bash
mdclip < document.md
```

The converted HTML and original Markdown will be available in your clipboard.

## Requirements

- macOS
- Xcode Command Line Tools
- Swift 5.10 or later
