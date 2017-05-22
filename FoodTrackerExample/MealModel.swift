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
        if name.isEmpty || rating < 0 {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
