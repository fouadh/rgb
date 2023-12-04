//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

struct ColorComponent {
  var value: Double!

  init(value: Double!) {
    self.value = value
  }

  var intValue: Int {
    Int(value.rounded())
  }

  var normalizedValue: Double {
    return value / 255
  }
}

let defaultRed = ColorComponent(value: 128.0)
let defaultGreen = ColorComponent(value: 128.0)
let defaultBlue = ColorComponent(value: 128.0)
let defaultColor = Color(red: defaultRed.normalizedValue, green: defaultGreen.normalizedValue, blue: defaultBlue.normalizedValue)

struct RGBColor {
  var red = defaultRed
  var green = defaultGreen
  var blue = defaultBlue

  var value: Color {
    Color(red: red.normalizedValue, green: green.normalizedValue, blue: blue.normalizedValue)
  }
}

struct ColorComponentSlider: View {
  var label: String
  @Binding var value: ColorComponent

  var body: some View {
    Text(label)
    HStack {
      Slider(value: $value.value, in: 0...255)
      Text("\(value.intValue)")
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
      ColorComponentSlider(label: "Red", value: $rgbColor.red)
      ColorComponentSlider(label: "Green", value: $rgbColor.green)
      ColorComponentSlider(label: "Blue", value: $rgbColor.blue)
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
