//
//  ContactsController.swift
//  DelegateProtocolUIkit
//
//  Created by Ramar Parham on 7/31/23.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Contact {
    var fullname: String
}

class ContactsController: UITableViewController {
    
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contacts"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        view.backgroundColor = .blue
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - Selectors
    
    @objc func handleAddContact() {
        
        let controller = AddContactController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullname
        return cell
    }

}

extension ContactsController: AddContactDelegate {
    
    func addContact(contact: Contact) {
        self.dismiss(animated: true)
        self.contacts.append(contact)
        self.tableView.reloadData()
    }
}

