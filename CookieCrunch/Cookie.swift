//
//  Cookie.swift
//  CookieCrunch
//
//  Created by Anil Kumar on 17/05/15.
//  Copyright (c) 2015 Shokeen. All rights reserved.
//

import SpriteKit

enum CookieType: Int, Printable {
    
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    
    //to get name of the image file for each cookie
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        
        return spriteNames[rawValue - 1]
    }
    
    //to return the highlighted name of the image of the required cookie
    var highlightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
    //to return random cookie, every time a new cookie needs to be added to the game
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    //description required to make CookieType Printable to output console
    var description: String {
        return spriteName
    }

}

class Cookie: Printable, Hashable {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row*10 + column
    }
    
}

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}