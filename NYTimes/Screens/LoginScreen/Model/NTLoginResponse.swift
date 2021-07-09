//
//  NTLoginResponse.swift
//  NYTimes
//

import Foundation

class NTLoginResponse: NSObject {
    var status: String?
    var statusMessage: String?
    
    override init() {
        
    }
    
    convenience init(_ status: String, _ statusMessage: String) {
        self.init()
        
        self.status = status
        self.statusMessage = statusMessage
    }
}

