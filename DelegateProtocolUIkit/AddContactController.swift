//
//  AddContactController.swift
//  DelegateProtocolUIkit
//
//  Created by Ramar Parham on 7/31/23.
//

import UIKit

protocol AddContactDelegate {
    func addContact(contact: Contact)
}

class AddContactController: UIViewController {
    
    var delegate: AddContactDelegate?
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "full Name"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .red
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - Selectors
    
    @objc func handleDone() {
        
        guard let fullname = textField.text, textField.hasText else {
            print("Handle error here")
            return
        }
        
        let contact = Contact(fullname: fullname)
        print(contact.fullname)
        
        delegate?.addContact(contact: contact)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }


}

