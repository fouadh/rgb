//
//  ContentView.swift
//  RGB
//
//  Created by Fouad HAMDI on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  @State private var rgbColor = Constants.General.defaultColor
  @State private var shapeColor = ContentView.toColor(rgbColor: Constants.General.defaultColor)

  var body: some View {
    VStack {
      if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        TitleText(title: "Color Picker")
        ForegroundView(color: $shapeColor)
        RGBColorSliderView(color: $rgbColor)
        SetColorButton(rgbColor: $rgbColor, shapeColor: $shapeColor)
      } else {
        HStack {
          VStack {
            TitleText(title: "Color Picker")
            ForegroundView(color: $shapeColor).padding(.horizontal)
          }
          VStack {
            RGBColorSliderView(color: $rgbColor)
            SetColorButton(rgbColor: $rgbColor, shapeColor: $shapeColor)
          }
        }
      }
    }
    .background(Color("BackgroundColor"))
    .padding(Constants.General.padding)
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
    .padding(Constants.General.padding)
    .background(Color("ButtonColor"))
    .overlay(RoundedRectangle(cornerRadius: Constants.General.cornerRadius).strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
    .foregroundColor(.white)
    .bold()
    .cornerRadius(Constants.General.cornerRadius)
  }
}

#Preview {
  ContentView()
}

#Preview {
  ContentView().preferredColorScheme(.dark)
}
