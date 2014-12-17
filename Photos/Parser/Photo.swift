//
//  Photo.swift
//  Parser
//
//  Created by Valerio Ferrucci on 25/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import Foundation

class Photo : NSObject {
    
    var titolo : String
    var autore : String
    var latitudine : Double
    var longitudine : Double
    var data : String
    var descr : String
    var date : NSDate
    
    // se no init -> bug "cannot initialize Photo"
    init(date: NSDate) {
        
        titolo = ""
        autore = ""
        latitudine = 0
        longitudine = 0
        data = ""
        descr = ""
        self.date = date
    }
    
    func description() -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        formatter.timeStyle = .NoStyle
        let dateFormatted = formatter.stringFromDate(date)

        return dateFormatted + ": " + titolo + "-" + autore
    }
        
}