//: Playground - noun: a place where people can play

import UIKit

let json = """
{ \"termsDiffInfo\": [ { \"key\": \"location-service\", \"title\": \"위치기반 서비스 이용약관\", \"previousVer\": \"v2\", \"currentVer\": \"v3\", \"miniTitle\": \"제 3 조. 서비스 내용 및 요금\", \"changedContent\": \"1. 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.\\n① 아동을 위한 스마트 워치폰을 통해 법정대리인(부모 등), 보호자가 아동의 위치를 주기적으로 확인하거나 특정지역 등의 출발•도착 및 이탈여부를 확인할 수 있는 서비스\\n② 보호자의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n③ 워치친구의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n④ 법정대리인이 수락한 경우, 워치친구 간 위치정보를 양측 법정대리인에게 제공\" }, { \"key\": \"location-service\", \"title\": \"위치기반 서비스 이용약관\", \"previousVer\": \"v2\", \"currentVer\": \"v3\", \"miniTitle\": \"제 3 조. 서비스 내용 및 요금\", \"changedContent\": \"1. 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.\\n① 아동을 위한 스마트 워치폰을 통해 법정대리인(부모 등), 보호자가 아동의 위치를 주기적으로 확인하거나 특정지역 등의 출발•도착 및 이탈여부를 확인할 수 있는 서비스\\n② 보호자의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n③ 워치친구의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n④ 법정대리인이 수락한 경우, 워치친구 간 위치정보를 양측 법정대리인에게 제공\" }, { \"key\": \"location-service\", \"title\": \"위치기반 서비스 이용약관\", \"previousVer\": \"v1\", \"currentVer\": \"v2\", \"miniTitle\": \"제 3 조. 서비스 내용 및 요금\", \"changedContent\": \"1. 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.\\n① 아동을 위한 스마트 워치폰을 통해 법정대리인(부모 등), 보호자가 아동의 위치를 주기적으로 확인하거나 특정지역 등의 출발•도착 및 이탈여부를 확인할 수 있는 서비스\\n② 보호자의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n③ 워치친구의 위치정보를 스마트 워치폰에 제공하여 근거리 알림 제공\\n④ 법정대리인이 수락한 경우, 워치친구 간 위치정보를 양측 법정대리인에게 제공\" } ] }
"""

struct InfoItem: Decodable {
    var key: String
    var title: String
    var previousVer: String
    var currentVer: String
    var miniTitle: String
    var changedContent: String
    
    var compareKey: String {
        return "\(key)_\(currentVer)"
    }
}

struct DiffInfoModel: Decodable {
    var termsDiffInfo: [InfoItem]
}

struct NewInfoSubItem {
    var miniTitle: String = ""
    var changedContent: String = ""
    
    init(miniTitle: String, changedContent: String) {
        self.miniTitle = miniTitle
        self.changedContent = changedContent
    }
}

struct NewInfoItem {
    var key: String = ""
    var title: String = ""
    var previousVer: String = ""
    var currentVer: String = ""
    var subItem: [NewInfoSubItem] = []
    
    var compareKey: String {
        return "\(key)_\(currentVer)"
    }
    
    init(infoItem: InfoItem) {
        self.key = infoItem.key
        self.title = infoItem.title
        self.previousVer = infoItem.previousVer
        self.currentVer = infoItem.currentVer
        
        self.subItem.append(NewInfoSubItem(miniTitle: infoItem.miniTitle, changedContent: infoItem.changedContent))
    }
}

var originItems: [InfoItem]?

do {
    if let data = json.data(using: .utf8) {
        let parsed = try JSONDecoder().decode(DiffInfoModel.self, from: data)
        
        originItems = parsed.termsDiffInfo
    }
} catch let error {
    print(error.localizedDescription)
}

var newItems: [NewInfoItem] = []

if let originItems = originItems {
    for item in originItems {
        let filtered = newItems.enumerated().filter { $0.element.compareKey == item.compareKey }
        
        if let found = filtered.first {
            var element = found.element
            var subItem = element.subItem
            subItem.append(NewInfoSubItem(miniTitle: item.miniTitle, changedContent: item.changedContent))
            element.subItem = subItem
            
            newItems[found.offset] = element
        } else {
            newItems.append(NewInfoItem(infoItem: item))
        }
    }
}

dump(newItems)
