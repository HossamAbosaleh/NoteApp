//
//  cellfornote.swift
//  NotesApp
//
//  Created by Abu Salleeiihh on 12/26/19.
//  Copyright © 2019 Abu Salleeiihh. All rights reserved.
//

import UIKit

class cellfornote: UITableViewCell {
    @IBOutlet weak var titleOfNote: UILabel!
    @IBOutlet weak var textViewForNote: UITextView!
    @IBOutlet weak var dateSaved: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // Initialization code
        textViewForNote.detailsDesign()
        titleOfNote.layer.cornerRadius = 15
        dateSaved.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
              // Configure the view for the selected state
    }
    func setCell(note:MyNote) {
        titleOfNote.text = note.title
        textViewForNote.text = note.details
    

        func dateAsString() -> String {
            let date = note.date_save
            let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            let str = dateFormatter.string(from: date ?? Date())
            return str
            }
        dateSaved.text = dateAsString()
        

    }
}
extension UITextView {
    func detailsDesign()  {
        self.layer.cornerRadius = 15.0
             self.layer.shadowColor = UIColor.blue.cgColor
             self.layer.shadowOffset = .zero
             self.layer.shadowOpacity = 3.7
             self.layer.shadowRadius = 20.0
             self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
             self.layer.shouldRasterize = true
         
    }
}
extension UILabel{
    func notetitleDiesgn() {
        self.layer.cornerRadius = 20
    
    }
}
