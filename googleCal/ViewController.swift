//
//  ViewController.swift
//  googleCal
//
//  Created by Tecocraft Tech on 28/03/18.
//  Copyright © 2018 kishan. All rights reserved.
//

import UIKit
import GoogleAPIClient
import GoogleSignIn

var userEmail = String()
public let service = GTLServiceCalendar()
class ViewController: UIViewController , GIDSignInDelegate, GIDSignInUIDelegate,NVActivityIndicatorViewable {

    @IBOutlet weak var signInButton: GIDSignInButton!
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLAuthScopeCalendar]
    
    
    //let signInButton = GIDSignInButton()
    let output = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachabilities.isConnectedToNetwork() == true  {
             startAnimating(sLoaderSize, message: sLoaderTitle,type: NVActivityIndicatorType(rawValue: sShowLoaderValue)!, color: sLoaderColor, textColor: sLoaderColor)
        }else{
             self.view.makeToast("\(internet_connection_error)", duration: 2.0, position: .bottom)
        }
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        GIDSignIn.sharedInstance().signInSilently()

        
        // Add the sign-in button.
        //view.addSubview(signInButton)
        
        // Add a UITextView to display output.
        output.frame = view.bounds
        output.isEditable = false
        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        output.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        output.isHidden = true
        view.addSubview(output);
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
         self.stopAnimating()
        if let error = error {
            //showAlert(title: "Authentication Error", message: error.localizedDescription)
            service.authorizer = nil
        } else {
            self.signInButton.isHidden = false
            self.output.isHidden = true
            userEmail = user.profile.email
           service.authorizer = user.authentication.fetcherAuthorizer()
            self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "ViewEventsVC"))!, animated: true)
            //fetchEvents(, participantEmail: )
        }
    }
    
    // Fetch a list of upcoming 1:1 events from the user calendar
    func fetchEvents(_ userEmail: String, participantEmail: String) {
        let query = GTLQueryCalendar.queryForEventsList(withCalendarId: "primary")
        query?.maxResults = 20
        query?.timeMin = GTLDateTime(date: Date(), timeZone: TimeZone.autoupdatingCurrent)
        query?.singleEvents = true
        query?.q = "1:1 \(userEmail) \(participantEmail)"//append the current user's email and the colleague's email
        query?.orderBy = kGTLCalendarOrderByStartTime //comment this out as it doesn't work with singleEvents = false
        
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(ViewController.displayResultWithTicket(_:finishedWithObject:error:))
        )
    }
    
    // Get an event by id
    func getEvent(_ eventId: String) {
        let query = GTLQueryCalendar.queryForEventsGet(withCalendarId: "primary", eventId: eventId)
        
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(ViewController.displayResultSingle(_:finishedWithObject:error:))
        )
    }
    
    // Create an event
    // If the user create an event in app, create the event in Google Calendar First, then pull from Google Calendar, and then save to the app
    func createEvent(_ userEmail: String, participantEmail: String, startDate: Date, endDate: Date, summary: String, recurrenceRule: String) {
        let event = GTLCalendarEvent()
        
        event.start = GTLCalendarEventDateTime()
        event.start.dateTime = GTLDateTime(date: startDate, timeZone: TimeZone.autoupdatingCurrent)
        event.start.timeZone = TimeZone.autoupdatingCurrent.identifier
        event.end = GTLCalendarEventDateTime()
        event.end.dateTime = GTLDateTime(date: endDate, timeZone: TimeZone.autoupdatingCurrent)
        event.end.timeZone = TimeZone.autoupdatingCurrent.identifier
        event.summary = summary
        event.recurrence = [recurrenceRule]
        
        //let attendee1 = GTLCalendarEventAttendee()
        //let attendee2 = GTLCalendarEventAttendee()
        //attendee1.email = userEmail
        //attendee2.email = ""
        //event.attendees = [attendee1]
        
        let query = GTLQueryCalendar.queryForEventsInsert(withObject: event, calendarId: "primary")
        
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(ViewController.displayResultSingle(_:finishedWithObject:error:))
        )
    }
    
    // Update an event by id
    func updateEvent(_ eventId: String, summary: String) {
        let query = GTLQueryCalendar.queryForEventsGet(withCalendarId: "primary", eventId: eventId)
        service.executeQuery(query!, completionHandler: { (ticket, event, error) -> Void in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
            
            let event = event as! GTLCalendarEvent
            event.summary = summary
            
            let query = GTLQueryCalendar.queryForEventsUpdate(withObject: event, calendarId: "primary", eventId: eventId)
            service.executeQuery(
                query!,
                delegate: self,
                didFinish: #selector(ViewController.displayResultSingle(_:finishedWithObject:error:))
            )
        })
    }
    
    // Delete an event by id
    func deleteEvent(_ eventId: String) {
        let query = GTLQueryCalendar.queryForEventsDelete(withCalendarId: "primary", eventId: eventId)
        
        service.executeQuery(query!, completionHandler: { (ticket, event, error) -> Void in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        })
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
        output.text = eventString
    }
    
    // Display the start dates and event summaries in the UITextView
    @objc func displayResultWithTicket(
        _ ticket: GTLServiceTicket,
        finishedWithObject response : GTLCalendarEvents,
        error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        var eventString = ""
        
        if let events = response.items() , !events.isEmpty {
            for event in events as! [GTLCalendarEvent] {
                
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
                print(event.recurrence[0])
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
            }
        } else {
            eventString = "No upcoming events found."
        }
        
        output.text = eventString
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


}

