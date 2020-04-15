import UIKit

//extension NSLocale {
//    @objc class func pg_currentLocale() -> NSLocale {
////        return NSLocale(localeIdentifier: "en_US")
//        return NSLocale(localeIdentifier: "ko-Kore_KR")
//    }
//}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

//if let original = class_getClassMethod(NSLocale.self, #selector(getter: NSLocale.current)),
//    let swizzled = class_getClassMethod(NSLocale.self, #selector(NSLocale.pg_currentLocale)) {
//    method_exchangeImplementations(original, swizzled)
//}

Locale.current.regionCode
Locale.current.currencyCode
Locale.current.languageCode
Locale.current.identifier

var str1 = "NTNoticeTitle".localized
var str2 = "NTNoticeTypeNotice".localized
var str3 = "NTNetworkErrorTitle".localized
