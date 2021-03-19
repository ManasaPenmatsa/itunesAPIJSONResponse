//
//  ViewController.swift
//  ItunesAPI
//
//  Created by Manasa on 18/03/21.
//  Copyright © 2021 Manasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet var searchTextfield: UITextField!
    
    
    var songsManager = SongsManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextfield.delegate = self
    }


    
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if searchTextfield.text != "" {
            return true
        }else {
            searchTextfield.placeholder = "Enter Artist Name"
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let artist = searchTextfield.text {
            songsManager.fetchSong(artistName: artist)
        }
        searchTextfield.text = ""
    }
        
        
    }
    
    
    


