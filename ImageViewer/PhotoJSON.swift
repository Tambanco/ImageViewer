//
//  PhotoJSON.swift
//  ImageViewer
//
//  Created by tambanco 🥳 on 09.11.2021.
//

import Foundation

struct PhotoJSON: Codable {
    let albumId: Int
    let id: Int
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
