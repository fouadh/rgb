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
    ColorIntensitySlider(label: "Red", intensity: $color.red)
    ColorIntensitySlider(label: "Green", intensity: $color.green)
    ColorIntensitySlider(label: "Blue", intensity: $color.blue)
  }
}

struct ColorIntensitySlider: View {
  var label: String
  @Binding var intensity: ColorIntensity

  var body: some View {
    ColorText(label: label)
    HStack {
      Slider(value: $intensity.value, in: 0...255)
      IntensityText(value: $intensity)
    }
  }
}

#Preview {
  RGBColorSliderView(color: .constant(RGBColor(red: ColorIntensity(value: 100.123), green: ColorIntensity(value:150.456), blue: ColorIntensity(value:50.123))))
}
