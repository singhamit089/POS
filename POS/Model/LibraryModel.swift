//
//  LibraryModel.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

struct LibraryModel {
    
    var title:String
    
    var logo:String
    
    init(title:String,logo:String) {
        self.title = title
        self.logo = logo
    }
    
    private init() {
        self.title = ""
        self.logo = ""
    }
    
    public static func getLibraryDataSource()->[LibraryModel] {
        
        var array = Array<LibraryModel>.init(repeating: LibraryModel(), count: 2)
        
        array[0] = LibraryModel(title: "All Discounts", logo: "icon-percentage")
        array[1] = LibraryModel(title: "All Items", logo: "icon-bulleted-list")
        
        return array
    }
    
}
