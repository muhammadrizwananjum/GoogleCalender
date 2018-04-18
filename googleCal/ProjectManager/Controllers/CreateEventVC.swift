//
//  CreateEventVC.swift
//  googleCal
//
//  Created by Tecocraft Tech on 28/03/18.
//  Copyright © 2018 kishan. All rights reserved.
//https://i.diawi.com/4QSrkD

import UIKit
import GoogleAPIClient
import ActionSheetPicker_3_0
import GoogleSignIn

class CreateEventVC: UIViewController,NVActivityIndicatorViewable {

    //#MARK:- IBOutlets
   
    
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var btncancel: UIButton!
    @IBOutlet weak var navview: UIView!
    @IBOutlet weak var lblgmail: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhoneno: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAvailability: UITextField!
    @IBOutlet weak var txtReminders: UITextField!
    @IBOutlet weak var txtNotes: UITextField!
    @IBOutlet weak var btnAvailability: UIButton!
    @IBOutlet weak var btnReminder: UIButton!
    
    //#MARK:- Declaration
     //private let service = GTLServiceCalendar()
     //private let scopes = [kGTLAuthScopeCalendar]
     var selectedIndexS = 0
     var reminderDt = Date()
    
    //#MARK:- Action
    @IBAction func btncancelClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSaveclick(_ sender: Any) {
        if txtName.text! == ""{
            self.view.makeToast("Please Enter Event Name", duration: 2.0, position: .bottom)
        }else if txtPhoneno.text! == ""{
            self.view.makeToast("Please Enter Phone No", duration: 2.0, position: .bottom)
        }else if btnAvailability.titleLabel?.text! == ""{
            self.view.makeToast("Please select Availability", duration: 2.0, position: .bottom)
        }else if btnReminder.titleLabel?.text! == ""{
            self.view.makeToast("Please select Date", duration: 2.0, position: .bottom)
        }else{
            createEvent(txtEmail.text!,
                        participantEmail: "kishan@tech.com",
                        startDate: reminderDt,
                        endDate: Date(timeInterval: 60*60*1, since: reminderDt),
                        summary: txtName.text!,
                        recurrenceRule: "RRULE:FREQ=DAILY;COUNT=1", availability: (btnAvailability.titleLabel?.text)!, phoneno: txtPhoneno.text!
            )
        }
    }
    
