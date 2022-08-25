//
//  MyRecordRepository.swift
//  Earth1round-iOS
//
//  Created by 황유란 on 2022/08/25.
//

import Foundation
import RxSwift

protocol MyRecordRepository {
    func load() -> Observable<[MyRecord]>
}
