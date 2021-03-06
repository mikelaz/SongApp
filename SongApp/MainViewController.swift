//
//  MainViewController.swift
//  SongApp
//
//  Created by Mikel Aguirre on 22/4/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, SongsTableViewControllerDelegate{

    @IBOutlet weak var tituloCancion: UILabel!
    
    @IBOutlet weak var artistaCancion: UILabel!
    
    @IBOutlet weak var albumCancion: UILabel!
    
    @IBOutlet weak var caratulaCancion: UIImageView!
    
    @IBOutlet weak var botonPlayPause: UIButton!
    
    @IBOutlet weak var controlVolumen: UISlider!
    
    private var reproductor: AVAudioPlayer!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Metodo delegado que utilizamos para recibir la información desde el controlador SongsTableView
    func delegateMethod(tituloC: String, artistaC: String, albumC: String, caratula100C: UIImage, previewC: NSURL){
        self.tituloCancion.text = tituloC
        self.artistaCancion.text = artistaC
        self.albumCancion.text = albumC
        self.caratulaCancion.image = caratula100C
        //descargamos el preview de la canción desde los servidores de iTunes
        let cancion:NSData? = NSData(contentsOfURL: previewC)
        if cancion != nil{
            do{
                //cargamos la canción descargada y la reproducimos directamente
                try reproductor = AVAudioPlayer(data: cancion!)
                reproductor.volume = self.controlVolumen.value
                reproductor.play()
            }catch{
                print("Error al cargar el fichero de audio")
            }

        }
        
    }
    
    // MARK: - Navigation
 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cargaEmbebido = segue.destinationViewController as! SongsTableViewController
        //IMPORTANTE: En la siguiente línea creamos la referencia al delegado que utilizaremos desde el controlador child
        cargaEmbebido.delegate = self
        
    }

    @IBAction func cambiarVolumen(sender: UISlider) {
        reproductor.volume = sender.value
    }
    
    @IBAction func accionPlayPause() {
        if (reproductor != nil) && !reproductor.playing{
            reproductor.volume = self.controlVolumen.value
            reproductor.play()
        }else if (reproductor != nil){
            reproductor.pause()
        }
        
    }
    
    @IBAction func accionStop() {
        if (reproductor != nil) && reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        
    }
    
}
