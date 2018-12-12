import UIKit

class Message {
    var message : String
    var senderName : String = "Bojan"
    
    init( message:String) {
        self.message = message
    }
    init(data:[String:Any]) {
        if let name = data["name"] as? String {
            senderName = name
        }
        else{
            senderName = "invalid sender"
        }
        if let poraka = data ["msg"] as? String
        {
            message = poraka
        }
        else{
            message = "invalid message"
        }
    }
    func getData() -> [String:Any]{
        return ["msg":message,"name":senderName]
    }

}
