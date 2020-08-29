//
//  pokeDetails.swift
//  PokeDex
//
//  Created by user163857 on 8/28/20.
//  Copyright © 2020 user179175. All rights reserved.
//

import UIKit

class PokeDetail {
    var name: String!
    var url: URL!
    
    init(name: String, urlString: String) {
        self.name = name
        self.url = URL(string: urlString)!
    }
}
