//
//  ImageDataManager.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation

protocol ImageManageable {
    func getCurrentIndex() -> ImageModel
    func getNextImage() -> ImageModel
    func getLastImage() -> ImageModel
    func getFirstImage() -> ImageModel
}

class ImageDataManager: ImageManageable {
    
    
    
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
    func getImage(_ name: String) -> ImageModel? {
        for image in images {
            if image.imageName == name {
                return image
            }
        }
        return nil
    }
}
