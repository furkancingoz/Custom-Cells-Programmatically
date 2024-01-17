//
//  ViewController.swift
//  Custom Cells Programmatically
//
//  Created by Furkan Cingöz on 17.01.2024.
//
import SwiftUI
import UIKit

class ViewController: UIViewController {


  //MARK: - Variables
  private let images : [UIImage] = [
    UIImage(named: "1")!,
    UIImage(named: "2")!,
    UIImage(named: "3")!,
    UIImage(named: "4")!,
    UIImage(named: "5")!,
    UIImage(named: "6")!,
    UIImage(named: "7")!,
    UIImage(named: "8")!,
    UIImage(named: "9")!,
    UIImage(named: "10")!,
    UIImage(named: "11")!,
    UIImage(named: "12")!,
    UIImage(named: "13")!,
    UIImage(named: "14")!,
    UIImage(named: "15")!,
  ]

  private let names = [
    "App Clips",
    "Car Play",
    "Catalyst",
    "Class Kit",
    "Cloud Kit",
    "Core ML",
    "Healt Kit",
    "Metal",
    "SF Symbols",
    "Siri",
    "Sprite",
    "Swift UI",
    "Test Flight",
    "Wallet",
    "Widget",
  ]


  //MARK: - UI Components

  private let tableView : UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .systemBackground
    tableView.allowsSelection = true
    tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)


    return tableView

  }()


  //MARK: - Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }


  //MARK: - Setup UI
  private func setupUI() {
    self.view.backgroundColor = .systemBlue
    self.view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

    ])
  }


}


extension ViewController : UITableViewDelegate , UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.images.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
      fatalError("The TableView coult not dequeue a CustomCell in ViewController")
    }

    let image = self.images[indexPath.row]
    let name = self.names[indexPath.row]
    cell.configure(with: image, and: name)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 112.5
  }
}

//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//    printContent("debug print \(indexPath.row)")
//  }

#Preview {
  ViewControllerViewRepresentable()
}
struct ViewControllerViewRepresentable: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> ViewController {
    // PlayerDetailVC'nin örneğini oluştur.
    return ViewController()
  }

  func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    // Bu fonksiyon, view controller'ı güncellemek için kullanılır.
  }
}
