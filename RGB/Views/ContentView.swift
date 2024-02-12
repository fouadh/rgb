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
  @State private var foregroundColor = ContentView.toColor(rgbColor: Constants.General.defaultColor)

  var body: some View {
    VStack {
      if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        PortraitView(rgbColor: $rgbColor, foregroundColor: $foregroundColor)
      } else {
        LandscapeView(rgbColor: $rgbColor, foregroundColor: $foregroundColor)
      }
    }
    .background(Color("BackgroundColor"))
    .padding(Constants.General.padding)
  }

  static func toColor(rgbColor: RGBColor) -> Color {
    return Color(red: rgbColor.red.percentage, green: rgbColor.green.percentage, blue: rgbColor.blue.percentage)
  }
}

struct PortraitView: View {
  @Binding var rgbColor: RGBColor
  @Binding var foregroundColor: Color

  var body: some View {
    TitleText(title: Constants.General.title)
    ForegroundView(color: $foregroundColor)
    RGBColorSliderView(color: $rgbColor)
    SetColorButton(rgbColor: $rgbColor, foregroundColor: $foregroundColor)
  }
}

struct LandscapeView: View {
  @Binding var rgbColor: RGBColor
  @Binding var foregroundColor: Color

  var body: some View {
    HStack {
      VStack {
        TitleText(title: Constants.General.title)
        ForegroundView(color: $foregroundColor).padding(.horizontal)
      }
      VStack {
        RGBColorSliderView(color: $rgbColor)
        SetColorButton(rgbColor: $rgbColor, foregroundColor: $foregroundColor)
      }
    }
  }
}

struct SetColorButton: View {
  @Binding var rgbColor: RGBColor
  @Binding var foregroundColor: Color

  var body: some View {
    Button("Set Color") {
      foregroundColor = ContentView.toColor(rgbColor: rgbColor)
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
