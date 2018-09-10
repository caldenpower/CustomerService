//
//  Message.swift
//  CustomerService
//
//  Created by Alden Harwood on 9/9/18.
//  Copyright © 2018 Alden Harwood. All rights reserved.
//

import Foundation
import Firebase

class Message {
    private var id:String
    private var message:String
    private var sender:String
    
    /* Initializers */
    
    init(messageJSON: [String:AnyObject], id:String) {
        self.id = id
        self.message = messageJSON[MessageField.Message.rawValue] as! String
        self.sender = messageJSON[MessageField.Sender.rawValue] as! String
    }
    
    // Should this actually store in Firebase to get Id etc. and so don't move on until do?
    init(message:String, sender:String) {
        self.message = message
        self.sender = sender
    }
}
