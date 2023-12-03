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

      Text("Red")
      HStack {
        Slider(value: $redComponent.value, in: 0...255)
        let roundedValue = Int(redComponent.value.rounded())
        Text("\(roundedValue)")
      }

      Text("Green")
      HStack {
        Slider(value: $greenComponent.value, in: 0...255)
        let roundedValue = Int(greenComponent.value.rounded())
        Text("\(roundedValue)")
      }

      Text("Blue")
      HStack {
        Slider(value: $blueComponent.value, in: 0...255)
        let roundedValue = Int(blueComponent.value.rounded())
        Text("\(roundedValue)")
      }

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
