//
//  RecipeSearched.swift
//  CookBook
//
//  Created by Michal Lučanský on 10.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation
import UIKit
class RecipeSearched{

    private var _name : String!
    private var _id : Int!
    private var _imageUrl : String!
    
    
    var name : String{
        return _name
    }
    
    var id : Int{
        return _id
    }
    
    var imageUrl : String{
        return _imageUrl
    }
    
    
    init(result: Dictionary<String, AnyObject>) {
        
        if let recipeId = result["id"] as? Int{
        
            self._id = recipeId
        
           
        }
        
        if let recipeName = result["title"] as? String{
        
            self._name = recipeName
            
        }
        
        if let url = result["image"] as? String{
           
            
            self._imageUrl = url
            
        }
        
    }

 
}
