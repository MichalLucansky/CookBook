//
//  ResultVC.swift
//  CookBook
//
//  Created by Michal Lučanský on 11.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import UIKit
import Alamofire

class ResultVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipeArray = [RecipeSearched]()
    private var filteredRecipeArray = [RecipeSearched]()
    private var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.done
        
   
    }
  
    override func viewDidDisappear(_ animated: Bool) {
        recipeArray.removeAll()
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
        
            return filteredRecipeArray.count
        }else{
            
            return recipeArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCell
        
        if inSearchMode{
        
            cell?.configResultCell(result: filteredRecipeArray[indexPath.row])
        
        }else{
        
            cell?.configResultCell(result: recipeArray[indexPath.row])
        
        }
        
       
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 87, height: 87)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            
            collectionView.reloadData()
            view.endEditing(true)
        }else{
        
            inSearchMode = true
            
            let lower = searchBar.text?.lowercased()
            filteredRecipeArray = recipeArray.filter({$0.name.lowercased().contains(lower!)})
            collectionView.reloadData()
           
        
        }
    }
    
    @IBAction func back(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }

}
