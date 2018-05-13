//
//  ViewController5.swift
//  ReaccionesQuimicas
//
//  Created by Luis Alfonso Rojo Sánchez on 29/04/18.
//  Copyright © 2018 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController5: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var elementoRecibido = "";
    
    //@IBOutlet weak var modeloRecibido: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = traducirElementos(elemento: elementoRecibido);
        
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        // Create a new scene
        // Set the scene to the view
        if(elementoRecibido == "VaporDeAgua"){
            let scene = SCNScene(named: "VaporDeAgua.scn")!
            /*
            let box = SCNBox(width: 0.0, height: 0.0, length: 0.0, chamferRadius: 0);
            let boxNode = SCNNode();
            boxNode.geometry = box
            boxNode.position = SCNVector3(50, 0, 50)
            
            scene.rootNode.addChildNode(boxNode)
            */
            sceneView.scene = scene
            
        }else if(elementoRecibido == "Butano"){
            let scene = SCNScene(named: "Butano.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "DioxidoDeCarbono"){
            let scene = SCNScene(named: "DioxidoDeCarbono.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Fructuosa"){
            let scene = SCNScene(named: "Fructuosa.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Glucosa"){
            let scene = SCNScene(named: "Glucosa.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Octano"){
            let scene = SCNScene(named: "Octano.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Oxigeno"){
            let scene = SCNScene(named: "Oxigeno.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Sacarosa"){
            let scene = SCNScene(named: "Sacarosa.scn")!
            sceneView.scene = scene
        }else if(elementoRecibido == "Metano"){
            let scene = SCNScene(named: "Metano.scn")!
            sceneView.scene = scene
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func traducirElementos(elemento : String) -> String {
        switch elemento {
        case "Agua":
            return "Agua";
        case "Butano":
            return "Butano";
        case "DioxidoDeCarbono":
            return "Dióxido de Carbono"
        case "Fructuosa":
            return "Fructuosa";
        case "Glucosa":
            return "Glucosa";
        case "Metano":
            return "Metano"
        case "Sacarosa":
            return "Sacarosa";
        case "Octano":
            return "Octano";
        case "Oxigeno":
            return "Oxígeno"
        case "VaporDeAgua":
            return "Vapor de agua";
        default:
            return "Elemento None";
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
