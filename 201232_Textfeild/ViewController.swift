//
//  ViewController.swift
//  201232_Textfeild
//
//  Created by praveen kumar talari on 2/10/21.
//  Copyright © 2021 Praveen T. All rights reserved.
//

import UIKit
import TextFieldEffects
import Toast_Swift
class ViewController: UIViewController,UITextFieldDelegate {
    //Text fields from base storyboard..,
    @IBOutlet weak var myText: YokoTextField!
    @IBOutlet weak var lastName: YokoTextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var martialTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    
    //Button from stroyboard
    @IBOutlet weak var submitBtn: UIButton!
 
    //Label from stroyboard
    @IBOutlet weak var respLbl: UILabel!
    
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Implied delegates for all Drag and drop fields
        myText.delegate = self
        lastName.delegate = self
        ageTF.delegate = self
        martialTF.delegate = self
        genderTF.delegate = self
        emailTF.delegate = self
        mobileTF.delegate = self
        stateTF.delegate = self
        cityTF.delegate = self
        countryTF.delegate = self
        
    
        lastName.borderStyle = UITextField.BorderStyle.roundedRect
        //Button for submit
        submitBtn.backgroundColor
            = UIColor.systemGreen
        //Fixing Target
        submitBtn.addTarget(self, action:#selector(responseBtn) , for: UIControl.Event.touchUpInside)
        //print("Test")
        //self.myText.becomeFirstResponder()
        //focus()
        // Do any additional setup after loading the view.
    }

    //Action for Toast
    @IBAction func onClick(_ sender: Any) {
        if(myText.text!.count > 0 && lastName.text!.count > 0 && Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7 && mobileTF.text!.count >= 10 && cityTF.text!.count > 0 && stateTF.text!.count > 0 && countryTF.text!.count > 0){
            respLbl.text = ""
        workToast(message: "Thanks for Registration with us..")
        }
//        if(Int(ageTF.text!)! > 120){
//            workToast(message: "Please Enter Valid age")
//        }
        else{
            respLbl.text = "Please Click on Submit"
            respLbl.textColor = .black
            workToast(message: "Please fill all Fields, Its Mandatory..")
        }
    }
    func focus(){
        self.myText.becomeFirstResponder()
    }
    //Created an action for the button to gave response to user
    @objc func responseBtn(submitBtn:UIButton){
            if(myText.text!.count > 0 && lastName.text!.count > 0 && Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7 && mobileTF.text!.count >= 10 && cityTF.text!.count > 0 && stateTF.text!.count > 0 && countryTF.text!.count > 0){
//                respLbl.backgroundColor = UIColor.systemIndigo
//                respLbl.text = "Thanks for Registring with us..."
                
                
            }else{
                respLbl.text = ""
            }
            
        //respLbl.text = "Done..."
        //respLbl = UILabel()
        
    }
    //Delagtes implementaion starts here!!!
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print ("textFieldShouldBeginEditing")
        var returnValue:Bool = false

