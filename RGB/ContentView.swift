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

let defaultRed = ColorComponent(value: 128.0)
let defaultGreen = ColorComponent(value: 128.0)
let defaultBlue = ColorComponent(value: 128.0)
let defaultColor = Color(red: defaultRed.normalizedValue, green: defaultGreen.normalizedValue, blue: defaultBlue.normalizedValue)


struct ContentView: View {
  @State private var redComponent = defaultRed
  @State private var greenComponent = defaultGreen
  @State private var blueComponent = defaultBlue
  @State private var shapeColor = defaultColor

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0)
        .fill(shapeColor)
      ColorComponentSlider(label: "Red", value: $redComponent)
      ColorComponentSlider(label: "Green", value: $greenComponent)
      ColorComponentSlider(label: "Blue", value: $blueComponent)
      Button("Set Color") {
        shapeColor = Color(red: redComponent.normalizedValue, green: greenComponent.normalizedValue, blue: blueComponent.normalizedValue)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
