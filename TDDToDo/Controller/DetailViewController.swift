//
//  DetailViewController.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 30.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var itemInfo: (ItemManager, Int)?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var checkItemButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        guard let itemInfo = itemInfo else { return }
        let item = itemInfo.0.item(at: itemInfo.1)
        
        titleLabel.text = item.title
        locationNameLabel.text = item.location?.name
        descriptionLabel.text = item.description
        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = dateFormatter.string(from: date)
        }
        if let coordinate = item.location?.coordinate {
            let region = MKCoordinateRegionMakeWithDistance(coordinate, 100, 100)
            mapView.region = region
        }
    }
    @IBAction func checkItem() {
        guard let itemManager = itemInfo?.0, let index = itemInfo?.1 else { return }
        itemManager.checkItem(at: index)
    }
    
}
