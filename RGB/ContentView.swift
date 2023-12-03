//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var red = 50.0

  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Color Picker").font(.title)
      RoundedRectangle(cornerRadius: 0)
        .fill(Color(red: red/255, green: 50/255, blue: 50/255))
      Text("Red")
      HStack {
        Slider(value: $red, in: 0...255)
        let roundedValue = Int(red.rounded())
        Text("\(roundedValue)")
      }

      Text("Green")
      HStack {
        Slider(value: .constant(50), in: 0...255)
        Text("50")
      }
      Text("Blue")
      HStack {
        Slider(value: .constant(50), in: 0...255)
        Text("50")
      }
      Button("Set Color") {

      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
