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

// I put all of the following code below this section to respect the exercise criteria to keep all in the same file but I would probably move those snippets in their own files.
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
