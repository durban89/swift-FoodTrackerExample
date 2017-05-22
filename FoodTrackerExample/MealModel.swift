//
//  MealModel.swift
//  FoodTrackerExample
//
//  Created by durban.zhang on 2017/5/22.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import UIKit

class MealModel: NSObject {
    // MARK: Properties
    var name:String
    var photo:UIImage?
    var rating:Int
    
    // MARK: Initialization
    init?(name:String, photo:UIImage?, rating:Int){
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        guard rating>=0 && rating<=5 else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
