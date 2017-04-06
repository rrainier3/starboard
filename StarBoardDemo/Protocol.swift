//
//  Protocol.swift
//  StarBoardDemo
//
//  Created by RayRainier on 3/31/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//
import UIKit
import Foundation

protocol writeValueBackDelegate {
    func writeValueBack(value: String)
}

// test class

class Planet {
    var someValue: String = ""
}
