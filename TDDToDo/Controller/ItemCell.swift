//
//  ItemCell.swift
//  TDDToDo
//
//  Created by Daniel Stokowski on 27.01.2018.
//  Copyright © 2018 Daniel. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(with item: ToDoItem, checked: Bool = false) {
        checked ? configCellChecked(with: item) : configCellNotChecked(with: item)
    }
    
    private func configCellNotChecked(with item: ToDoItem){
        titleLabel.text = item.title
        
        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = ItemCell.dateFormatter.string(from: date)
        }
        
        locationLabel.text = item.location?.name ?? ""
    }
    
    private func configCellChecked(with item: ToDoItem){
        titleLabel.attributedText = NSAttributedString(string: item.title, attributes: [NSAttributedStringKey.strikethroughStyle : NSUnderlineStyle.styleSingle.rawValue])
        
        dateLabel.text = nil
        locationLabel.text = nil
    }
}
