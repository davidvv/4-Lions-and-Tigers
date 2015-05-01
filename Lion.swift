//
//  Lion.swift
//  Lions and Tigers
//
//  Created by David Vences Vaquero on 17/3/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    func roar (){ //defino las funciones del león dentro de la clase leon
        println("Lion: Roar roar")
    }
    func changeToAlphaMale () {
    self.isAlphaMale = true
    }
  
    func randomFact() ->String {
        var randomFact:String
        if self.isAlphaMale == true {
            randomFact = "Male lions  are easy to recognise thanks to their distinctive manes. Males with darker manes are more likely to atract females."
        }
        else {
            randomFact = "Female lionesses are the stable social unit and do not tolerate any external females"
        }
        return randomFact
    }
}


