//
//  ViewController.swift
//  FinalAppSearch
//
//  Created by cis290 on 11/19/18.
//  Copyright © 2018 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var Webview: UIWebView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var btnSearchBack: UIButton!
    @IBOutlet weak var btnSearchArchive: UIButton!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFirstName.text, forKey: "firstname")
        defaults.set(self.txtLastName.text, forKey: "lastname")
        defaults.set(self.txtCity.text, forKey: "city")
        defaults.set(self.txtCountry.text, forKey: "country")
        defaults.synchronize()
        clear()
        
    }
    
    func clear()
    {
        txtFirstName.resignFirstResponder()
        txtLastName.resignFirstResponder()
        txtCity.resignFirstResponder()
        txtCountry.resignFirstResponder()
    }
    
   
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var countryDropDown: UIPickerView!
    
    
    var list = ["US", "UK", "Canada"]
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.txtCountry.text = self.list[row]
        self.countryDropDown.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.txtCountry {
            self.countryDropDown.isHidden = false
            //if you don't want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* let url = NSURL(string: "http://www.google.com")
        let request = NSURLRequest(url: url! as URL)
        
        Webview.loadRequest(request as URLRequest)
        
        SearchBar.text = "http://"
        //let defaults: UserDefaults = UserDefaults.standard
        //if defaults.string(forKey: "firstname") != nil{
        //    txtFirstName.text = defaults.string(forKey: "firstname")
        //}
        //if defaults.string(forKey: "lastname") != nil{
        //    txtLastName.text = defaults.string(forKey: "lastname")
        //}
        //if defaults.string(forKey: "city") != nil{
        //    txtCity.text = defaults.string(forKey: "city")
        //}
        //if defaults.string(forKey: "country") != nil{
        //    txtCountry.text = defaults.string(forKey: "country")
        //} */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* func searchBarSearchButtonClicked(searchbar: UISearchBar) {
        
        searchbar.resignFirstResponder()
        
        let text = SearchBar.text
        let url = NSURL(string: text!)
        let request = NSURLRequest(url: url! as URL)
        
        Webview.loadRequest(request as URLRequest)
        
        
    } */

}

