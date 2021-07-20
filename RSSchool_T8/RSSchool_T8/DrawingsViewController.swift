//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

import UIKit

class DrawingsViewController: UIViewController {

    @IBOutlet weak var planetButton: ActionButton!
    @IBOutlet weak var headButton: ActionButton!
    @IBOutlet weak var treeButton: ActionButton!
    @IBOutlet weak var landscapeButton: ActionButton!

    @objc var currentShape: Shape = .head
    @objc var shapeSelected: (Shape) -> Void = {_ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.planetButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.headButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.treeButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.landscapeButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)

        self.planetButton.tag = Shape.planet.rawValue
        self.headButton.tag = Shape.head.rawValue
        self.treeButton.tag = Shape.tree.rawValue
        self.landscapeButton.tag = Shape.landscape.rawValue

        changeSelection(newShape: self.currentShape)
    }

    @objc func buttonTapped(sender: ActionButton) {
        let newShape = Shape.init(rawValue: sender.tag)!
        shapeSelected(newShape)
        changeSelection(newShape: newShape)
    }

    private func changeSelection(newShape: Shape) {
        switch self.currentShape {
        case .planet:
            self.planetButton.nowSelected = false
        case .head:
            self.headButton.nowSelected = false
        case .tree:
            self.treeButton.nowSelected = false
        case .landscape:
            self.landscapeButton.nowSelected = false
        }
        self.currentShape = newShape
        switch self.currentShape {
        case .planet:
            self.planetButton.nowSelected = true
        case .head:
            self.headButton.nowSelected = true
        case .tree:
            self.treeButton.nowSelected = true
        case .landscape:
            self.landscapeButton.nowSelected = true
        }
    }
}
