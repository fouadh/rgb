//
//  Constants.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import Foundation

enum Constants {
  enum General {
    public static let defaultColor = RGBColor(red: ColorIntensity(value: 0), green: ColorIntensity(value: 0), blue: ColorIntensity(value: 0))
    public static let cornerRadius = CGFloat(20)
    public static let strokeWidth = CGFloat(2)
    public static let borderWidth = CGFloat(8)
    public static let padding = CGFloat(20)
    public static let title = "Color Picker"
  }
}
