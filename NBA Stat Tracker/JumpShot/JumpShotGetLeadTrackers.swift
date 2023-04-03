//
//  JumpShotGetLeadTrackers.swift
//  JumpShot
//
//  Copyright (c) 2021 Jerel Rocktaschel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public extension JumpShot {
    /**
        Returns an array of Play model objects for the game and date passed
     
        URL called:  data.nba.net/prod/v1/20210125/0022000257_pbp_1.json
   
        - Parameter gameDate: GameDate for game. Default to today.
        - Parameter gameId: GameID for game
        - Parameter period: 1-4 for regular game. 5+ for overtimes.
        - Parameter completion: The callback after retrieval.
        - Parameter plays: An array of Playmodel objects.
        - Parameter error: Error should one occur.
        - Returns: An array of Play model objects or error.
            
        # Notes: #
        1. Handle [Play] return due to being optional.
     */

    typealias GetLeadTrackersCompletion = (_ leadTrackerQuarters: [LeadTracker]?,
                                        _ error: LocalizedError?) -> Void

    func getGetLeadTrackers(for gameDate: Date = Date(),
                            with gameId: String,
                            and period: String,
                            completion: @escaping GetLeadTrackersCompletion) {
        let gameDateFormatted = gameDate.toYYYYMMDDFormat()
        JumpShotNetworkManager.shared.router.request(.leadTrackerList( date: gameDateFormatted,
                                                                       gameId: gameId,
                                                                       period: period)) { data, response, error in
            var dataResponse: (json: [String: Any]?, error: LocalizedError?)
            dataResponse = self.handleDataResponse(data: data, response: response, error: error)
            if let json = dataResponse.json {
                guard let apiResponse = LeadTrackerApiResponse(json: json) else {
                    completion(nil, JumpShotNetworkManagerError.unableToDecodeError)
                    return
                }
                completion(apiResponse.leadTrackers, nil)
            } else {
                completion(nil, dataResponse.error)
            }
        }
    }
}
