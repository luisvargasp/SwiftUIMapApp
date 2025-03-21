//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 18/03/25.
//

import SwiftUI
import MapKit


struct LocationView: View {
    
    @Environment(LocationViewModel.self)  var vm
    
    
    var body: some View {
        @Bindable var vmb = vm
        ZStack{
          
            Map(position: $vmb.mapPosition){
                ForEach(vm.locations){location in
                    Annotation(location.name,coordinate:location.coordinates){
                        LocationMapAnnotationView()
                            .scaleEffect(vmb.mapLocation == location ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture { 
                                vm.showLocation(location: location)
                            }
                    }
                }
            }
            
            .ignoresSafeArea()
            
            VStack(spacing : 0){
                
                header.padding()
                
                Spacer()
                ZStack{
                   
                    LocationPreviewView(location: vm.mapLocation){
                        vm.nextButtonPressed()
                    } learMoreAction:{
                        vm.showDetail()
                    }
                            .shadow(color : .black.opacity(0.3) ,radius: 20)
                            .padding()
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        
                    
                }
            }

        }
        .sheet(isPresented: $vmb.showLocationDetail , content: {
            LocationDetailView(location: vm.mapLocation)
        })
    }
           
}

extension LocationView {
    private var header : some View {
        VStack(spacing : 0){
            VStack {
                Button (action : {
                    vm.toggleLocationList( )
                    
                },label: {
                    Text(vm.mapLocation.name + " , " + vm.mapLocation.cityName)
                                       .font(.title2)
                                       .fontWeight(.black)
                                       .foregroundStyle(.primary)
                                       .frame(height : 55)
                                       .frame(maxWidth : .infinity)
                                       //.background(.red)
                                       .animation(.none,value : vm.mapLocation)
                                       .overlay(alignment: .leading) {
                                           Image(systemName: "arrow.down")
                                               .font(.headline)
                                               .foregroundStyle(.primary)
                                               .padding()
                                               .rotationEffect(
                                                Angle(degrees: vm.showingList ? 180     : 0)
                                               )
                                           
                                       }
                })
               
                if(vm.showingList){
                    LocationListView()
                    
                }
               
            }.background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 20,
                        x:0,y:15)
        }
        
    }
}
#Preview {
    LocationView()
        .environment(LocationViewModel())
}
