//
//  RatingModel.swift
//  classwork6.1
//
//  Created by Francisco Gutierrez on 2/16/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import Foundation

enum RatingType {
    case NotYetRated
    case LovedIt
    case MehedIt
    
    func getDisplayValue () -> String {
        switch self {
        case .NotYetRated: return "Not Yet Rated"
        case .LovedIt: return "Loved It 😍"
        case .MehedIt: return  "Meh 💩"
        }
    }
}


class DetailedRating {
    var fileName: String
    var rating: RatingType
    var comment: String
    var time : String
    
    init(fileName: String, rating: RatingType, comment: String){
        self.rating = rating
        self.comment = comment
        self.fileName = fileName
        
        let currentTime = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .MediumStyle
        self.time = timeFormatter.stringFromDate(currentTime)
    }
    
    func friendlyDisplay() -> String{
        return "\(fileName) - \(time) - \(rating.getDisplayValue()) - \(comment)"
    }
}

