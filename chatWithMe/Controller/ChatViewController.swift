//
//  ChatViewController.swift
//  chatWithMe
//
//  Created by Rishav chandra on 24/02/24.
//

import UIKit
import Firebase

class ChatViewController: UIViewController{
    
    @IBOutlet weak var msgTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    loadMessages()
        
    }
    func loadMessages(){
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot , error in
            self.messages = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            }else {
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String , let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                   self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func sendMsg(_ sender: UIButton) {
        if let messageBody = msgTextField.text , let messageSender = Auth.auth().currentUser?.email {
                    db.collection(K.FStore.collectionName).addDocument(data: [
                        K.FStore.senderField: messageSender,
                        K.FStore.bodyField: messageBody,
                        K.FStore.dateField: Date().timeIntervalSince1970
                    ]) { (error) in
                        if let e = error {
                            print("There was an issue saving data to firestore, \(e)")
                        } else {
                            print("Successfully saved data.")
                            DispatchQueue.main.async {
                                self.msgTextField.text = ""
                            }
                        }
                    }
                }
          }
    
    
    @IBAction func logOutpressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    }
    
    extension ChatViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let message = messages[indexPath.row]
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
            cell.msg.text = message.body
    
            //This is a message from the current user.
            if message.sender == Auth.auth().currentUser?.email {
                cell.leftImage.isHidden = true
                cell.rightImage.isHidden = false
                cell.cellView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                cell.msg.textColor = UIColor(named: K.BrandColors.purple)
            }
            //This is a message from another sender.
            else {
                cell.leftImage.isHidden = false
                cell.rightImage.isHidden = true
                cell.cellView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                cell.msg.textColor = UIColor(named: K.BrandColors.purple)
            }
    
    
    
            return cell
        }
    
    
    }

