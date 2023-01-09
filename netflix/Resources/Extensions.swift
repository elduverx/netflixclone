//
//  Extensions.swift
//  netflix
//
//  Created by Duver on 4/1/23.
//

import Foundation

// Capitalizying the first letter function
extension String{
  func capitalizeFirstLetter() -> String {
    return self.prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}
