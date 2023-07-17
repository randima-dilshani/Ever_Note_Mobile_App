//
//  addNotesVC.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-21.
//

import UIKit

class addNotesVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var txtsubjectname: UITextField!
    @IBOutlet weak var txtlessontitle: UITextField!
    @IBOutlet weak var txtlessondescription: UITextView!
    @IBOutlet weak var txtselectdate: UIDatePicker!
    @IBOutlet weak var txtduration: UISlider!
    @IBOutlet weak var durationlabel: UITextField!
    @IBOutlet weak var imagestatus: UITextField!
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        durationlabel.text = "\(Int(txtduration.value)) days"
    }
    
    @IBAction func addslider(_ sender: Any) {
        durationlabel.text = "\(Int(txtduration.value)) days"
    }
    
    
    @IBAction func tximage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate  = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
        
    }
    
    @IBAction func txtcreatnote(_ sender: Any) {
        if let subjectname = txtsubjectname.text ,
           let lessondescription = txtlessondescription.text,
           let lessontitle = txtlessontitle.text {
            if lessondescription != "" || lessontitle != "" {
                let newnotes = StudentNotes(context: DBManager.share.context)
                newnotes.subjectname = subjectname
                newnotes.lessondescription = lessondescription
                newnotes.lessontitle = lessontitle
                newnotes.duration = Int16(txtduration.value)
                newnotes.selectdate = txtselectdate.date
                newnotes.lessonimage = image?.jpegData(compressionQuality: 1)
                newnotes.notestatus = false
                
                DBManager.share.saveContext()
                print (newnotes)
                
                let alertController = UIAlertController(title: "Success", message: "Note Addedd", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){ [self] (action) -> Void in
                    if let vc = storyboard?.instantiateViewController(withIdentifier: "noteViewController") as? noteViewController{
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "Validation Error", message: "Please fill all the fields", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default){ [
                    self] (action) -> Void in
                }
                
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }
        }
        else{
            print("Please fill all the field")
            
            
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return}
        image = userPickedImage
        if (image != nil) {
            imagestatus.text = "Image Uploaded"
        }else{
            imagestatus.text = "Click to Update Image"
        }
        picker.dismiss(animated: true)
    }
    
}
