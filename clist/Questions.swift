//
//  Questions.swift
//

import Foundation


public struct checkcounter {
    let Workinglist: [String]
    let Equiplist: [String]
    let Allwork: Int
    let Allequip: Int

    
    init() {
        Workinglist = ["Earthworks","Welding & Cutting","Factory Construction, demolition, renovation/repair work", "Scaffolding", "Pipeline construction"]
        Allwork = 5
        
        Equiplist = ["Mobile Crane","Excavator","Dump / Freight Truck", "Elevated workstation"]
        Allequip = 4
    }
}



public struct Questions {
    
    
    let hotQuestions: [String]
    let coldQuestions: [String]
    let rainQuestions: [String]
    
    let hotnumber: Int
    let coldnumber: Int
    let rainnumber: Int
    

    
    
    
    
    let AAAQuestions: [String]
    let BBBQuestions: [String]
    let CCCQuestions: [String]
    let DDDQuestions: [String]
    let EEEQuestions: [String]
    
    
    
    let AAAnumber: Int
    let BBBnumber: Int
    let CCCnumber: Int
    let DDDnumber: Int
    let EEEnumber: Int
    
    
    
    let AAAid: Int
    let BBBid: Int
    let CCCid: Int
    let DDDid: Int
    let EEEid: Int
    
    
    
    
    
    
    
    let MCQuestions: [String]
    let EXQuestions: [String]
    let DFQuestions: [String]
    let EWQuestions: [String]
    
    
    
    let MCnumber: Int
    let EXnumber: Int
    let DFnumber: Int
    let EWnumber: Int
    
    
    
    let MCid: Int
    let EXid: Int
    let DFid: Int
    let EWid: Int

    
    
    
    
