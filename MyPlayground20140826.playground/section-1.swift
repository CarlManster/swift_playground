// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class APIManager <NSURLConnectionDataDelegate> {
    init() {
        
    }
    
    func doAPITest() {
        var url : NSURL = NSURL(string: "http://manster.nasol.net/index.html")
        var request : NSURLRequest = NSURLRequest(URL: url)
        
        NSURLConnection.connectionWithRequest(request, delegate: self)
    }
    
    func connection(connection: NSURLConnection!, response: NSURLResponse!) {
        var httpresponse : NSHTTPURLResponse = response as NSHTTPURLResponse
        
        println(NSString(format: "statusCode == %d, Header == %@", httpresponse.statusCode, httpresponse.allHeaderFields))
    }
    
    func connection(connection: NSURLConnection!, data: NSData!) {
        
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
    }
    
    func connection(connection: NSURLConnection!, bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int) {
        
    }
}
