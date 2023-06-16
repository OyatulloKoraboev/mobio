//
//  Resources.swift
//  mobio
//
//  Created by Oyatullo Koraboev on 16/06/23.
//

import Foundation
import SwiftUI

enum Resources {
    
    enum Colors {
        static var active = Color("#437BFE")
        
//        #E41B4D 100
//        #EE3D69 100
    }
    
    enum Images {
        static var logo = UIImage(named: "logo") ?? UIImage()
        static var whitelogo = UIImage(named: "whitelogo") ?? UIImage()
    }
    
    enum Strings {
        static var someString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    }
    
    enum Fonts {
        
        static func Montserrat(size:CGFloat) -> UIFont{
            UIFont(name:"Montserrat-VariableFont_wght",size: size) ?? UIFont()
        }
        
    }
}



