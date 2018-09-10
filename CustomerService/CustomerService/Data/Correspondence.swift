//
//  Correspondence.swift
//  CustomerService
//
//  Created by Alden Harwood on 9/9/18.
//  Copyright © 2018 Alden Harwood. All rights reserved.
//

import Foundation

class Correspondence {
    private var id:String
    private var messages:[Message]?
    private var requester:String
    private var responder:String
    
    init(correspondenceJSON: [String:AnyObject], id:String) {
        self.id = id
        self.messages = getMessages(messages:correspondenceJSON[CorrespondenceField.Messages.rawValue] as! [String:AnyObject])
        self.requester = correspondenceJSON[CorrespondenceField.Requester.rawValue] as! String
        self.responder = correspondenceJSON[CorrespondenceField.Responder.rawValue] as! String
    }
    
    // Should this actually store in Firebase to get Id etc. and so don't move on until do?
    init(requester:String, responder:String) {
        self.requester = requester
        self.responder = responder
        self.id = FirebaseDatabaseDAO.createCorrespondence(requester, responder)
    }
    
    func getMessages(messages:[String:AnyObject]) -> [Message] {
        var messageList:[Message] = []
        for (messageId, messageJSON) in messages {
            messageList.append(Message(messageJSON: messageJSON as! [String:AnyObject], id:messageId))
        }
        return messageList
    }
}
