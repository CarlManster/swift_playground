//: Playground - noun: a place where people can play

import UIKit

var htmlstring = "<font color='white'>This is <font color='red'>simple</font> Text.</font>"

var htmlstringData : Data? = htmlstring.data(using: String.Encoding.utf8)

var options : [String : Any] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]

if let htmlstringData = htmlstringData {
    var attrString : NSAttributedString = try NSAttributedString(data: htmlstringData, options: options, documentAttributes: nil)
    
}
