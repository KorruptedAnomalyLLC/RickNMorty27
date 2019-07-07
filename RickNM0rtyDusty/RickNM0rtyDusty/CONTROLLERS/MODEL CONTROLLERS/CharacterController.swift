//
//  CharacterController.swift
//  RickNM0rtyDusty
//
//  Created by Austin West on 7/7/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class CharacterController {
    
    //MARK: - (optional) Singleton/Source of Truth
    static let shared = CharacterController()
    private init() {}
    
    //MARK: - Properties
    var characterList: [Character] = []
    let baseURLString = "https://rickandmortyapi.com/api/"
    let characterString = "character"
    
    // URL I WANT TO MAKE
    // https://rickandmortyapi.com/api/character/
    
    //MARK: - File functions (like CRUD)
    // GET info from API
    func getCharacters(completion: @escaping ([Character]?) -> Void) {
        // Make the URL
        guard var baseURL = URL(string: baseURLString) else { return }
        // let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        baseURL.appendPathComponent(characterString)
        print("\(baseURL)")
        // Get info from the URL
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print("There was an error with dataTask: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
               // Turn that intom Rick and Morty Characters
            let jsonDecoder = JSONDecoder()
           
            do {
               let characters = try jsonDecoder.decode([Character].self, from: data)
                self.characterList = characters
            } catch {
                print("There was an error with the jsonDecoder: \(error.localizedDescription)")
                return
            }
        }.resume()

    }// END OF FETCH
    
    //END OF FILE
    //MARK: - Extenstions (separate extension for each feature, such as searching or alert controllers)
}
