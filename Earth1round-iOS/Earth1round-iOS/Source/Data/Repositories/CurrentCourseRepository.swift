//
//  CurrentCourseRepository.swift
//  Earth1round-iOS
//
//  Created by 황유란 on 2022/08/23.
//

import Foundation
import RxSwift
import Moya

class CurrentCourseRepository: CourseRepository {
    
    func course() -> Observable<CurrentCourse> {
        let observable = Observable<CurrentCourse>.create { observer -> Disposable in
            let requestReference: () = CurrentCourseService.shared.getCourse { response in
                switch response {
                case .success(let data):
                    if let data = data,
                       let result = data.result {
                        observer.onNext(result)
                    }
                case .failure(let err):
                    print(err)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
}
