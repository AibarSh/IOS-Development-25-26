//
//  BooksViewController.swift
//  Navigation
//
//  Created by Macbook Air on 20.11.2025.
//


class BooksViewController: ItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = AppData.books
        title = "Books"
    }
}
