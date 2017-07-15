//
//  ItemCell.swift
//  CookBook
//
//  Created by Michal Lučanský on 9.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var recipeType: UILabel!
    
    
    private var item : RecipeType!

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func itemCellSetUp(item: RecipeType){
    self.item = item
        
    imageView.image = UIImage(named: item.imgName)
    
        if item.recipeTypeName == ""{
        
            recipeType.text = "Random"
        
        }else{
        
            recipeType.text = item.recipeTypeName
    
        }
    
    
    }
    
    
    
    
}
