import Foundation

class Customer {
    var name:String
    var rentals:[Rental]
    var rewardPoints:Int = 0
    
    init(name:String)
    {
        self.name=name
        rentals=[]
    }
    
    func addRental(rental:Rental)
    {
        rentals.append(rental)
    }
    
    func getTotalAmount() -> Double {
        var totalAmount:Double = 0.0
        for rental in self.rentals {
            totalAmount += rental.getAmount()
        }
        return totalAmount
    }
    
    func getAwardPoints() -> Int{
        
        for rental in rentals {
            rewardPoints += rental.getReward()
            print("the awardPoints \(rewardPoints)")
        }
        return rewardPoints
    }
    
    func statement(type: StatmentType)->String
    {
        switch type {
        case .text:
            var result="Rental Record for:\(self.name)\n"
            for each in rentals
            {
                result.append("\t\"\(each.vehicle.getVehicleData())\"\tLE \(each.getAmount().formatted2f())\n")
            }
            result.append("Amount owed is LE \(self.getTotalAmount().formatted2f())\n")
            result.append("You earned: \(getAwardPoints()) new Reward Points\n\n")
            
            return result
            
        case .json:
            let jsonArray: NSMutableDictionary = NSMutableDictionary()
            var rentalsJson : [AnyObject] = []
            for each in rentals
            {
                let jsonObject: NSMutableDictionary = NSMutableDictionary()
                jsonObject.setValue("\(each.vehicle.vehicleColor)", forKey: "color")
                jsonObject.setValue("\(each.vehicle.vehicleModel)", forKey: "model")
                jsonObject.setValue(each.vehicle.vehicleYear, forKey: "year")
                jsonObject.setValue( getTotalAmount() , forKey: "amount")
                rentalsJson.append(jsonObject)
                print(jsonObject)
            }
            
            jsonArray.setValue(getAwardPoints(), forKey: "rewardPoints")
            jsonArray.setValue(name, forKey: "name")
            jsonArray.setValue(rentalsJson, forKey: "rentals")
            jsonArray.setValue(getTotalAmount(), forKey: "amountowned")
            let jsonData: NSData
            var jsonString: String=""
            do {
                
                jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted ) as NSData
                jsonString = NSString(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
                
            } catch _ {
                print ("JSON Failure")
            }
            return jsonString
        }
        
    }
}

