//
//  LocationDetailView.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 20/03/25.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @State private var selectedTab: Int = 0
    @Environment(LocationViewModel.self) var locationViewModel
    @Environment(\.dismiss) var dismiss


    let location : Location
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color : .black.opacity(0.3),radius: 20,
                            x:0,y:10)
                VStack(alignment : .leading,spacing : 16){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }.frame(maxWidth : .infinity)
                    .padding()
              
                
             
                
            }
        }.ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(alignment: .topLeading){
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .padding(16)
                        .foregroundStyle(.black)
                        .background(.thickMaterial)
                        .clipped()
                        .shadow(radius: 4)
                        .padding()
                }
                
            }
    }
}
extension LocationDetailView{
    private var imageSection : some  View{
        TabView(selection:  $selectedTab){
            ForEach(location.imageNames,id : \.self){image  in
                
                Tab(value : location.imageNames.firstIndex(of: image)!){
                    Image(image)
                               .resizable()
                              .scaledToFill()
                              .frame(width: UIScreen.main.bounds.width)
                              .clipped()
                }
                
              
                
            }
            
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
    private var titleSection : some View{
       
            
            VStack(alignment:.leading,spacing: 8) {
                Text(location.name)
                    .font(.largeTitle)
                Text(location.cityName)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                
                
            }
           
            
        
    }
    
    private var descriptionSection : some View{
       
            
            VStack(alignment:.leading,spacing: 16) {
                Text(location.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                if let url = URL(string: location.link){
                    Link("Read more on Wikipedia",destination: url)
                        .font(.headline)
                        .tint(.blue)
                }
    
                
            }
         
            
        
    }
    
    private var mapLayer : some View{
        
        Map(position : .constant(MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) )))){
            Annotation(location.name,coordinate:location.coordinates){
                LocationMapAnnotationView()
                    .shadow(radius: 10)
                
            }
        }
        .allowsHitTesting(false)
        .aspectRatio( 1,contentMode : .fit)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
        
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environment(LocationViewModel())
}
