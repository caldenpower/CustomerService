//
//  Question.swift
//  CustomerService
//
//  Created by Alden Harwood on 9/9/18.
//  Copyright © 2018 Alden Harwood. All rights reserved.
//

import Foundation

class Question {
    private var id:String
    private var question:String
    private var requester:String
    private var responder:String?
    private var correspondenceId:String?
    private var categories:[String]?
    
    init(questionJSON: [String:AnyObject], id:String) {
        self.id = id
        self.question = questionJSON[QuestionField.Question.rawValue] as! String
        self.requester = questionJSON[QuestionField.Requester.rawValue] as! String
        self.responder = questionJSON[QuestionField.Responder.rawValue] as? String
        self.correspondenceId = questionJSON[QuestionField.CorrespondenceId.rawValue] as? String
        self.categories = questionJSON[QuestionField.Categories.rawValue] as! [String] // Does this work?
    }
    
    // Should this actually store in Firebase to get Id etc. and so don't move on until do?
    init(requester:String, question:String, categories:[String] = []) { // How deal with categories? Make Enum? Make another firebase dataset?
        self.requester = requester
        self.question = question
        self.categories = categories
    }
}
