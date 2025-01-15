import Cocoa
import Foundation

let pasteboard: NSPasteboard = .general

let htmlDataTypeName : String = "public.html"
let htmlDataType = NSPasteboard.PasteboardType(rawValue: htmlDataTypeName)
let textDataTypeName : String = "public.utf8-plain-text"
let textDataType = NSPasteboard.PasteboardType(rawValue: textDataTypeName)

var text : String = ""
while let line = readLine() {
    text += line
    text += "\n"
}
let htmlData = text.data(using: .utf8)!
let textData = text.data(using: .utf8)!

pasteboard.clearContents()
pasteboard.setData(htmlData,  forType: htmlDataType)
pasteboard.setData(textData, forType: textDataType)
exit(0)
