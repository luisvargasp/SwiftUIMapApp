//
//  LocationListView.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 18/03/25.
//

import SwiftUI

struct LocationListView: View {
    @Environment(LocationViewModel.self) var viewModel
    
    var body: some View {
        List{
            ForEach(viewModel.locations) { location in
                
                Button{
                    viewModel.showLocation(location: location)
                    
                } label: {
                    listRowView(location: location)
                                       .padding(.vertical,4)
                                       .listRowBackground(Color.clear)
                }
               
            }
        }
        .listStyle(.plain)
    }
}

extension LocationListView {
    
    private func listRowView(location : Location) -> some View{
        HStack  {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45,height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
              
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth : .infinity,alignment: .leading)
           // .background(.red)
            .padding(.leading , 16)
        }
    }
    
}

#Preview {
    LocationListView()
        .environment(LocationViewModel())
}
