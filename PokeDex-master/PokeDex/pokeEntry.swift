//
//  pokeEntry.swift
//  PokeDex
//
//  Created by user163857 on 8/27/20.
//  Copyright © 2020 user179175. All rights reserved.
//

import UIKit

class PokeEntry {
    var name: String!
    var url: URL!
    
    init(name: String, urlString: String) {
        self.name = name
        self.url = URL(string: urlString)!
    }
}
