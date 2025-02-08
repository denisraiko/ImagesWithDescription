//
//  ImageDataManager.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation

class ImageDataManager {
    private var images: [ImageModel] = []
    private var currentIndex = 0
    
    init(images: [ImageModel], currentIndex: Int = 0) {
        self.images = images
        self.currentIndex = currentIndex
    }
    
    func getCurrentIndex() -> ImageModel {
        images[currentIndex]
    }
    
    func getNextImage() -> ImageModel {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        return getCurrentIndex()
    }

    func getLastImage() -> ImageModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentIndex()
    }

    func getFirstImage() -> ImageModel {
        currentIndex = 0
        return getCurrentIndex()
    }
}
