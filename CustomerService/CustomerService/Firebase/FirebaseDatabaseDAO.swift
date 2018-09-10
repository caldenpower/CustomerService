//
//  FirebaseDatabaseDAO.swift
//  CustomerService
//
//  Created by Alden Harwood on 9/9/18.
//  Copyright © 2018 Alden Harwood. All rights reserved.
//

import Foundation
import Firebase

/*
 * Class for managing all interactions with FirebaseDatabase
 *
 * Created by Alden on 9/9/18
 */
class FirebaseDatabaseDAO {
    private let ref: DatabaseReference = Database.database().reference()
    
//    init() { // Way to somehow make static? How instantiate variables? Have instantiated one that can use anywhere?
//
//    }
    
    func createCorrespondence(requester:String, responder:String, completion: @escaping (String?) -> ()) {
        let correspondenceRef = ref.child(FirebaseDatabaseField.Correspondence.rawValue)
        
        let data: [String:Any] = [CorrespondenceField.Requester.rawValue: requester,
                                  CorrespondenceField.Responder.rawValue: responder
        ]
        correspondenceRef.childByAutoId().setValue(data) { (error, correspondenceRef) in
            if error != nil {
                completion(nil)
            } else {
                completion(correspondenceRef.key)
            }
        }
    }
}
