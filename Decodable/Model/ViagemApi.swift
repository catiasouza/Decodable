
import Foundation

class ViagemApi{
    
        //CONSUMINDO ARQUIVO JSON
    func getViagens() -> [[String: Any]]? {
        
        //NOME DO ARQUIVO E EXTENSAO
        if let caminho = Bundle.main.url(forResource: "viagens", withExtension: "json"){
            let json: Data = try! Data(contentsOf: caminho)
            do{
                let viagens = try JSONSerialization.jsonObject(with: json, options: .allowFragments)
                let listaViagens = viagens as? [[String: Any]]
                return listaViagens
                
            }catch{
                print(error.localizedDescription)
            }
            
        }
         return nil
    }
        
}


