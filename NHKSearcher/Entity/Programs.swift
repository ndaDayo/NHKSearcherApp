//
//  Program.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//
import Foundation

struct Programs: Codable {
    let list: ProgramList
    func items() -> [Program] {
            return list.g1
        }
}

struct ProgramList: Codable {
    let g1: [Program]
}

struct Program: Codable, Identifiable {
    let id: String
    let eventId: String
    let startTime: String
    let endTime: String
    let area: Area
    let service: Service
    let title: String
    let subtitle: String
    let content: String
    let act: String
    let genres: [String]

    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, content, act, genres
        case eventId = "event_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case area, service
    }
}

struct Area: Codable {
    let id: String
    let name: String
}

struct Service: Codable {
    let id: String
    let name: String
    let logoS: Logo
    let logoM: Logo
    let logoL: Logo

    enum CodingKeys: String, CodingKey {
        case id, name
        case logoS = "logo_s"
        case logoM = "logo_m"
        case logoL = "logo_l"
    }
}

struct Logo: Codable {
    let url: String
    let width: String
    let height: String
}

