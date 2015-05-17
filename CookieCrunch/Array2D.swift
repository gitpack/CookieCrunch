//
//  Array2D.swift
//  CookieCrunch
//
//  Created by Anil Kumar on 17/05/15.
//  Copyright (c) 2015 Shokeen. All rights reserved.
//

//Type required to maintain array of cookie type objects, allows subscripting
struct Array2D<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows*columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}