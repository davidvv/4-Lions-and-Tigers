//
//  LionCub.swift
//  Lions and Tigers
//
//  Created by David Vences Vaquero on 24/3/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly() {
    println("LionCub: Snugle and be happy")
    }
    
    override func roar() {
        super.roar()
        println("growl, growl")
    }
    
    override func randomFact() -> String {
        var randomFactString: String
        if isAlphaMale{
            randomFactString = "Cubs are usually hidden in the bush for aproximately six weeks"
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
    }
    return randomFactString
    }
}