//
//  HistoryDataModel.swift
//  Zeejee
//
//  Created by tecocraft on 02/11/17.
//  Copyright © 2017 tecocraft. All rights reserved.
//

import Foundation
//ID,DATE,MSGTYPE,NUMBER,PARAMJSON,TEMPLATEMESSAGE,TEMPLATENAME
class Event_Model {
    
    let tempID: Int64?
    var name: String
    var phoneno: String
    var email: String
    var availability: String
    var dt: String
    var eventId: String
    var notes: String
    
    init(id: Int64) {
        self.tempID = id
        name = ""
        phoneno = ""
        email = ""
        availability = ""
        dt = ""
        eventId = ""
        notes = ""
    }
    
    init(tempID: Int64, nameIs: String, phonenoIs: String, emailIs: String, availabilityIs: String, dtIs: String, eventIdIs: String, notesIs: String) {
        self.tempID = tempID
        self.name = nameIs
        self.phoneno = phonenoIs
        self.email = emailIs
        self.availability = availabilityIs
        self.dt = dtIs
        self.eventId = eventIdIs
        self.notes = notesIs
    }
}
