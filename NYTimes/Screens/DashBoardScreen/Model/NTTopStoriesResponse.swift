//
//  NTTopStoriesResponse.swift
//  NYTimes
//

import Foundation

class NTTopStoriesResponse: Mappable {
    var status: String?
    var results: [NTTopStory]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        status    <- map["status"]
        results   <- map["results"]
    }
}

class NTTopStory: Mappable {
    
    var section: String?
    var title: String?
    var abstract: String?
    var url: String?
    var itemType: String?
    var multiMedias: [NTMultiMedia]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        section    <- map["section"]
        title   <- map["title"]
        abstract   <- map["abstract"]
        url    <- map["url"]
        itemType   <- map["item_type"]
        multiMedias    <- map["multimedia"]
    }
}

class NTMultiMedia: Mappable {
    
    var url: String?
    var format: String?
    var height: NSNumber?
    var width: NSNumber?
    var type: String?
    var subType: String?
    var caption: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        url    <- map["url"]
        format   <- map["format"]
        height    <- map["height"]
        width   <- map["width"]
        type    <- map["type"]
        subType   <- map["subtype"]
        caption   <- map["caption"]
    }
}
