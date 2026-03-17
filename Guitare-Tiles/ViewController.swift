//
//  ViewController.swift
//  Guitare-Tiles
//
//  Created by Legrand Romain on 06/03/2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreText: UILabel!
    
    var score: Int = 0
    var multiplyer: Int = 1
    var displayLink: CADisplayLink?
    var lanes: [[Tiles]] = [[], [], [], []]
    var fallingTiles : [Tiles] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0...3
        {
            let tile = Tiles(colorIndex: i, frame: CGRect(x: 0, y: 0, width: 70, height: 70))
            fallingTiles.append(tile)
            view.addSubview(tile)
        }
        
        SpwanTile(index: 0)
        displayLink = CADisplayLink(target: self, selector: #selector(gameLoop))
        displayLink?.add(to: .main, forMode: .default)
        scoreText.text = score.codingKey.stringValue
    }
    
    @objc func gameLoop() {
        for i in (0..<fallingTiles.count).reversed()
        {
            let tile = fallingTiles[i]
            if tile.frame.origin.y + tile.frame.height >= 670  && !tile.Interactable
            {
                tile.Interactable = true
            }
            else if tile.frame.origin.y >= 670 && tile.Interactable
            {
                ChangeStateTile(tile: tile)
            }
            if tile.frame.origin.y >= view.bounds.height
            {
                ReachBottom(tile: tile,index: i)
                continue
            }
            tile.FallingUpdate()
        }
    }
    
    func ChangeStateTile(tile: Tiles)
    {
        tile.Interactable = false
        tile.imgView.alpha = 0.5
        print(tile.frame.origin.y)
    }
    
    func ReachBottom(tile: Tiles, index: Int)
    {
        fallingTiles.remove(at: index)
        lanes[tile.colorIndex].append(tile)
        tile.frame.origin.y = -100
        tile.imgView.alpha = 1

        print(lanes)
    }
    
    func UpdateScore(value: Int)
    {
        let newValue = value * multiplyer
        score += newValue
        scoreText.text = score.codingKey.stringValue
    }
    
    ///Fait spwan une brique dans le jeu.
    ///index : utilisé pour choisir une couleur en fonction de l'enum Color
    ///IMPORTANT : a utiliser que si on veux rajouter des briques, en principe utilisable que à l'init du jeu
    func SpwanTile(index: Int)
    {
        let tile = Tiles(colorIndex: index, frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        fallingTiles.append(tile) //à retiré quand les test seront fini
        view.addSubview(tile)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let position = touch.location(in: view)
        for tile in fallingTiles {
            if tile.frame.contains(position) && tile.Interactable {
                ChangeStateTile(tile: tile)
                print("Position du toucher : \(position) sur Tile instance: \(type(of: tile))")
                UpdateScore(value: tile.value)
            }
        }
    }

}

