//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 18/03/25.
//
import Foundation
import MapKit
import SwiftUI


@Observable class LocationViewModel  {
    var locations : [Location]
    var mapLocation : Location{
        didSet {
            updateMapPosition(location: mapLocation)
        }
    }
    var mapPosition : MapCameraPosition
    = MapCameraPosition.region( MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of locations
    
    var showingList : Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapPosition(location: mapLocation)
        
    }
    private func updateMapPosition(location : Location) {
        withAnimation(.easeInOut){
            
            self.mapPosition = MapCameraPosition.region(MKCoordinateRegion(center : location.coordinates,span: mapSpan))
        }

   }
    
     func toggleLocationList(){
        withAnimation(.easeInOut){
            self.showingList.toggle()
        }
    }
    func showLocation(location : Location ){
        withAnimation(.easeInOut){
            self.mapLocation = location
            showingList = false
        }
       
        
    }
    func nextButtonPressed(){
        guard let currentIndex = locations.firstIndex(of: mapLocation) else { return }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            showLocation(location: locations.first!)
            
            return
            
        }
        
        
        showLocation(location: locations[nextIndex])
    }
   
    
}
