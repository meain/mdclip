import Cocoa
import Foundation
import Down

let pasteboard: NSPasteboard = .general

let htmlDataTypeName : String = "public.html"
let htmlDataType = NSPasteboard.PasteboardType(rawValue: htmlDataTypeName)
let textDataTypeName : String = "public.utf8-plain-text"
let textDataType = NSPasteboard.PasteboardType(rawValue: textDataTypeName)

var markdown : String = ""
while let line = readLine() {
    markdown += line
    markdown += "\n"
}

// Convert markdown to HTML
let down = Down(markdownString: markdown)
let html = try down.toHTML()

let htmlData = html.data(using: .utf8)!
let textData = markdown.data(using: .utf8)!

pasteboard.clearContents()
pasteboard.setData(htmlData,  forType: htmlDataType)
pasteboard.setData(textData, forType: textDataType)
exit(0)
