//
//  EditViewController.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit

class EditViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var editsubname: UITextField!
    @IBOutlet weak var editlessontitle: UITextField!
    @IBOutlet weak var editdate: UIDatePicker!
    @IBOutlet weak var editslider: UISlider!
    @IBOutlet weak var editdesc: UITextView!
    @IBOutlet weak var editimage: UIImageView!
    @IBOutlet weak var uploadimagestatus: UITextField!
    @IBOutlet weak var slidercount: UITextField!
    
    
    var currentNote : (StudentNotes)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editsubname.text = currentNote?.subjectname
        editlessontitle.text = currentNote?.lessontitle
        editdesc.text = currentNote?.lessondescription

        if let dateData = currentNote?.selectdate {
            editdate.date = dateData
        }
        
        if let sliderData = currentNote?.duration {
            editslider.value = Float(sliderData)
        }
        
        slidercount.text =  "\(Int(editslider.value)) Days"
        
        if let data = currentNote?.lessonimage {
            editimage.image = UIImage(data: data)
        }else {
            editimage.image = nil
        }
        uploadimagestatus.text = "Click to Upload Image"
    }
    
    
    @IBAction func editdayslider(_ sender: Any) {
        slidercount.text = "\(Int(editslider.value)) Days"
    }
    
    
    
    @IBAction func selectbtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    
    @IBAction func updatebtn(_ sender: Any) {
        currentNote?.subjectname = editsubname.text
        currentNote?.lessontitle = editlessontitle.text
        currentNote?.lessondescription = editdesc.text
        currentNote?.duration = Int16(editslider.value)
        currentNote?.selectdate = editdate.date
        currentNote?.lessonimage = editimage.image?.jpegData(compressionQuality: 1)
        
        DBManager.share.saveContext()
        print(currentNote)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "specificViewController") as? specificViewController{
            vc.currentNote = currentNote
            self.navigationController?.pushViewController(vc, animated: true)
      }

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return}
        editimage.image = userPickedImage
        if (editimage != nil) {
            uploadimagestatus.text = "Image Uploaded"
        }else{
            uploadimagestatus.text = "Click to Update Image"
        }

        picker.dismiss(animated: true)
    }
    
}

  


