//
//  main.swift
//  ProtocolsAndDelegates
//
//  Created by Artem Tkachuk on 7/24/20.
//  Copyright © 2020 Artem Tkachuk. All rights reserved.
//

protocol AdvancedLifeSupport {
    func performCPR()
}

//UITextField analogy
class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(currentEmergencyCallHandler: EmergencyCallHandler) {
        //Parademic says "I am ready to handle all the emergencies, so notify me of any"
        currentEmergencyCallHandler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(currentEmergencyCallHandler: EmergencyCallHandler) {
        currentEmergencyCallHandler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    func useStethoscope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings " + "Staying alive" + " by Bee Gees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(currentEmergencyCallHandler: emilio)
let angela = Surgeon(currentEmergencyCallHandler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()


