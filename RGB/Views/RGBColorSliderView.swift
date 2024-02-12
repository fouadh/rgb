//
//  ColorSliderView.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import SwiftUI

struct RGBColorSliderView: View {
  @Binding var color: RGBColor

  var body: some View {
    ColorIntensitySlider(label: "Red", color: Color.red, intensity: $color.red)
    ColorIntensitySlider(label: "Green", color: Color.green, intensity: $color.green)
    ColorIntensitySlider(label: "Blue", color: Color.blue, intensity: $color.blue)
  }
}

struct ColorIntensitySlider: View {
  var label: String
  var color: Color
  @Binding var intensity: ColorIntensity

  var body: some View {
    ColorText(label: label)
    HStack {
      Slider(value: $intensity.value, in: 0...255)
        .accentColor(color)
      IntensityText(value: $intensity)
    }
  }
}

#Preview {
  RGBColorSliderView(color: .constant(RGBColor(red: ColorIntensity(value: 100.123), green: ColorIntensity(value:150.456), blue: ColorIntensity(value:50.123))))
}

#Preview {
  RGBColorSliderView(color: .constant(RGBColor(red: ColorIntensity(value: 100.123), green: ColorIntensity(value:150.456), blue: ColorIntensity(value:50.123)))).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
