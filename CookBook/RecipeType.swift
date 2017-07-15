//
//  RecipeType.swift
//  CookBook
//
//  Created by Michal Lučanský on 10.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation

class RecipeType{

    
    private var _imgName : String
    private var _recipeTypeName : String
    
    var imgName : String{
    
        return _imgName
        
    }
    
    var recipeTypeName : String{
    
        return _recipeTypeName
    
    }
    
    
    init(imageName : String, recipeType : String) {
        
        self._imgName = imageName
        self._recipeTypeName = recipeType
        
    }





}
