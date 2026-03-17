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
                return UIImage(named: "RedTiles")!
            case .blue:
                return UIImage(named: "BlueTiles")!
            case .yellow:
                return UIImage(named: "YellowTiles")!
            case .green:
                return UIImage(named: "GreenTiles")!
            }
        }
        var xPosition: CGFloat
        {
            switch self
            {
                case .red:
                    return 16
                case .blue:
                    return 116
                case .yellow:
                    return 210
                case .green:
                    return 307
            }
        }
    }
    
    private var colorSelected: Color
    
    public var imgView: UIImageView
    
    public var speed: Double = 1.2
    public var isHit = false
    public var Interactable = false
    public var colorIndex : Int!
    public var value: Int = 1
    
    init(colorIndex: Int, frame: CGRect)
    {
        self.colorIndex = colorIndex
        self.colorSelected = Color(rawValue: colorIndex) ?? .red
        self.imgView = UIImageView(image: self.colorSelected.image)
        super.init(frame: frame)

        self.addSubview(imgView)
        imgView.frame = self.bounds
        imgView.contentMode = .scaleAspectFit
        
        self.frame.origin.x = colorSelected.xPosition //corrige la position sur l'axe X de la brique en fonction de la couleur

    }

    required init?(coder: NSCoder)
    {
           fatalError("init(coder:) has not been implemented")
    }
    
    
    func FallingUpdate()
    {
        self.frame.origin.y += speed
    }
    
   

}
