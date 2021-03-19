//
//  SongsManager.swift
//  ItunesAPI
//
//  Created by Manasa on 18/03/21.
//  Copyright © 2021 Manasa. All rights reserved.
//

import Foundation


struct SongsManager {
    let songsUrl = "http://itunes.apple.com/search?"
    
    func fetchSong(artistName: String){
        
        let urlString = "\(songsUrl)term=\(artistName)"
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
                
                
            task.resume()
        }
        
    }
    
    
    func handle(data: Data?, response: URLResponse?, error:Error?) {
        
        if error != nil {
            print(error)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
            
        }
    }
    
    
    
}
