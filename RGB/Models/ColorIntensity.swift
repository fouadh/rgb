//
//  ColorIntensity.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import Foundation

struct ColorIntensity {
  // intensity value: a number between 0 and 255
  var value: Double!

  init(value: Double!) {
    self.value = value
  }

  var rounded: Int {
    Int(value.rounded())
  }

  var percentage: Double {
    return value / 255
  }
}
