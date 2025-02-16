//
//  ImageManager.swift
//  ImagesWithDescription
//
//  Created by Denis Raiko on 8.02.25.
//

import Foundation


class ImageManager {
    func getImages() -> [ImageModel] {
        return [
            ImageModel(imageName: "1", description: "The Plum Agency is a global, industry-leading agency specialising in children’s publishing and media. We help people thrive, steer talent to blossom and make careers grow."),
            ImageModel(imageName: "2", description: "Reading in English Method for pre-primary children. Edelvives Publishing house. Madrid. 2011-2012.Método de lectura en inglés para alumnos de pre-primaria. Editorial Edelvives. Madrid. 2011-2012."),
            ImageModel(imageName: "3", description: "Something to keep in mind when writing image descriptions is that it's a completely subjective exercise. There is no formula for crafting the perfect image description. It is not an exact science. Image descriptions will vary between different visuals, creators, and scenarios.")
            ]
    }
}
