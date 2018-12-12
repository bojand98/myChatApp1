import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tabela: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBAction func sendButtonPressed(_ sender: Any) {
//        if let message = Message(message: messageTextField.text){
//            ref.childByAutoId().setValue(message.getData())
//        }
        if let msg = messageTextField.text{
           var message = Message(message: messageTextField.text!)
            ref.childByAutoId().setValue(message.getData())
        }
       
    }
    
    var messageArr : [Message] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        
        if let myCell = cell as? MessageTableViewCell{
            myCell.updateCell(message: messageArr[indexPath.row])
            return myCell
        }
        return UITableViewCell()
    }
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let message = Message(message: "poraka")
        ref = Database.database().reference()
       // ref.childByAutoId().setValue(message.getData())
        
        ref.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? [String:Any]{
                self.messageArr.append(Message(data: data))
                self.tabela.reloadData()
                self.tabela.scrollToBottom()
            }
        }
        
    }


}
extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        let rows = self.numberOfRows(inSection: sections - 1)
        if (rows > 0){
            self.scrollToRow(at: NSIndexPath(row: rows - 1, section: sections - 1) as IndexPath, at: .bottom, animated: true)
        }
    }
}

