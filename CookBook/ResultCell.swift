//
//  ResultCell.swift
//  CookBook
//
//  Created by Michal Lučanský on 11.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit
import Alamofire

class ResultCell: UICollectionViewCell {
    
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    private var recipeSearched : RecipeSearched!
    
    private var white = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = white.cgColor
    
    }
    
    func configResultCell(result: RecipeSearched){
        
    self.recipeSearched = result
    
    let url = URL(string: "https://spoonacular.com/recipeImages/\(result.imageUrl)")!
      
        
        nameLabel.text =  result.name
        
        
        Alamofire.request(url).responseData { (data) in
            if let imageData = data.data{
            
                let image = UIImage(data: imageData)
                self.imageView.image = image
            
            }
            //DownloadFinished()
        }
    
        
       
   
    
        
    }
    
   
    
}
