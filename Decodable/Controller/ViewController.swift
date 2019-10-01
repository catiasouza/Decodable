//
//  ViewController.swift
//  Decodable
//
//  Created by Catia Miranda de Souza on 30/09/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getViagens()
    }

    func getViagens(){
      
        guard let json = ViagemApi().getViagens() else{ return}
        guard let jsonData = Viagem.converteListaParaData(json) else{return}
       
        guard let listaViagem = Viagem.decodificaViagem(jsonData)else{return}
        
        for viagem in listaViagem {
            print(viagem.titulo)
        }
        
    }
}

