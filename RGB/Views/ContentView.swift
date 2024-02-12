//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

let defaultColor = RGBColor(red: ColorIntensity(value: 0), green: ColorIntensity(value: 0), blue: ColorIntensity(value: 0))

struct ContentView: View {
  @State private var rgbColor = defaultColor
  @State private var shapeColor = ContentView.toColor(rgbColor: defaultColor)

  var body: some View {
    VStack {
      TitleText(title: "Color Picker")
      ForegroundView(color: $shapeColor)
      RGBColorSliderView(color: $rgbColor)
      SetColorButton(rgbColor: $rgbColor, shapeColor: $shapeColor)
    }
    .background(Color("BackgroundColor"))
    .padding(20)
  }

  static func toColor(rgbColor: RGBColor) -> Color {
    return Color(red: rgbColor.red.percentage, green: rgbColor.green.percentage, blue: rgbColor.blue.percentage)
  }
}

struct SetColorButton: View {
  @Binding var rgbColor: RGBColor
  @Binding var shapeColor: Color

  var body: some View {
    Button("Set Color") {
      shapeColor = ContentView.toColor(rgbColor: rgbColor)
    }
  }
}

#Preview {
  ContentView()
}

#Preview {
  ContentView().preferredColorScheme(.dark)
}
