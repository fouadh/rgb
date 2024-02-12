//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

let defaultColor = RGBColor(red: ColorIntensity(value: 128.0), green: ColorIntensity(value: 128.0), blue: ColorIntensity(value: 128.0))

struct ContentView: View {
  @State private var rgbColor = defaultColor
  @State private var shapeColor = ContentView.toColor(rgbColor: defaultColor)

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0).fill(shapeColor)
      RGBColorSliderView(color: $rgbColor)
      Button("Set Color") {
        shapeColor = ContentView.toColor(rgbColor: rgbColor)
      }
    }
    .padding()
  }

  static func toColor(rgbColor: RGBColor) -> Color {
    return Color(red: rgbColor.red.percentage, green: rgbColor.green.percentage, blue: rgbColor.blue.percentage)
  }
}

#Preview {
  ContentView()
}
