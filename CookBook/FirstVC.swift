//
//  FirstVC.swift
//  CookBook
//
//  Created by Michal Lučanský on 9.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit
import Alamofire

class FirstVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var recipeType = ["Fish","Beef","Pork","Vegetarian","Chicken","Sweets","Salad","","Soup"]
    private var recipeTypeImage = ["1","2","3","4","5","6","7","8","9"]
    private var itemArray = [RecipeType]()
    private var recipeArray = [RecipeSearched]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        createItemArray()
                
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        recipeArray.removeAll()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as? ItemCell
        cell?.itemCellSetUp(item: itemArray[indexPath.row])
        return cell!
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 87, height: 87)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        SingletonUrl.sharedInstance.foodType = recipeType[indexPath.row]
        searchForRecipes {
            self.performSegue(withIdentifier: "searchDetail", sender: Any?.self)
        }
    }
    

    private func createItemArray(){
    
        
        for i in 0...recipeType.count-1{
        
            itemArray.append(RecipeType(imageName: recipeTypeImage[i], recipeType: recipeType[i]))
        
        
        
        }
    }
    
    private func searchForRecipes(compleated: @escaping DownloadFinished){
        let finalUrl = "\(BASE_URL)\(SingletonUrl.sharedInstance.foodType!)\(END_URL)"
       print(finalUrl)
        let url = URL(string: finalUrl)!
        let authentification  = AUTHENTIFICATION
        
        Alamofire.request(url, headers : authentification).responseJSON { (response) in
                
            if let dict = response.value as? Dictionary<String,AnyObject>{
                
                if let result = dict["results"] as? [Dictionary<String, AnyObject>]{
                
                    for recipe in result{
                    
                        let recipeResult = RecipeSearched(result: recipe)
                        
                        self.recipeArray.append(recipeResult)
                    
                    }
                    
                    
                }
            
            
            }
            compleated()
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchDetail"{
            
            let newVC = segue.destination as! ResultVC
            newVC.recipeArray = recipeArray
        
        }
    }


}

