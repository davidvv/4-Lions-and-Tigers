//
//  Tiger.swift
//  Lions and Tigers
//
//  Created by David Vences Vaquero on 27/2/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("Tiger: chuff chuff")
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int){
        for var chuff = 0; chuff < numberOfTimes; chuff++ {
            self.chuff()
            }
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int, isLoud: Bool){//aunque esta función se llama igual que la anterior, es una distinta porque tiene distintos parámetros
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud{
                chuff()
            }else{
                println("Tiger: purr purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge: Int) ->Int {
        let newAge = regularAge*3
        return newAge
        
    }
    
    func randomFact() -> String{
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0{
            randomFact = "Tigers are the biggest animals in the cat family"
        }
        else if randomNumber == 1{
            randomFact = "Tigers can be up to 3.3 meters long"
        }
        else {
            randomFact = "A group of tigers is called an 'ambush' or a 'streak'"
        }
                
        return randomFact
    }
    
    
    
    
}

