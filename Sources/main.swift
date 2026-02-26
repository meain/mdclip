import Cocoa
import Foundation
import libcmark_gfm

func markdownToHTML(_ markdown: String) -> String {
    cmark_gfm_core_extensions_ensure_registered()

    let parser = cmark_parser_new(CMARK_OPT_DEFAULT)
    defer { cmark_parser_free(parser) }

    let extensions = ["table", "strikethrough", "autolink", "tagfilter"]
    for ext in extensions {
        if let syntaxExt = cmark_find_syntax_extension(ext) {
            cmark_parser_attach_syntax_extension(parser, syntaxExt)
        }
    }

    cmark_parser_feed(parser, markdown, markdown.utf8.count)
    let doc = cmark_parser_finish(parser)
    defer { cmark_node_free(doc) }

    let htmlCStr = cmark_render_html(doc, CMARK_OPT_DEFAULT, cmark_parser_get_syntax_extensions(parser))
    defer { free(htmlCStr) }
    return String(cString: htmlCStr!)
}

let pasteboard: NSPasteboard = .general

let htmlDataTypeName : String = "public.html"
let htmlDataType = NSPasteboard.PasteboardType(rawValue: htmlDataTypeName)
let textDataTypeName : String = "public.utf8-plain-text"
let textDataType = NSPasteboard.PasteboardType(rawValue: textDataTypeName)

let markdown = String(data: FileHandle.standardInput.readDataToEndOfFile(), encoding: .utf8) ?? ""

// Convert markdown to HTML
let html = markdownToHTML(markdown)

let htmlData = html.data(using: .utf8)!
let textData = markdown.data(using: .utf8)!

pasteboard.clearContents()
pasteboard.setData(htmlData,  forType: htmlDataType)
pasteboard.setData(textData, forType: textDataType)
exit(0)
