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
  @State private var shapeColor = defaultColor.value

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0).fill(shapeColor)
      RGBColorSelector(color: $rgbColor)
      Button("Set Color") {
        shapeColor = rgbColor.value
      }
    }
    .padding()
  }
}

struct RGBColor {
  var red: ColorIntensity
  var green: ColorIntensity
  var blue: ColorIntensity

  init(red: ColorIntensity, green: ColorIntensity, blue: ColorIntensity) {
    self.red = red
    self.green = green
    self.blue = blue
  }

  var value: Color {
    Color(red: red.percentage, green: green.percentage, blue: blue.percentage)
  }
}

struct RGBColorSelector: View {
  @Binding var color: RGBColor

  var body: some View {
    ColorIntensitySlider(label: "Red", intensity: $color.red)
    ColorIntensitySlider(label: "Green", intensity: $color.green)
    ColorIntensitySlider(label: "Blue", intensity: $color.blue)
  }
}

#Preview {
  ContentView()
}
