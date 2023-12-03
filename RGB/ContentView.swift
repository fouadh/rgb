//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

let defaultRed = 50.0
let defaultGreen = 50.0
let defaultColor = Color(red: defaultRed / 255, green: defaultGreen / 255, blue: 1.0)

struct ContentView: View {
  @State private var red = defaultRed
  @State private var green = defaultGreen
  @State private var shapeColor = defaultColor

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0)
        .fill(shapeColor)
      Text("Red")
      HStack {
        Slider(value: $red, in: 0...255)
        let roundedValue = Int(red.rounded())
        Text("\(roundedValue)")
      }

      Text("Green")
      HStack {
        Slider(value: $green, in: 0...255)
        let roundedValue = Int(green.rounded())
        Text("\(roundedValue)")
      }
      Text("Blue")
      HStack {
        Slider(value: .constant(50), in: 0...255)
        Text("50")
      }
      Button("Set Color") {
        shapeColor = Color(red: red/255, green: green/255, blue: 50.0/255)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
