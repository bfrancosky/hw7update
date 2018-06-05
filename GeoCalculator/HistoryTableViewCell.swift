//
//  HistoryTableViewCell.swift
//  GeoCalculator
//
//  Created by Brian on 6/4/18.
//  Copyright © 2018 Jonathan Engelsma. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for:
            indexPath) as! HistoryTableViewCell
        //let ll = entries[indexPath.row]
        
        if let ll = self.entryTableView?[indexPath.section].entries[indexPath.row] {
            cell.destPoint.text = "(\(ll.origLat.roundTo(places:4)),\(ll.origLng.roundTo(places:4)))"
            cell.origPoint.text = "(\(ll.destLat.roundTo(places:4)),\(ll.destLng.roundTo(places: 4)))"
            cell.timestamp.text = ll.timestamp.description
        }
 
        return cell
    }
    

    @IBOutlet weak var destPoint: UILabel!
    @IBOutlet weak var origPoint: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    /*
    // MARK: - Table view data source
     override func numberOfSections(in entryTableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if let data = self.entries {
            return data.count
        } else {
            return 0
        }
    }
     override func tableView(_ entryTableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let sectionInfo = self.tableViewData?[section] {
            return sectionInfo.entries.count
        } else {
            return 0
        }
    }
    */
}
