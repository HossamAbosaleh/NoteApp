//
//  ViewControllerTocell.swift
//  NotesApp
//
//  Created by Abu Salleeiihh on 12/26/19.
//  Copyright © 2019 Abu Salleeiihh. All rights reserved.
//

import UIKit
import CoreData
class ViewControllerTocell: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableViewNote: UITableView!
   // @IBOutlet var editButton : UIButton!
    
    var listOfNotes = [MyNote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadnNotes()
      
    }
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellfornote
      
        cell.setCell(note: listOfNotes[indexPath.row])
        return cell
    }
    
   
        
//        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//
//
//
//   let alerControl = UIAlertController(title: "Delete", message: "Are you sure you want to delete note ", preferredStyle:.alert)
//                      let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
//
//                          guard editingStyle == .delete else { return }
//                          self.listOfNotes.remove(at: indexPath.row)
//                          self.tableViewNote.deleteRows(at: [indexPath], with: .automatic)
//                      }
//                      let noAcyion = UIAlertAction(title: "No", style: .default, handler: nil)
//                      alerControl.addAction(yesAction)
//                      alerControl.addAction(noAcyion)
//
//                                 self.present(alerControl, animated: true)
//
//
//                     }
//
//
//           }
//
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alerControl = UIAlertController(title: "Delete", message: "Are you sure you want to delete note ", preferredStyle:.alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            if editingStyle == .delete {
            let commit = self.listOfNotes[indexPath.row]
                 context.delete(commit)
            self.listOfNotes.remove(at: indexPath.row)
            self.tableViewNote.deleteRows(at: [indexPath], with: .fade)
            self.tableViewNote.reloadData()
              do {
                  try context.save()
                  
              } catch  {
                  
              }
             }

                            }
        let noAcyion = UIAlertAction(title: "No", style: .default, handler: nil)
                    alerControl.addAction(yesAction)
                    alerControl.addAction(noAcyion)
                    self.present(alerControl, animated: true)
     
   }
    
    
    
    
    func loadnNotes() {
        let fetchRequest:NSFetchRequest<MyNote> = MyNote.fetchRequest()
        do {
            listOfNotes = try context.fetch(fetchRequest)
            tableViewNote.reloadData()
        } catch  {
            
        }
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          tableViewNote.endEditing(true)
      }
    
    
    
    

    
    
    
    @IBAction func backButton(){
      dismiss(animated: true, completion: nil)
        
    }
    
   
    

}

//keyboard

