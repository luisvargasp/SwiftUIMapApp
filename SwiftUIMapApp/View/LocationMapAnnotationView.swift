//
//  LocationMapAnnotationView.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 20/03/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width:30,height:30)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 36))
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(accentColor)
                .frame(width:10,height:10)
                .rotationEffect(.degrees(180))
                .offset(y:-3)
                .padding(.bottom,40)
                
        }
        
    }
}

#Preview {
    LocationMapAnnotationView()
}
