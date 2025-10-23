//
//  ViewController.swift
//  lab5-Dinara
//
//  Created by Zhuldyz Tagaibek on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var letterName: UILabel!
    @IBOutlet private var letterImage: UIImageView!
    
    let letters: [String: UIImage] = ["The Weekend": UIImage(named: "aplay")!, "Drake": UIImage(named: "bplay")!, "Travis Scott": UIImage(named: "cplay")!, "Metro Boomin": UIImage(named: "dplay")!, "Kendrick Lamar": UIImage(named: "eplay")!, "Chese Atlantic": UIImage(named: "fplay")!, "Kanye West": UIImage(named: "gplay")!, "Future": UIImage(named: "hplay")!,]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func rollLetter(_ sender: UIButton){
        let randomLetter = letters.randomElement()
        letterName.text = randomLetter?.key
        letterImage.image = randomLetter?.value
    }


}