        if(textField == myText){
            
            returnValue = true
            
        }
        if(textField == lastName){
            if(myText.text!.count > 0){
                returnValue = true
            }
            else{
                returnValue = false
            }
        }
        if(textField == ageTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0){
                returnValue = true
            }
            else{
                returnValue = false
            }
        }
        if(textField == martialTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 && Int(ageTF.text!)! >= 10 &&  Int(ageTF.text!)! <= 120){
                returnValue = true
            }
            //Int(ageTF.text!)! >= 10 &&
            else{
                returnValue = false
            }
        }
        if(textField == genderTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 &&
                Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0){
                    returnValue = true
            }
            else{
                    returnValue = false
            }
        }
        if(textField == emailTF){
               if(myText.text!.count > 0 && lastName.text!.count > 0 &&
                   Int(ageTF.text!)! >= 10 &&
                   Int(ageTF.text!)! <= 120 &&
                   martialTF.text!.count > 0 && genderTF.text!.count > 0){
                    returnValue = true
                }
                else{
                    returnValue = false
                 }
         }
        if(textField == mobileTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 &&  Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7){
                mobileTF.text = "+91-"
                returnValue = true
            }
            else{
                returnValue = false
            }
        }
        if(textField == stateTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 &&  Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120  && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7 && mobileTF.text!.count == 14 ){
                returnValue = true
            }
            else{
                returnValue = false
            }
        }
        if(textField == cityTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 &&  Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7 && mobileTF.text!.count == 14 && stateTF.text!.count > 0){
                returnValue = true
            }
            else{
                returnValue = false
            }
        }
        if(textField == countryTF){
            if(myText.text!.count > 0 && lastName.text!.count > 0 &&  Int(ageTF.text!)! >= 10 && Int(ageTF.text!)! <= 120 && martialTF.text!.count > 0 && genderTF.text!.count > 0 && emailTF.text!.count > 7 && mobileTF.text!.count == 14 && cityTF.text!.count > 0 && stateTF.text!.count > 0){
            returnValue = true
        }
        else{
            returnValue = false
        }
    }
    return returnValue
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        var returnValue:Bool = true
        if(textField == myText){
            if (textField.text!.count >= 3){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        if(textField == lastName){
            if (textField.text!.count >= 3){
                returnValue = true
            }else{
                returnValue = false
            }
        }
        if(textField == ageTF){
            if (Int(textField.text!)! >= 120){
                returnValue = false
            }else{
                
                returnValue = true
            }
        }
        if(textField == emailTF){
            return validateEmail(enteredEmail: textField.text!)
        }

        print ("textFieldShouldEndEditing")
        return returnValue


    }
    func validateAge(enteredAge:String) -> Bool
        {

        let emailFormat = "[/^(?:1[01][0-9]|120|1[7-9]|[2-9][0-9])$/gm]"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredAge)

    }
    func validateEmail(enteredEmail:String) -> Bool     {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print ("textFieldDidBeginEditing")
        //textField.backgroundColor  = UIColor.systemBlue
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //textField.backgroundColor = UIColor.systemBackground

        print ("textFieldDidEndEditing")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print ("textField -\(string)")
        if(string == ""){
            return true
        }

        var returnValue = true
        if(textField == myText || textField == lastName  || textField == martialTF || textField == genderTF || textField == stateTF || textField == cityTF || textField == countryTF){
            var charSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ")

            if(string.rangeOfCharacter(from: charSet) != nil){
                return true
            }else{
                return false
            }
        }
        if(textField == ageTF){
            var charset = CharacterSet(charactersIn: "0123456789")
            if(string.rangeOfCharacter(from: charset) != nil){
                return true
            }else{
                return false
            }
        }
        if(textField == mobileTF ){
            var charSet = CharacterSet(charactersIn: "+0123456789-")

            if(string.rangeOfCharacter(from: charSet) != nil){
                return true
            }else{
                return false
            }
        }
        if(textField == emailTF ){
            var charSet = CharacterSet(charactersIn: "~()<>?/!#^=+-`\("") ;:,[]{}&$").inverted

            if(string.rangeOfCharacter(from: charSet) != nil){
                return true
            }else{
                return false
            }
        }
        return returnValue
    }
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//            print ("textFieldShouldClear")
//            return true
//        }
//    func textFieldShouldReturn(_ textField: UITextField)  -> Bool {
//        print ("textFieldShouldReturn")
//        //textField.resignFirstResponder()
//        return true
//    }
}
//Logical extension for Toast
extension UIViewController{
    //Function to work Toast
    func workToast(message: String){
        let toastLdl = UILabel()
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        toastLdl.text = message
        toastLdl.textAlignment = .center
        toastLdl.font = UIFont.systemFont(ofSize: 25)
        toastLdl.textColor = UIColor.white
        toastLdl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLdl.numberOfLines = 0

        let textSize = toastLdl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 80)


        toastLdl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth+40, height: textSize.height)
        toastLdl.center.x = window.center.x
        toastLdl.layer.cornerRadius = 10
        toastLdl.layer.masksToBounds = true
        window.addSubview(toastLdl)
        UIView.animate(withDuration: 5.0, animations: {
            toastLdl.alpha = 0
        }){ (_) in
            toastLdl.removeFromSuperview()
        }
    }

}



































