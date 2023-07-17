
//  PendingViewController.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.


import UIKit

class PendingViewController: UIViewController {

    var pendingNotes = [StudentNotes]()
    
    
    @IBOutlet weak var pendingTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pendingNotes = DBManager.share.fetchStudentNotes()
        pendingTable.reloadData()
    }
}

extension PendingViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let onePending = pendingNotes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PendingTableViewCell
        cell.pendingsubjectname.text = onePending.subjectname
        cell.pendinglessontitle.text = onePending.lessontitle
        cell.pendingduration.text = "\(onePending.duration)"
        
        if let imageData = onePending.lessonimage{
            cell.pendingimage.image = UIImage(data: imageData)
        }else {
            cell.pendingimage.image = nil
        }
        cell.layer.cornerRadius=10
        cell.layer.borderWidth=5
        cell.layer.borderColor = UIColor(red: CGFloat(235/255.0), green: CGFloat(236/255.0), blue: CGFloat(239/255.0), alpha: CGFloat(1.0)).cgColor
        print(onePending)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let note = storyboard?.instantiateViewController(withIdentifier: "specificViewController") as? specificViewController {
            note.currentNote = pendingNotes[indexPath.row]
            self.navigationController?.pushViewController(note, animated: true)
        }
    }
    
    //delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            var dialogMessage = UIAlertController(title: "Delete Confirmation", message: "Are you sure, you want to delete this lesson note?", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default) {[self] (action) -> Void in
                do{
                    try DBManager.share.context.delete(self.pendingNotes[indexPath.row])
                } catch {
                    print("Error in Delete")
                }
                
                DBManager.share.saveContext()
                pendingNotes.remove(at: indexPath.row)
                
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
