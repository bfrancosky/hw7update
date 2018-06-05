//
//  HistoryTableViewController.swift
//  GeoCalculator
//
//  Created by Brian on 5/29/18.
//  Copyright © 2018 Jonathan Engelsma. All rights reserved.
//

import UIKit

protocol HistoryTableViewControllerDelegate {
    func selectEntry(entry : LocationLookup)
}

class HistoryTableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
   
    
    
    //@IBOutlet weak var destPoint: UILabel!
    //@IBOutlet weak var origPoint: UILabel!
    
   
    @IBOutlet weak var coordt: UILabel!
    @IBOutlet weak var coord: UILabel!
    @IBOutlet weak var entryTableView: UITableView!
    
    var entries : [LocationLookup]! = [
        LocationLookup(origLat: 90.0, origLng: 0.0, destLat: -90.0, destLng: 0.0,
                       timestamp: Date.distantPast),
        LocationLookup(origLat: -90.0, origLng: 0.0, destLat: 90.0, destLng: 0.0,
                       timestamp: Date.distantFuture)]
     
   var delegate : HistoryTableViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entries.append(LocationLookup(origLat: 55, origLng: 44, destLat: 66, destLng: 88, timestamp: Date()))
         entries.append(LocationLookup(origLat: 77, origLng: 78, destLat: 66, destLng: 88, timestamp: Date()))
        self.entryTableView.delegate=self
        self.entryTableView.dataSource=self
        self.sortIntoSections(entries: self.entries)
       
        // Do any additional setup after loading the view.
    }

    
    // final mods
   
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let data = self.tableViewData {
            return data.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let sectionInfo = self.tableViewData?[section] {
            return sectionInfo.entries.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! TableViewCell
        cell.cood.text = "(\(entries[indexPath.row].origLat) , \(entries[indexPath.row].origLng) ) , (  \(entries[indexPath.row].destLat) ,  \(entries[indexPath.row].destLng) )"
        cell.coodt.text = "\(entries[indexPath.row].timestamp)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let del = self.delegate {
            let ll = entries[indexPath.row]
            del.selectEntry(entry: ll)
        }
        
        // this pops to the calculator
        _ = self.navigationController?.popViewController(animated: true)
    }
    
      
    
    
    var tableViewData: [(sectionHeader: String, entries: [LocationLookup])]? {
        didSet {
            DispatchQueue.main.async {
                self.entryTableView.reloadData()
            }
        }
    }
    
   
    func sortIntoSections(entries: [LocationLookup]) {
        var tmpEntries : Dictionary<String,[LocationLookup]> = [:]
        var tmpData: [(sectionHeader: String, entries: [LocationLookup])] = []
        // partition into sections
        
        for entry in entries {
            let x = "Hiii   (\(entry.origLat) , \(entry.origLng) ) , (  \(entry.destLat) ,  \(entry.destLng) ) \(entry.timestamp)"
            print(x)
        }
        for entry in entries {
            let shortDate = entry.timestamp.short
            if var bucket = tmpEntries[shortDate] {
                bucket.append(entry)
                tmpEntries[shortDate] = bucket
            } else {
                tmpEntries[shortDate] = [entry]
            }
        }
        // breakout into our preferred array format
        let keys = tmpEntries.keys
        for key in keys {
            if let val = tmpEntries[key] {
                tmpData.append((sectionHeader: key, entries: val))
            }
        }
        // sort by increasing date.
        tmpData.sort { (v1, v2) -> Bool in
            if v1.sectionHeader < v2.sectionHeader {
                
                return true
            } else {
                return false
            }
        }
        self.tableViewData = tmpData
    }
 

}


extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension Date {
    struct Formatter {
        static let short: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
    }
    var short: String {
        return Formatter.short.string(from: self)
    }
}




