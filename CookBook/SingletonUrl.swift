//
//  SingletonUrl.swift
//  CookBook
//
//  Created by Michal Lučanský on 10.7.17.
//  Copyright © 2017 Michal Lučanský. All rights reserved.
//

import Foundation

class SingletonUrl {

    static var sharedInstance = SingletonUrl()
    
    private init(){}
    

    var foodType : String!
    
    


}
