//
//  specificViewController.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit

class specificViewController: UIViewController, UINavigationControllerDelegate{
    
    var currentNote: (StudentNotes)? = nil
    
    @IBOutlet weak var specificimage: UIImageView!
    @IBOutlet weak var specificsubname: UILabel!
    @IBOutlet weak var specificlestitle: UILabel!
    @IBOutlet weak var specificdate: UILabel!
    @IBOutlet weak var specificdesc: UITextView!
    @IBOutlet weak var specificduration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specificdesc.text = currentNote?.lessondescription
        specificsubname.text = currentNote?.subjectname
        specificlestitle.text = currentNote?.lessontitle
        specificimage.layer.cornerRadius = 10
        if let data = currentNote?.lessonimage{
            specificimage.image = UIImage(data: data)
        }else {
            specificimage.image = nil
        }
        
        if let date = currentNote?.selectdate , let duration = currentNote?.duration{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            
            dateFormatter.locale = Locale(identifier: "ja_JP")
            
            specificdate.text = "\(dateFormatter.string(from: date))"
            specificduration.text = "\(duration) days"
        }
        
    }
    @IBAction func specificcompletedbtn(_ sender: Any) {
        let dialogMessage = UIAlertController(title: "Completed Lesson", message: "Are you sure, Did you Completed your Lesson", preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            self.currentNote?.notestatus = true
            DBManager.share.saveContext()
        }
        
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel")
        }
        dialogMessage.addAction(OK)
        dialogMessage.addAction(Cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    @IBAction func specificupdatebtn(_ sender: Any) {
        if let notes = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController {
            notes.currentNote = currentNote
            self.navigationController?.pushViewController(notes, animated: true)
        }
    }
}
    
    

   


