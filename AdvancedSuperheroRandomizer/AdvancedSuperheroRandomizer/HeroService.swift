//import Alamofire
//
//class HeroService {
//    static let shared = HeroService()
//    
//    private let allHeroesURL = "https://akabab.github.io/superhero-api/api/all.json"
//    
//    func fetchAllHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
//        AF.request(allHeroesURL).responseDecodable(of: [Superhero].self) { response in
//            switch response.result {
//            case .success(let heroes):
//                completion(.success(heroes))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
