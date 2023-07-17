//
//  CompletedViewController.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit

class CompletedViewController: UIViewController {
    
    
    @IBOutlet weak var completedviewtable: UITableView!
    
    var completedNotes = [StudentNotes]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        completedNotes = DBManager.share.fetchCompletedStudentNotes()
        completedviewtable.reloadData()
    }
}

extension CompletedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let oneCompleted = completedNotes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompletedTableViewCell
        cell.completedsubjectname.text = oneCompleted.subjectname
        cell.completedlessontitle.text = oneCompleted.lessontitle
        cell.completedduration.text = "\(oneCompleted.duration)"
        
        if let imageData = oneCompleted.lessonimage{
            cell.completedimage.image = UIImage(data: imageData)
        }else {
            cell.completedimage.image = nil
        }
        cell.layer.cornerRadius=10
        cell.layer.borderWidth=5
        cell.layer.borderColor = UIColor(red: CGFloat(235/255.0), green: CGFloat(236/255.0), blue: CGFloat(239/255.0), alpha: CGFloat(1.0)).cgColor
        print(oneCompleted)
        return cell
    }

    //delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let dialogMessage = UIAlertController(title: "Delete Confirmation", message: "Are you sure, you want to delete this lesson note?", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default) {[self] (action) -> Void in
                do{
                    try DBManager.share.context.delete(self.completedNotes[indexPath.row])
                } catch {
                    print("Error in Delete")
                }
                
                DBManager.share.saveContext()
                completedNotes.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            let Cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel")
            }
            
            dialogMessage.addAction(OK)
            dialogMessage.addAction(Cancel)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
}
