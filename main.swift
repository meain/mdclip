#!/usr/bin/env swift

// https://gist.github.com/vi/ae5d1fe32ebcff0b618f931aee9a6067

import Cocoa
import Foundation

let pasteboard: NSPasteboard = .general

let dataTypeName : String = "public.html"
let dataType = NSPasteboard.PasteboardType(rawValue: dataTypeName)
var text : String = ""
while let line = readLine() {
    text += line
    text += "\n"
}
let data = text.data(using: .utf8)!
pasteboard.clearContents()
pasteboard.setData(data,  forType: dataType)
exit(0)

