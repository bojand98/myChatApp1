
import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    func updateCell(message : Message){
       senderNameLabel.text = message.senderName
        messageLabel.text = message.message
    }
}
