//
//  NTArticleResponse.swift
//  NYTimes
//
//  Created by Thahi on 09/07/2021.
//

import Foundation

class NTArticleResponse: Mappable {
    var status: String?
    var response: NTArticle?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        status    <- map["status"]
        response   <- map["response"]
    }
}

class NTArticle: Mappable {
    
    var artcleDocs: [NTArticleDocs]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        artcleDocs    <- map["docs"]
    }
}

class NTArticleDocs: Mappable {
    
    var abstract: String?
    var webURL: String?
    var snipet: String?
    var leadParagraph: String?
    var headLine: NTArticleHeadLine?
    var multimedia: [NTMultiMedia]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        abstract    <- map["abstract"]
        webURL   <- map["web_url"]
        snipet    <- map["snippet"]
        leadParagraph   <- map["lead_paragraph"]
        headLine    <- map["headline"]
        multimedia    <- map["multimedia"]
    }
}

class NTArticleHeadLine: Mappable {
    
    var main: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        main    <- map["main"]
    }
}
