//
//  DBManager.swift
//  Zeejee
//
//  Created by tecocraft on 25/10/17.
//  Copyright © 2017 tecocraft. All rights reserved.
//

import SQLite

class DBManager {

    private let EventModel = Table("tbl_Event")
    private let id = Expression<Int64>("ID")
    private let name = Expression<String?>("Event_Name")
    private let phoneno = Expression<String?>("Event_phoneno")
    private let email = Expression<String?>("Event_email")
    private let availability = Expression<String?>("Event_availability")
    private let dt = Expression<String?>("Event_dt")
    private let eventId = Expression<String?>("Event_eventId")
    private let notes = Expression<String?>("Event_notes")
   
    private let androidMetadata = Table("android_metadata")
    private let locale = Expression<String>("locale")
    

    static let instance = DBManager()
    private var db: Connection?
    private var tempdb: Connection?
    var dbFilePath = String()
    

    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/CalData.db")
            dbFilePath = "\(path)/CalData.db"
            createTable()
           
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTable() {

        createEventModelTable()
    }
    
    
    func createEventModelTable(){
        do {
            try db!.run(EventModel.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(name, unique: false)
                table.column(phoneno, unique: false)
                table.column(email, unique: false)
                table.column(availability, unique: false)
                table.column(dt, unique: false)
                table.column(eventId, unique: true)
                table.column(notes, unique: false)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addEvent(nameIs: String,phonenoIs: String, emailIs: String, availabilityIs: String, dtIs: String, eventIdIs: String, notesIs: String) -> Int64? {
        do {
            let insert = EventModel.insert(name <- nameIs, phoneno <- phonenoIs,email <- emailIs,availability <- availabilityIs,dt <- dtIs,eventId <- eventIdIs,notes <- notesIs)
            let id = try db!.run(insert)
            return id
        } catch {
            print("Insert failed")
            return nil
        }
    }
    
    func delEvent(id:Int64){
        let alice = EventModel.filter(id == rowid)
        do { try db?.run(alice.delete())
            
        }catch{
            
        }
    }
    
    func getSearchEvent(chr:String) -> [Event_Model]{
        var eventmodelIs = [Event_Model]()
        do {
            let squery = "SELECT * FROM tbl_Event where Event_Name like '%\(chr)%' or Event_phoneno like '%\(chr)%' or Event_email like '%\(chr)%' or Event_availability like '%\(chr)%' or Event_dt like '%\(chr)%' or Event_notes like '%\(chr)%'"
            print(squery)
            for event in try db!.prepare(squery) {
                eventmodelIs.append(Event_Model(tempID: event[0] as! Int64, nameIs: event[1]! as! String, phonenoIs: event[2]! as! String, emailIs: event[3]! as! String, availabilityIs: event[4]! as! String, dtIs: event[5]! as! String, eventIdIs: event[6]! as! String, notesIs: event[7]! as! String))
            }
        } catch {
            print("Select failed")
        }
        
        return eventmodelIs
    }
    
    func getAllEvent() -> [Event_Model] {
        var eventmodelIs = [Event_Model]()
        do {
            for event in try db!.prepare(self.EventModel) {
                eventmodelIs.append(Event_Model(tempID: event[id], nameIs: event[name]!, phonenoIs: event[phoneno]!, emailIs: event[email]!, availabilityIs: event[availability]!, dtIs: event[dt]!, eventIdIs: event[eventId]!, notesIs: event[notes]!))
            }
        } catch {
            print("Select failed")
        }
        
        return eventmodelIs
    }
   
    func tableExists(tableName: String) -> Bool {
        do {
            let count:Int64 = try tempdb!.scalar(
                "SELECT EXISTS(SELECT name FROM sqlite_master WHERE name = ?)", tableName
                ) as! Int64
            if count>0{
                return true
            }
            else{
                return false
            }
        }catch {
            print(error)
            return false
        }
    }
    
    func findColumns(_ tableName:String, connect: Connection)-> [String] {
        
        var asAnArray:[String] = []
        do {
            let s = try connect.prepare("PRAGMA table_info(" + tableName + ")" )
            for row in s { asAnArray.append(row[1]! as! String) }
        }
        catch { print("some woe in findColumns for \(tableName) \(error)") }
        
        let asAString = asAnArray.joined(separator: ",")
        
        print(asAnArray)
        print(asAString)
        return asAnArray
    }
}
