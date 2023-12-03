//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

let defaultRed = 50.0
let defaultGreen = 50.0
let defaultBlue = 50.0
let defaultColor = Color(red: defaultRed / 255, green: defaultGreen / 255, blue: defaultBlue / 255)

struct ColorComponent {
  var value: Double!

  init(value: Double!) {
    self.value = value
  }

  var valueAsInt: Int {
    Int(value.rounded())
  }
}

struct ColorComponentView: View {
  var label: String
  @Binding var value: ColorComponent

  var body: some View {
    Text(label)
    HStack {
      Slider(value: $value.value, in: 0...255)
      Text("\(value.valueAsInt)")
    }
  }
}

struct ContentView: View {
  @State private var redComponent = ColorComponent(value: defaultRed)
  @State private var greenComponent = ColorComponent(value: defaultGreen)
  @State private var blueComponent = ColorComponent(value: defaultBlue)
  @State private var shapeColor = defaultColor

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0)
        .fill(shapeColor)

      ColorComponentView(label: "Red", value: $redComponent)
      ColorComponentView(label: "Green", value: $greenComponent)
      ColorComponentView(label: "Blue", value: $blueComponent)

      Button("Set Color") {
        shapeColor = Color(red: redComponent.value/255, green: greenComponent.value/255, blue: blueComponent.value/255)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
