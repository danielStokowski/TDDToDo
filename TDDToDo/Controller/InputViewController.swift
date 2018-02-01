//
//  InputViewController.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 31.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    lazy var geocoder = CLGeocoder()
    var itemManager: ItemManager!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    @IBAction func save(){
        guard let title = titleTextField.text else { return }
        let description = descriptionTextField.text != "" ? descriptionTextField.text : nil
        let date = dateFormatter.date(from: dateTextField.text!)
        var location: Location? = nil
        if let addressString = addressTextField.text != "" ? addressTextField.text : nil, let locationName = locationTextField.text != "" ? locationTextField.text : nil {
            geocoder.geocodeAddressString(addressString, completionHandler: { [ unowned self ] (placemarks, error) in
                if error == nil, let placemark = placemarks?.first, let coordinate = placemark.location?.coordinate {
                    location = Location(name: locationName, coordinate: coordinate)
                }
                self.itemManager.add(ToDoItem(title: title, description: description, timestamp: date?.timeIntervalSince1970, location: location))
            })
        }
    }
}
