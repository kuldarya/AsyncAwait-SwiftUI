//
//  ViewModel.swift
//  AsyncAwait
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    @MainActor
    func displayUsers() {
        Task.init {
            let result = await fetchUsers()
            switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func fetchUsers() async -> Result<[User], Error> {
        guard let url = url else {
            return .failure(APIError.failedToGetUsers)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            return .success(users)
        } catch {
            return .failure(error)
        }
    }
}

enum APIError: Error {
    case failedToGetUsers
}
