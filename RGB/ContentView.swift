//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

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

let defaultRedIntensity = ColorIntensity(value: 128.0)
let defaultGreenIntensity = ColorIntensity(value: 128.0)
let defaultBlueIntensity = ColorIntensity(value: 128.0)
let defaultColor = Color(red: defaultRedIntensity.percentage, green: defaultGreenIntensity.percentage, blue: defaultBlueIntensity.percentage)

struct RGBColor {
  var red = defaultRedIntensity
  var green = defaultGreenIntensity
  var blue = defaultBlueIntensity

  var value: Color {
    Color(red: red.percentage, green: green.percentage, blue: blue.percentage)
  }
}

struct ColorIntensitySlider: View {
  var label: String
  @Binding var intensity: ColorIntensity

  var body: some View {
    Text(label)
    HStack {
      Slider(value: $intensity.value, in: 0...255)
      Text("\(intensity.rounded)")
    }
  }
}

struct ContentView: View {
  @State private var rgbColor = RGBColor()
  @State private var shapeColor = defaultColor

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0)
        .fill(shapeColor)
      ColorIntensitySlider(label: "Red", intensity: $rgbColor.red)
      ColorIntensitySlider(label: "Green", intensity: $rgbColor.green)
      ColorIntensitySlider(label: "Blue", intensity: $rgbColor.blue)
      Button("Set Color") {
        shapeColor = rgbColor.value
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
