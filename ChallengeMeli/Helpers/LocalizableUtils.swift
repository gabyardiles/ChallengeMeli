//
//  LocalizableUtils.swift
//  ChallengeMeli
//
//  Created by Graciela Gabriela Ardiles on 16/12/2020.
//

import Foundation

class LocalizableUtils {
    
    class func string(withKey key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
}
