//
//  DeleteEventVC.swift
//  googleCal
//
//  Created by Tecocraft Tech on 29/03/18.
//  Copyright © 2018 kishan. All rights reserved.
//

import UIKit
import GoogleAPIClient
import GoogleSignIn

class DeleteEventVC: UIViewController,NVActivityIndicatorViewable {

    //#MARK:- IBOutlets
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var navview: UIView!
    @IBOutlet weak var lblgmail: UILabel!
    @IBOutlet weak var btnback: UIButton!
    
    //#MARK:- Action
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func DelButtonTapped(_ button: UIButton) {
        startAnimating(sLoaderSize, message: sLoaderTitle,type: NVActivityIndicatorType(rawValue: sShowLoaderValue)!, color: sLoaderColor, textColor: sLoaderColor)
        deleteEvent(EventList[button.tag].eventId, tag: button.tag)
    }
    
    //#MARK:- Declaration
    var EventList = [Event_Model]()
    var boolArr = [Bool]()
//    private let service = GTLServiceCalendar()
//    private let scopes = [kGTLAuthScopeCalendar]
    
    //#MARK:- ClassFunction
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblgmail.text = userEmail
        
        btnback.layer.cornerRadius = 8
        btnback.clipsToBounds = true
        
        self.tblview.dataSource = self
        self.tblview.delegate = self
        self.tblview.register(UINib.init(nibName: "deleteEventCell", bundle: nil), forCellReuseIdentifier: "deleteEventCell")
        
        // Configure Google Sign-in.
//        GIDSignIn.sharedInstance().delegate = self
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().scopes = scopes
//        GIDSignIn.sharedInstance().signInSilently()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        navview.dropShadow()
        btnback.addShadow(shadowRadius : 8)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        EventList = DBManager.instance.getAllEvent()
        boolArr.removeAll()
        if EventList.count > 0{
            for i in 0...EventList.count - 1{
                boolArr.append(false)
            }
            self.tblview.reloadData()
        }
    }
    
    // Delete an event by id
    func deleteEvent(_ eventId: String, tag: Int) {
        let query = GTLQueryCalendar.queryForEventsDelete(withCalendarId: "primary", eventId: eventId)
        
        service.executeQuery(query!, completionHandler: { (ticket, event, error) -> Void in
            self.stopAnimating()
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }else{
                DBManager.instance.delEvent(id: self.EventList[tag].tempID!)
                self.EventList.remove(at: tag)
                self.tblview.reloadData()
            }
        })
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

extension DeleteEventVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cl : deleteEventCell = tableView.dequeueReusableCell(withIdentifier: "deleteEventCell", for: indexPath) as! deleteEventCell
        cl.lblName.text = EventList[indexPath.row].name
        cl.lblPhone.text = EventList[indexPath.row].phoneno
        cl.lblEmail.text = EventList[indexPath.row].email
        cl.lblReminder.text = EventList[indexPath.row].availability
        cl.lblDt.text = EventList[indexPath.row].dt
        cl.lblnotes.text = EventList[indexPath.row].notes
        
        cl.lblPhone.isHidden = !boolArr[indexPath.row]
        cl.lblEmail.isHidden = !boolArr[indexPath.row]
        cl.lblReminder.isHidden = !boolArr[indexPath.row]
        cl.lblDt.isHidden = !boolArr[indexPath.row]
        cl.lblnotes.isHidden = !boolArr[indexPath.row]
        
        if !boolArr[indexPath.row]{
            cl.lblplus.text = "+"
        }else{
            cl.lblplus.text = "-"
        }
        
        cl.btndele.tag = indexPath.row
        cl.btndele.addTarget(self, action: #selector(self.DelButtonTapped(_:)), for: .touchUpInside)
        
        return cl
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //let cell: SchedualCell = tableView.cellForRow(at: indexPath) as! SchedualCell
        if boolArr[indexPath.row] == true{
            return UITableViewAutomaticDimension
        }else {
            return 36.5
        }
        //return UITableViewAutomaticDimension  //72   //196
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        boolArr[indexPath.row] = !boolArr[indexPath.row]
        self.tblview.reloadRows(at: [IndexPath(item: indexPath.row, section: 0)] , with: .automatic )
    }
}

