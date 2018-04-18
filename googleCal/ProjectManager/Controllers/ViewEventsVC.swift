//
//  ViewEventsVC.swift
//  googleCal
//
//  Created by Tecocraft Tech on 28/03/18.
//  Copyright © 2018 kishan. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewEventsVC: UIViewController {

    //#MARK:- IBOutlets
    @IBOutlet weak var viewAddContact: UIView!
    @IBOutlet weak var viewDelContact: UIView!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var navview: UIView!
    @IBOutlet weak var lblgmail: UILabel!
    @IBOutlet weak var sview: UIView!
    
    //#MARK:- Action
    @IBAction func btnSignOutClick(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnAddClick(_ sender: Any) {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "CreateEventVC"))!, animated: true)
    }
    @IBAction func btnDelClick(_ sender: Any) {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "DeleteEventVC"))!, animated: true)
    }
    @IBAction func btnSearchClick(_ sender: Any) {
        self.sview.isHidden = false
        self.navview.isHidden = true
    }
    
    //#MARK:- Declaration
    var EventList = [Event_Model]()
    var boolArr = [Bool]()
    var searchBar1: SHSearchBar!
    var rasterSize: CGFloat = 4.0
    
    //#MARK:- ClassFunction
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddContact.layer.cornerRadius = 8
        viewAddContact.clipsToBounds = true
        viewDelContact.layer.cornerRadius = 8
        viewDelContact.clipsToBounds = true
        lblgmail.text = userEmail
        
        self.tblview.dataSource = self
        self.tblview.delegate = self
        self.tblview.register(UINib.init(nibName: "viewEventCell", bundle: nil), forCellReuseIdentifier: "viewEventCell")
        
        
        let searchGlassIconTemplate = UIImage(named: "icon-search")!.withRenderingMode(.alwaysTemplate)
        
        let rightView2 = imageViewWithIcon(searchGlassIconTemplate, rasterSize: rasterSize)
        searchBar1 = defaultSearchBar(withRasterSize: rasterSize, leftView: nil, rightView: rightView2, delegate: self)
        //searchBar1.text = NSLocalizedString("sbe.exampleText.simple", comment: "")
        sview.addSubview(searchBar1)
        
        
        let allSearchBars: [SHSearchBar] = [searchBar1]
        
        // Update the searchbar config
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) { [weak self] in
            let raster: CGFloat = 0.0
            self?.rasterSize = raster
            
            for bar in allSearchBars {
                var config = bar.config
                config.cancelButtonTextAttributes = [.foregroundColor : UIColor.red]
                config.rasterSize = raster
                bar.config = config
            }
            self?.setupLayoutConstraints()
        }
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        navview.dropShadow()
        viewDelContact.addShadow(shadowRadius : 8)
        viewAddContact.addShadow(shadowRadius : 8)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        EventList = DBManager.instance.getAllEvent()
        boolArr.removeAll()
        if EventList.count > 0{
            for i in 0...EventList.count - 1{
                boolArr.append(false)
            }
        }
        self.tblview.reloadData()
        self.sview.isHidden = true
        self.navview.isHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        EventList = DBManager.instance.getAllEvent()
        boolArr.removeAll()
        if EventList.count > 0{
            for i in 0...EventList.count - 1{
                boolArr.append(false)
            }
            
        }
        self.tblview.reloadData()
    }
    
    
    
    // MARK: - Helper Functions
    
    func setupLayoutConstraints() {
        let searchbarHeight: CGFloat = 44.0
        let rasterSize: CGFloat = 4.0
        
        let constraints = [searchBar1.topAnchor.constraint(equalTo: sview.layoutMarginsGuide.topAnchor, constant: rasterSize),
                           searchBar1.leadingAnchor.constraint(equalTo: sview.layoutMarginsGuide.leadingAnchor, constant: rasterSize),
                           searchBar1.trailingAnchor.constraint(equalTo: sview.layoutMarginsGuide.trailingAnchor, constant: -rasterSize),
                           searchBar1.heightAnchor.constraint(equalToConstant: searchbarHeight)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func defaultSearchBar(withRasterSize rasterSize: CGFloat, leftView: UIView?, rightView: UIView?, delegate: SHSearchBarDelegate, useCancelButton: Bool = true) -> SHSearchBar {
        var config = defaultSearchBarConfig(rasterSize)
        config.leftView = leftView
        config.rightView = rightView
        config.useCancelButton = useCancelButton
        
        if leftView != nil {
            config.leftViewMode = .always
        }
        
        if rightView != nil {
            config.rightViewMode = .unlessEditing
        }
        
        let bar = SHSearchBar(config: config)
        bar.delegate = delegate
        //bar.placeholder = NSLocalizedString("sbe.textfieldPlaceholder.default", comment: "")
        bar.updateBackgroundImage(withRadius: 6, corners: [.allCorners], color: UIColor.white)
        bar.layer.shadowColor = UIColor.black.cgColor
        bar.layer.shadowOffset = CGSize(width: 0, height: 3)
        bar.layer.shadowRadius = 5
        bar.layer.shadowOpacity = 0.25
        return bar
    }
    
    func defaultSearchBarConfig(_ rasterSize: CGFloat) -> SHSearchBarConfig {
        var config: SHSearchBarConfig = SHSearchBarConfig()
        config.rasterSize = rasterSize
        //    config.cancelButtonTitle = NSLocalizedString("sbe.general.cancel", comment: "")
        config.cancelButtonTextAttributes = [.foregroundColor : UIColor.darkGray]
        config.textContentType = UITextContentType.fullStreetAddress.rawValue
        config.textAttributes = [.foregroundColor : UIColor.gray]
        return config
    }
    
    func imageViewWithIcon(_ icon: UIImage, rasterSize: CGFloat) -> UIImageView {
        let imgView = UIImageView(image: icon)
        imgView.frame = CGRect(x: 0, y: 0, width: icon.size.width + rasterSize * 2.0, height: icon.size.height)
        imgView.contentMode = .center
        imgView.tintColor = UIColor(red: 0.75, green: 0, blue: 0, alpha: 1)
        return imgView
    }
    
    
}

extension ViewEventsVC : SHSearchBarDelegate{
    func searchBar(_ searchBar: SHSearchBar, textDidChange text: String) {
        EventList = DBManager.instance.getSearchEvent(chr: text)
        boolArr.removeAll()
        if EventList.count > 0{
            for i in 0...EventList.count - 1{
                boolArr.append(false)
            }
            
        }
        self.tblview.reloadData()
        
    }
    func searchBarShouldCancel(_ searchBar: SHSearchBar) -> Bool {
        searchBar.textField.text = ""
        EventList = DBManager.instance.getAllEvent()
        boolArr.removeAll()
        if EventList.count > 0{
            for i in 0...EventList.count - 1{
                boolArr.append(false)
            }
            
        }
        self.tblview.reloadData()
        self.sview.isHidden = true
        self.navview.isHidden = false
        return true
    }
}
extension ViewEventsVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cl : viewEventCell = tableView.dequeueReusableCell(withIdentifier: "viewEventCell", for: indexPath) as! viewEventCell
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
