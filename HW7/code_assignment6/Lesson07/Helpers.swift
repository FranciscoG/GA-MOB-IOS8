//
//  Helpers.swift
//  Lesson07
//
//  Created by Francisco Gutierrez on 3/21/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation

class Helpers {
    
    func getUrlForDocument(documentName:String)->NSURL{
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first!
        
        return directory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }
    
    func saveToFile(text: String, dest: String)->Bool{
        do {
            try text.writeToURL(self.getUrlForDocument(dest), atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print("error saving \(dest) file")
            return false
        }
        return true
    }
    
    func readFromFile(filename: String)->String{
        var output: String?
        do {
            output = try String(contentsOfURL: self.getUrlForDocument(filename))
        } catch {
            print("error loading \(filename)")
            return "error"
        }
        return output!
    }
    
}