    init() {
        hotQuestions = ["1. 15 minutes or more break every hour","2. In indoor workplaces, keep windows and doors open for natural ventilation and refrain from working in confined spaces.","3. Refrain from working outdoors between 2:00 PM and 5:00 PM","4. Drink cool water or saline every 30 minutes while working (no caffeinated drinks)","5. Even if it is hot, be careful not to be negligent in wearing protective equipment such as hard hats and safety belts.","6. Check workers who are vulnerable to heat illness in advance and prepare and check emergency contact networks"]
        hotnumber = 6

        
        coldQuestions = ["1. Installation of facilities to provide hot water (including drinking water) to maintain body temperature","2. A separate resting place is provided for resting while maintaining body temperature during resting hours.","3. Provision of protective equipment suitable for workers handling low-temperature objects such as winter helmets, winter shoes, and winter gloves","4. Preparation for fire hazards caused by overheating of heating appliances","5. Preparation of equipment and special tools for snow removal work"]
        coldnumber = 5

        
        rainQuestions = ["1. Securing and managing drainage facilities sufficient for expected rainfall strength","2. Measures to prevent rainwater penetration, such as gently cutting and soil gradient, and covering vinyl in case of urgent cutting/soil, etc.","3. Implementation of left and right drainage and compression reinforcement to prevent soil loss and subsidence on site roads on vehicle and construction machinery operating routes","4. Minimize the extent of damage by blocking non-critical items except for electric wires to be used in an emergency in case of storm or heavy rain."]
        rainnumber = 4

        
        
        
        
        
        
        AAAQuestions = ["1. Check for abnormalities in topography, geology, groundwater level, water condition, and surrounding environment","2. Checking whether gas pipes, water and sewage pipes, telecommunications cable pipes, etc. are buried","3. Check for installation of drainage channels for side and earthwork sections","4. Check for measures to prevent inflow of surface water","5. Preparation of a work plan for construction equipment such as excavators and dumps and confirmation of the placement of guides"]
        AAAnumber = 5

        
        
        BBBQuestions = ["1. Check for installation of flame scattering prevention facilities during cutting, welding, and cutting operations","2. Fire extinguishers should be placed around cutting, welding, and cutting work areas.","3. Do not place flammable substances such as styrofoam, urethane foam, oil, etc. around cutting, welding, or melting work areas.","4. Fire monitors are positioned when working with fire near materials at risk of ignition","5. Check for gas leakage or residual gas before welding or cutting of pipes and containers where flammable gas is staying"]
        BBBnumber = 5

        
        CCCQuestions = ["1. Establish the signal method for the lifting of steel components and place the inductor","2. Work command is conducted to ensure that the steel frame assembly work is carried out according to construction procedures.","3. Deck plates minimize openings according to assembly order","4. Install temporary ladders for safe climb/fall and use fall protection when assembling steel frames or renovating/repairing the plant","5. Installation of fall protection net to prevent falling during steel assembly or roof renovation/repair work","6. Install attachment facilities that can be safely hung and workers wear safety belts.","7. Simultaneous work on the upper and lower parts of the roof is prohibited, and fence and off-limit signs are installed to prevent other workers and the public from accessing the work area."]
        CCCnumber = 7
        
        
        DDDQuestions = ["1. To prevent slipping or sinking on scaffolding columns, use base hardware or floorboards, etc., and install a bottom handle.","2. Securely secure horizontal  materials, braces, etc. to prevent  movement or  shaking of  scaffolding  columns.","3. Secure the work plate to two or more supports so that it does not deviate or fall off the longitudinal line of the scaffold.","4. Installation of  safety railings in corridors  where workers are likely  to fall , edges of work plates, around openings, and ramps","5. At the first stage of a place where workers, pedestrians, vehicles, etc. are frequent, protective shelves are installed instead of falling object prevention nets."]
        DDDnumber = 5
        
        
        EEEQuestions = ["1. Inspect the work place and surrounding ground for cracks, water, or condition before excavation work","2. Measures to prevent heavy objects such as excavated soil and materials from being deposited on the back ground of the soil barrier","3. Check the condition and presence of deformation, corrosion, damage, and fall of the reinforcing member of the soil barrier","4. Implement fundamental measures, such as mitigating slope’s slope, to stabilize slope.","5. Installation of safety signs and prohibition of workers from entering areas where danger is expected on cutting and soil slopes","6. Installation of drainage channels such as mountain floor side vents to prevent inflow of rainwater, etc. on the upper part of the slope of cut and soil"]
        EEEnumber = 6
        
        
        AAAid = 0
        BBBid = 1
        CCCid = 2
        DDDid = 3
        EEEid = 4
        
        
        
        
        MCQuestions = ["1. The operator must have a qualification (cradle: construction machinery operator's license, cargo crane: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "2. Work with safety confirmed after reviewing whether ground subsidence occurs due to load on the lower surface", "3. Operation after setting load and allowable working radius suitable for boom length and angle", "4. Measures not to arbitrarily attach boarding facilities to the end of the boom"]
        MCnumber = 4
        
        
        EXQuestions = ["1. The operator is qualified for (less than 3 tons: complete control training for small construction machinery, 3 tons or more: license for construction pilot).", "2. Prohibition of access to workers within the radius of work and rotation and deployment of guides for work command", "3. Fasten the connection between the excavator bucket and the boom.","4. Measures to prevent sudden driving or departure when the excavator is stopped"]
        EXnumber = 4
        
        
        DFQuestions = ["1. The operator is qualified for (dump truck: type 1 large-sized license, construction machinery pilot license/freight truck: type 1 large license (12 tons or more), type 1 general license (less than 12 tons)", "2. Place a guide in case of danger of contact with workers within the work radius", "3. Control to prevent dump trucks from approaching the slope tip or the ground at risk of collapse", "4. Dump trucks are not overloaded with soil"]
        DFnumber = 4

        
        EWQuestions = ["1. The driver is qualified for (less than 10 tons: type 1 general license, type 10 tons or more: type 1 large license).", "2. Ensure that the work place is free from the risk of conduction of facilities such as ground subsidence", "3. Operation after setting load and allowable working radius suitable for boom length and angle", "4. Safety rail installation of workstations"]
        EWnumber = 4

        
        
        MCid = 0
        EXid = 1
        DFid = 2
        EWid = 3
    }
    
    
    
}
