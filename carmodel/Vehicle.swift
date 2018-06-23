class Vehicle {
    
    var vehicleColor : String
    var vehicleYear : Int
    var vehicleModel : String
    
    init(color: String , year: Int , model: String) {
        vehicleColor=color
        vehicleYear=year
        vehicleModel=model
    }
    
    func getVehicleData() -> String {
        return self.vehicleColor+" "+self.vehicleModel+" \(self.vehicleYear)"
    }
}

