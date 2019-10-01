//
//  Viagem.swift
//  Decodable
//
//  Created by Catia Miranda de Souza on 01/10/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import Foundation

class Viagem : NSObject,  Decodable{
    
    enum CodingKeys: String, CodingKey {
        case id, titulo, quantidadeDias = "quantidade_de_dias",preco, localizacao
    }
    
    //ATRIBUTOS
    let id: Int
    let titulo: String
    let quantidadeDias: Int
    let preco: String
    let localizacao: String
    
    //INIT METODO CONSTRUTOR
    init(_ id: Int, _ titulo: String, _ quantidadeDias: Int, _ preco: String, _ localizacao: String) {
        
        self.id = id
        self.titulo = titulo
        self.quantidadeDias = quantidadeDias
        self.preco = preco
        self.localizacao = localizacao
        
    }
    class func converteListaParaData(_ json:[[String: Any]]) -> Data?{
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    
    }
    class func decodificaViagem(_ jsonData: Data) -> [Viagem]? {
        do{
             return try JSONDecoder().decode([Viagem].self, from: jsonData)
            
        }catch{
            print(error.localizedDescription)
            return nil
        }
       
    }
//    //PASSAR PARAMETRO VAZIO
//    convenience init(){
//        self.init(0,"",0,"","")
//    }
//    //DESERIALIZACAO - METODOS
//    func desserializa(_ json:[[String: Any]]) -> [Viagem]{
//
//        //CRIAR A LISTA
//        var listaViagem: [Viagem] = []
//
//        for viagem in json {
//            //CONVERTENDO O ID QUE ESTA COMO PCIONAL PARA INT
//            guard let id = viagem["id"] as? Int else{
//                print("Erro ao converter id para int")
//                return listaViagem
//            }
//            guard let titulo =  viagem["titulo"] as? String else {
//                print("Erro ao converter titulo  para string")
//                return listaViagem
//            }
//            guard let quantidadeDias = viagem["quantidade_de_dias"] as? Int else{
//                print("Erro ao converter quantidade de dias  para int")
//                               return listaViagem
//            }
//            guard let preco = viagem["preco"] as? String else{
//                print("Erro ao converter preco  para string")
//                return listaViagem
//
//            }
//            guard let localizacao = viagem[NSString(string: "LOCALIZACAO").lowercased] as? String else {
//                print("Erro ao converter localizacao para string")
//                return listaViagem
//
//            }
//            let novaViagem = Viagem(id, titulo, quantidadeDias, preco, localizacao)
//            listaViagem.append(novaViagem)
//
//    }
//        return listaViagem
//}
}
