//
//  Tiles.swift
//  Guitare-Tiles
//
//  Created by Legrand Romain on 06/03/2026.
//

import UIKit

class Tiles: UIView {

    private enum Color: Int
    {
        case red = 0
        case blue
        case yellow
        case green

        var image: UIImage {
            switch self {
            case .red:
                return UIImage(named: "redTile")!
            case .blue:
                return UIImage(named: "blueTile")!
            case .yellow:
                return UIImage(named: "yellowTile")!
            case .green:
                return UIImage(named: "greenTile")!
            }
        }
    }

    private var colorSelected: Color
    private var imgView: UIImageView

    public var speed: Double = 0.8
    public var isHit = false
    public var hasReachedBottom = false
    
    init(colorIndex: Int, frame: CGRect)
    {
       self.colorSelected = Color(rawValue: colorIndex) ?? .red
       self.imgView = UIImageView(image: self.colorSelected.image)
       super.init(frame: frame)

       self.addSubview(imgView)
       imgView.frame = self.bounds
       imgView.contentMode = .scaleAspectFit
    }

    required init?(coder: NSCoder)
    {
           fatalError("init(coder:) has not been implemented")
    }
    
    
    func Falling()
    {
            
    }

}
