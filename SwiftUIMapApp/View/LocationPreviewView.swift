//
//  LocationPreviewView.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 19/03/25.
//

import SwiftUI

struct LocationPreviewView: View {
    let location : Location
    let onNextPressed : () -> Void
    let learMoreAction : () -> Void
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                
                imageSection
                titleSection
                
            }
            
            VStack(spacing: 8.0){
                Button {
                    learMoreAction()
                    
                } label: {
                    Text("Learn more")
                        .font(.headline)
                        .frame(width: 125,height: 35)
                }.buttonStyle(.borderedProminent)
                Button {
                    onNextPressed()

                    
                } label: {
                    Text("Next")
                        .font(.headline)
                        .frame(width: 125,height: 35)
                }.buttonStyle(.bordered)

            }
        }.padding(20)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
            ).clipShape(.rect(cornerRadius: 10))
          
        
            
        
    }
}

extension LocationPreviewView {
    private var imageSection : some View {
        
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .clipShape(.buttonBorder)
            }
            
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading,spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
               
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
    }
}
#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!){
        
    } learMoreAction: {}
}
