//
//  TimerView.swift
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

import UIKit

class TimerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var saveButton: ActionButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentTimerValueLabel: UILabel!

    @objc private(set) var time: Float = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initXib()
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initXib()
        self.setup()
    }

    private func initXib() {
        Bundle.main.loadNibNamed("Timer", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    private func setup() {
        self.contentView.layer.cornerRadius = 40;
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 0);
        self.contentView.layer.shadowOpacity = 0.25;
        self.contentView.layer.shadowRadius = 8;
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        self.time = self.slider.value
        self.isHidden = true
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        self.currentTimerValueLabel.text = String(format: "%.2f s", self.slider.value)
    }
}
