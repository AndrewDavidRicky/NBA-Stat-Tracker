//
//  JumpShotApiEndPoint+helpers.swift
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

public enum LeagueLeaders {
    public enum PerMode: String {
        case perGame = "PerGame"
        case per48 = "Per48"
        case totals = "Totals"
    }

    public enum SeasonType: String {
        case preSeason = "Pre+Season"
        case regularSeason = "Regular+Season"
        case playoffs = "Playoffs"
    }

    public enum TotalsStatCategory: String {
        case minutes = "MIN"
        case fieldGoalsMade = "FGM"
        case fieldGoalsAttempted = "FGA"
        case fieldGoalsPercentage = "FG_PCT"
        case threePointersMade = "FG3M"
        case threePointersAttempted = "FG3A"
        case threePointersPercentage = "FG3_PCT"
        case foulShotsMade = "FTM"
        case foulShotsAttempted = "FTA"
        case foulShotsPercentage = "FT_PCT"
        case offensiveRebounds = "OREB"
        case defensiveRebounds = "DREB"
        case rebounds = "REB"
        case assists = "AST"
        case steals = "STL"
        case blocks = "BLK"
        case turnovers = "TOV"
        case playerEfficiency = "EFF"
        case points = "PTS"
        case assistsToTurnovers = "AST_TOV"
        case stealsToTurnovers = "STL_TOV"
        case personalFouls = "PF"
    }

    public enum PerGameStatCategory: String {
        case minutes = "MIN"
        case offensiveRebounds = "OREB"
        case defensiveRebounds = "DREB"
        case rebounds = "REB"
        case assists = "AST"
        case steals = "STL"
        case blocks = "BLK"
        case turnovers = "TOV"
        case playerEfficiency = "EFF"
        case points = "PTS"
    }

    public enum Per48StatCategory: String {
        case fieldGoalsMade = "FGM"
        case fieldGoalsAttempted = "FGA"
        case threePointersMade = "FG3M"
        case threePointersAttempted = "FG3A"
        case foulShotsMade = "FTM"
        case foulShotsAttempted = "FTA"
        case offensiveRebounds = "OREB"
        case defensiveRebounds = "DREB"
        case rebounds = "REB"
        case assists = "AST"
        case steals = "STL"
        case blocks = "BLK"
        case turnovers = "TOV"
        case playerEfficiency = "EFF"
        case points = "PTS"
        case personalFouls = "PF"
    }
}
