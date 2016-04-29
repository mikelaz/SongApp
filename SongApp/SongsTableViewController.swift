//
//  SongsTableViewController.swift
//  SongApp
//
//  Created by Mikel Aguirre on 22/4/16.
//  Copyright © 2016 Mikel Aguirre. All rights reserved.
//

import UIKit

protocol SongsTableViewControllerDelegate{
    func delegateMethod(tituloC: String, artistaC: String, albumC: String, caratula100C: UIImage, previewC: NSURL)
}

class SongsTableViewController: UITableViewController {

    let datos = Datos()
    
    //Definimos el objeto delegado referenciado desde la vista parent
    var delegate: SongsTableViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.canciones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as! SongsTableViewCell
        // Configure the cell...
        let cancion = datos.canciones[indexPath.row]
        cell.caratulaDisco.image = cancion.caratula30
        cell.nombreArtista.text = cancion.artista
        cell.tituloCancion.text = cancion.titulo

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let titulo = datos.canciones[indexPath.row].titulo
        let artista = datos.canciones[indexPath.row].artista
        let album = datos.canciones[indexPath.row].album
        let caratula = datos.canciones[indexPath.row].caratula100
        let cancion = datos.canciones[indexPath.row].preview
        //Llamada al método delegado para enviar a la vista principal los datos de la línea seleccionada
        self.delegate?.delegateMethod(titulo, artistaC: artista, albumC: album, caratula100C: caratula, previewC: cancion)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
