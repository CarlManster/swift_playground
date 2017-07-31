//: Playground - noun: a place where people can play

import UIKit

public func tLog(logStr:String?, fileName:String? = __FILE__, line:Int = __LINE__, methodName:String? = __FUNCTION__) {
    if let fileName = fileName, methodName = methodName, logString = logStr {
        print("[\(fileName):\(line) - \(methodName)] \(logString)")
    }
}

public extension NSObject {
    public class var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    
    public var nameOfClass: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
}

public extension String {
    var length: Int {
        get {
            return self.characters.count
        }
    }
    
    var notEmpty: Bool {
        get {
            return (self.length > 0)
        }
    }
}

class TMEventIDManager : NSObject
{
    static let EVENT_ID_CLOSED = "event_id_closed"
    static let EVENT_DATE_CLOSED = "event_date_closed"
    static let EVENT_BANNER_KEY_ID = "event_banner_id"
    static let EVENT_BANNER_KEY_URL = "event_banner_url"
    
    class func setBannerID(bannerID bid:String?, url:String?)
    {
        guard let bannerID = bid where bannerID.notEmpty, let urlString = url where urlString.notEmpty else {
            return;
        }
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        clearOldDBannerIDData(defaults)
        
        var newSavedEventIDArray : [[String:String]]
        
        if let savedEventIDArray = defaults.objectForKey(EVENT_ID_CLOSED) as? [[String:String]] {
            newSavedEventIDArray = Array(savedEventIDArray)
        } else {
            newSavedEventIDArray = Array()
        }
        
        let arrayFilterContains = filterArray(array:newSavedEventIDArray, bannerID:bannerID)
        
        if arrayFilterContains.count == 0 {
            if newSavedEventIDArray.count >= 5 {
                newSavedEventIDArray.removeAtIndex(0)
            }
            
            newSavedEventIDArray.append([ EVENT_BANNER_KEY_ID : bannerID, EVENT_BANNER_KEY_URL : urlString ])
            
            defaults.setObject(newSavedEventIDArray, forKey: EVENT_ID_CLOSED)
            defaults.setObject(NSDate(), forKey: EVENT_DATE_CLOSED)
        }
        
        defaults.synchronize()
    }
    
    class func isRequireOpenEventBanner(bannerID bid:String?) -> Bool {
        
        guard let bannerID = bid where bannerID.notEmpty else {
            return false;
        }
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if clearOldDBannerIDData(defaults) {
            return true
        }
        
        if let savedEventIDArray = defaults.objectForKey(EVENT_ID_CLOSED) as? [[String:String]] {
            let arrayFilterContains = filterArray(array: savedEventIDArray, bannerID: bannerID)
            
            if arrayFilterContains.count == 0 {
                return true
            }
        }
        
        return false;
    }
    
    class func clearOldDBannerIDData(defaults : NSUserDefaults) -> Bool {
        return false;
    }
    
    class func filterArray(array array:[[String:String]], bannerID:String?) -> [[String:String]] {
        if array.count > 0 {
            return array.filter() { $0[EVENT_BANNER_KEY_ID] == bannerID }
        }
        
        return Array()
    }
    
    class func test(comment : String?) {
        if let comment = comment {
            tLog("hello \(comment)")
        }
    }
}

TMEventIDManager.test("World")
