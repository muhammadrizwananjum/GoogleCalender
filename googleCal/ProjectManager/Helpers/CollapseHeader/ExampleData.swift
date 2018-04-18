//
//  ExampleData.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 8/1/17.
//  Copyright © 2017 Yong Su. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    var img: UIImage
    public init(name: String, items: [Item], collapsed: Bool = true, img:UIImage) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
        self.img = img
    }
}

public var sectionsData: [Section] = [
    Section(name: "", items: [
        Item(name: "", detail: "")
        ], img: #imageLiteral(resourceName: "profile")),
    Section(name: "GIG", items: [
        Item(name: "Create Gig", detail: ""),
        Item(name: "View Gigs", detail: ""),
        Item(name: "Live Gigs", detail: ""),
        ], img: #imageLiteral(resourceName: "gigs")),
    Section(name: "CANDIDATES", items: [
        Item(name: "View Candidates", detail: ""),
        Item(name: "View Shortlisted", detail: ""),
        Item(name: "View Hired", detail: ""),
        ], img: #imageLiteral(resourceName: "profile")),
    Section(name: "CONTRACTS", items: [
        Item(name: "View Gigs", detail: ""),
        Item(name: "View Payments", detail: ""),
        ], img: #imageLiteral(resourceName: "card")),
    Section(name: "EXIT", items: [
        Item(name: "EXIT", detail: "")
        ],collapsed : false, img: #imageLiteral(resourceName: "signout"))
]

public var BadgeData: [Section] = [
    Section(name: "", items: [
        Item(name: "", detail: "")
        ], img: #imageLiteral(resourceName: "profile")),
    Section(name: "GIGS", items: [
        Item(name: "View Gigs", detail: ""),
        Item(name: "Live Gigs", detail: ""),
        ], img: #imageLiteral(resourceName: "gigs")),
    Section(name: "APPLICATIONS", items: [
        Item(name: "View Applications", detail: ""),
        Item(name: "View Shortlisted", detail: ""),
        Item(name: "View Offers", detail: ""),
        ], img: #imageLiteral(resourceName: "profile")),
    Section(name: "CONTRACTS", items: [
        Item(name: "View Gigs", detail: ""),
        Item(name: "View Payments", detail: ""),
        ], img: #imageLiteral(resourceName: "card")),
    Section(name: "EXIT", items: [
        Item(name: "EXIT", detail: "")
        ],collapsed : false, img: #imageLiteral(resourceName: "signout"))
]

public var gigData: [Section] = [
    Section(name: "01. HARVEST TRIMMING MARCH", items: [
        Item(name: "date", detail: "12-11-2018")
        ], img: #imageLiteral(resourceName: "gigs")),
    Section(name: "01. HARVEST TRIMMING MAY", items: [
        Item(name: "date", detail: "12-11-2018")
        ], img: #imageLiteral(resourceName: "profile")),
    Section(name: "01. HARVEST TRIMMING JUNE", items: [
        Item(name: "date", detail: "12-11-2018")
        ], img: #imageLiteral(resourceName: "card"))
]