    @IBAction func btnAvailabilityClick(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "States", rows: ["Morning","Afternoon","Evening","Any Time"], initialSelection: selectedIndexS, doneBlock: {
            picker, indexes, values in
            
            self.selectedIndexS = indexes
            print("values = \(String(describing: values!))")
            self.btnAvailability.setTitle(String(describing: values!), for: .normal)
            //self.txtAvailability.text = String(describing: values!)
            print("indexes = \(indexes)")
            //print("picker = \(String(describing: picker!))")
            return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender as! UIButton)
    }
    @IBAction func btnReminderClick(_ sender: Any) {
        let datePicker = ActionSheetDatePicker(title: "Date:", datePickerMode: UIDatePickerMode.dateAndTime, selectedDate: Date(), doneBlock: {
            picker, value, index in
            self.reminderDt = value as! Date
            let dateFormatterGet = DateFormatter()
            //dateFormatterGet.dateFormat = "yyyy-MM-dd hh:mm:ss +zzzz"
            //let date = dateFormatterGet.date(from: "\(value!)") as! Date
            let suffix = daySuffix(from: self.reminderDt)
            print(suffix)
            dateFormatterGet.dateFormat = "MMMM d"
            let str = dateFormatterGet.string(from: value as! Date)
            dateFormatterGet.dateFormat = "ha"
            let str2 = dateFormatterGet.string(from: value as! Date)
            print("\(str)\(suffix) | \(str2)")
            
            //self.txtReminders.text = "\(str)\(suffix) | \(str2)"
            self.btnReminder.setTitle("\(str)\(suffix) | \(str2)", for: .normal)
            //print("value = \(value)")
            //print("index = \(index)")
            //print("picker = \(picker)")
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender as! UIButton)
        datePicker?.show()
    }
    
    //#MARK:- ClassFunction
    override func viewDidLoad() {
        super.viewDidLoad()

        btnsave.layer.cornerRadius = 8
        btnsave.clipsToBounds = true
        btncancel.layer.cornerRadius = 8
        btncancel.clipsToBounds = true
        
        lblgmail.text = userEmail
        
        // Configure Google Sign-in.
//        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().scopes = scopes
//        GIDSignIn.sharedInstance().signInSilently()
        
        AppUtilities.paddingTextField(textField: txtAvailability, size: 8)
        AppUtilities.paddingTextField(textField: txtReminders, size: 8)
        AppUtilities.paddingTextField(textField: txtPhoneno, size: 8)
        AppUtilities.paddingTextField(textField: txtName, size: 8)
        AppUtilities.paddingTextField(textField: txtNotes, size: 8)
        AppUtilities.paddingTextField(textField: txtEmail, size: 8)
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        navview.dropShadow()
        btncancel.addShadow(shadowRadius:8)
        btnsave.addShadow(shadowRadius:8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Create an event
    // If the user create an event in app, create the event in Google Calendar First, then pull from Google Calendar, and then save to the app
    func createEvent(_ userEmail: String, participantEmail: String, startDate: Date, endDate: Date, summary: String, recurrenceRule: String, availability: String, phoneno: String) {
        let event = GTLCalendarEvent()
        
        event.start = GTLCalendarEventDateTime()
        event.start.dateTime = GTLDateTime(date: startDate, timeZone: TimeZone.autoupdatingCurrent)
        event.start.timeZone = TimeZone.autoupdatingCurrent.identifier
        event.end = GTLCalendarEventDateTime()
        event.end.dateTime = GTLDateTime(date: endDate, timeZone: TimeZone.autoupdatingCurrent)
        event.end.timeZone = TimeZone.autoupdatingCurrent.identifier
        event.summary = summary
        //event.recurrence = [recurrenceRule]
        if userEmail == ""{
            if txtNotes.text == ""{
                event.descriptionProperty = "\(summary) \n \(phoneno) \n \(availability)  \n \(txtReminders.text!)"
            }else{
                event.descriptionProperty = "\(summary) \n \(phoneno) \n \(availability) \n \(txtNotes.text!) \n \(txtReminders.text!)"
            }
        }else{
            if txtNotes.text == ""{
                event.descriptionProperty = "\(summary) \n \(phoneno) \n \(userEmail) \n \(availability)  \n \(txtReminders.text!)"
            }else{
               event.descriptionProperty = "\(summary) \n \(phoneno) \n \(userEmail) \n \(availability) \n \(txtNotes.text!) \n \(txtReminders.text!)"
            }
        }
        
        
        //let attendee1 = GTLCalendarEventAttendee()
        //let attendee2 = GTLCalendarEventAttendee()
        //attendee1.email = userEmail
        //attendee2.email = ""
        //event.attendees = [attendee1]
        
        let query = GTLQueryCalendar.queryForEventsInsert(withObject: event, calendarId: "primary")
        
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(self.displayResultSingle(_:finishedWithObject:error:))
        )
    }
    
    @objc func displayResultSingle(
        _ ticket: GTLServiceTicket,
        finishedWithObject event : GTLCalendarEvent,
        error : NSError?) {
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        var eventString = ""
        
        let start : GTLDateTime! = event.start.dateTime ?? event.start.date
        let startString = DateFormatter.localizedString(
            from: start.date,
            dateStyle: .short,
            timeStyle: .short
        )
        
        let end : GTLDateTime! = event.end.dateTime ?? event.end.date
        let endString = DateFormatter.localizedString(
            from: end.date,
            dateStyle: .short,
            timeStyle: .short
        )
        
        print(event)
        print("ID: " + event.identifier)
        print("Start: " + startString)
        print("End: " + endString)
        if let recurringEventId = event.recurringEventId {
            print("Recurring Event Id: \(recurringEventId)")//use this id to aggregate events from the same recurring event
        }
        
        if let description = event.summary {
            print("Description: \(description)")
        }
        
        if let location = event.location {
            print("Location: \(location)")
        }
        print("\n")
        eventString += "\(startString) - \(event.summary)\n"
        
        
        let suffix = daySuffix(from: self.reminderDt)
        print(suffix)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMMM d"
        let str = dateFormatterGet.string(from: self.reminderDt)
        dateFormatterGet.dateFormat = "ha"
        let str2 = dateFormatterGet.string(from: self.reminderDt)
        dateFormatterGet.dateFormat = "yyyy"
        let str3 = dateFormatterGet.string(from: self.reminderDt)
        let dt_str = "\(str)\(suffix) \(str3), \(str2)(notification)"
        
        let id = DBManager.instance.addEvent(nameIs: txtName.text!, phonenoIs: txtPhoneno.text!, emailIs: txtEmail.text!, availabilityIs: (btnAvailability.titleLabel?.text!)!, dtIs: dt_str, eventIdIs: event.identifier, notesIs: txtNotes.text!)
        print(id)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//        if let error = error {
//            showAlert(title: "Authentication Error", message: error.localizedDescription)
//            self.service.authorizer = nil
//        } else {
//            self.service.authorizer = user.authentication.fetcherAuthorizer()
//        }
//    }
    
    
}
