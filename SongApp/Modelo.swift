//
//  Modelo.swift
//  SongApp
//
//  Created by Mikel Aguirre on 22/4/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import Foundation
import UIKit

class Datos{
    
    class Cancion{
        
        let titulo: String
        let artista: String
        let album: String
        let caratula30: UIImage
        let caratula100: UIImage
        let preview: NSURL
        
        init(tituloC: String, artistaC: String, albumC: String, caratula30C: UIImage, caratula100C: UIImage, previewC: NSURL){
            self.titulo = tituloC
            self.artista = artistaC
            self.album = albumC
            self.caratula30 = caratula30C
            self.caratula100 = caratula100C
            self.preview = previewC
        }
        
    }
    
    var canciones : [Cancion] = []
    let consultaiTunes: String = "number+of+the+beast+iron+maiden&entity=song"
    
    func obtenerDatosConsultaiTunes (consulta: String){
        
        let urlString = "https://itunes.apple.com/search?term=\(consulta)"
        let url = NSURL (string: urlString)
        //Descargamos la respuesta JSON
        let datos:NSData? = NSData(contentsOfURL: url!)
        //Si la descarga es nula, entendemos que ha habido un error en la comunicación con el servidor
        if datos != nil{
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let numresultados = dico1["resultCount"] as! Int
                if numresultados > 0{
                    let dico2 = dico1["results"] as? [NSDictionary]
                    if dico2 != nil{
                        for cancion in (dico2?.enumerate())!{
                            let trackname = dico2![cancion.index]["trackName"] as! String
                            let artistName = dico2![cancion.index]["artistName"] as! String
                            let collectionName = dico2![cancion.index]["collectionName"] as! String
                            let artworkUrl30 = NSURL(string: dico2![cancion.index]["artworkUrl30"] as! String)
                            let caratula30:UIImage? = UIImage(data: NSData(contentsOfURL: artworkUrl30!)!)
                            let artworkUrl100 = NSURL(string: dico2![cancion.index]["artworkUrl100"] as! String)
                            let caratula100:UIImage? = UIImage(data: NSData(contentsOfURL: artworkUrl100!)!)
                            let previewUrl = NSURL(string: dico2![cancion.index]["previewUrl"] as! String)
                            
                            self.canciones.append(Cancion(tituloC: trackname, artistaC: artistName, albumC: collectionName, caratula30C: caratula30!, caratula100C: caratula100!, previewC: previewUrl!))
                        }
                    }
                }
                
            }catch{
                print("Error en el parseo del JSON")
            }
        }else{
            print("Error en la descarga")
        }
        
    }
    
    init(){
        self.obtenerDatosConsultaiTunes(consultaiTunes)
    }
    
}
