
class Rental {
    
    var vehicle:Vehicle
    var kilometersRented:Int
    var daysRented:Int
    var lateFee:Bool
    var thisAmount:Double=0.0
    var rewardPoints = 1
    
    init (vehicle:Vehicle,mileage:Int,daysRented:Int,lateFee:Bool)
    {
        self.vehicle=vehicle
        self.kilometersRented=mileage
        self.daysRented=daysRented
        self.lateFee=lateFee
    }
    
    func getAmount() -> Double {
       return 0.0
    }
    
    func getReward() -> Int {
        rewardPoints=rewardPoints+1
        return rewardPoints
    }
}




