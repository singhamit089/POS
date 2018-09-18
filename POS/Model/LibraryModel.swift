//
//  LibraryModel.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

struct LibraryModel {
    var title: String

    var logo: String

    init(title: String, logo: String) {
        self.title = title
        self.logo = logo
    }

    private init() {
        title = ""
        logo = ""
    }

    public static func getLibraryDataSource() -> [LibraryModel] {
        var someArray = Array<LibraryModel>()

        someArray.append(LibraryModel(title: "All Discounts", logo: "icon-percentage"))
        someArray.append(LibraryModel(title: "All Items", logo: "icon-bulleted-list"))

        return someArray
    }
}
