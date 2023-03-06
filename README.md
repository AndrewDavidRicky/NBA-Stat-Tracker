# NBA Stat Tracker

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
NBA Stat Tracker is an iOS app that provides basketball fans with up-to-date stats on their favorite players and teams. The data is retrieved via the balldontlie api. Users are able to browse the statistics of all players and teams that are currently in the NBA.

### App Evaluation
- **Category:** Sports
- **Mobile:** This app is designed for mobile devices.
- **Story:** This app allows basketball fans to view the stats of their favorite NBA Players and Teams. Users can view specific team's or player's statistics.
- **Market:** This app is intendended for NBA fans
- **Habit:** This app will allow NBA fans to check the stats of their favorite players and teams everyday and will return them with accurately updated statistics throughout the season
- **Scope:** This app will display player profiles/statistics, team profiles/statistics, and game schedules. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can browse through different NBA teams.
* User can view player statistics and information.
* User can view the latest NBA scores and games.

**Optional Nice-to-have Stories**

* User can be notified of upcoming games
* User can create an account
* User can favorite teams and players

### 2. Screen Archetypes

* Home Screen
   * Display games for today
* Team Screen
   * Displays the list of teams based on the standings (highest win/loss percentage)
* Players Screen
   * Displays list of NBA players (clickable to view their stats)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home (General NBA Today)
* Teams
* Players

**Flow Navigation** (Screen to Screen)

* Home
   * Connects to the other screens by the tabs on the bottom
* Teams
   * Can click on a specific team to bring up a Detail View
* Players
   * Can click on a specific player to bring up a Detail View

## Wireframes
![](https://i.imgur.com/nfI95sF.png)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
