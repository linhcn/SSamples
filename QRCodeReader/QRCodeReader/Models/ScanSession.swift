//
//  ScanSession.swift
//  QRCodeReader
//
//  Created by Linh Chu on 30/8/17.
//  Copyright © 2017 Philology Pty. Ltd. All rights reserved.
//

import Foundation

struct ScanSession {
    var id: String
    var dateCreated: Date
    var lastModified: Date
    
    init() {
        let now = Date(timeIntervalSinceNow: 0)
        
        self.id = UUID().uuidString
        self.dateCreated = now
        self.lastModified = now
    }    
}