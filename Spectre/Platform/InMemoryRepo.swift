//
//  InMemoryRepo.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation
import SwiftProtobuf
extension String: Error {}

class InMemoryRepo: EntityGateway {
    func loadSession(_ id: Int64, _ completion: (Result<Session, Error>) -> Void) {
        if let session = InMemoryRepo.sessions.first(where: { $0.id == id }) {
            completion(.success(session))
        } else {
            completion(.failure("mumu"))
        }
    }

    func loadSchedule(_ completion: (Result<[Session], Error>) -> Void) {
        completion(.success(InMemoryRepo.sessions))
    }
}

extension InMemoryRepo {
    static let sessions: [Session] = {
        let session0 = Session.with { (s) in
            s.id = 0
            s.date = 1573486358
            s.duration = 2000
            s.title = "First steps with Swift UI in Xcode"
            s.room = "Valahu Hall"
            s.abstract = """
            SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.
            """
            s.keywords = ["Xcode", "SwiftUI"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Mircea"
                    speaker.lastName = "cel Batran"
                })
            ]
        }
        let session1 = Session.with { (s) in
            s.id = 1
            s.date = 1573486358
            s.duration = 2700
            s.title = "iOS Unit Testing and UI Testing"
            s.room = "Room 245"
            s.abstract = """
            SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.
            """
            s.keywords = ["Testing", "iOS"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "John"
                    speaker.lastName = "Snow"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Ranjit"
                    speaker.lastName = "Jaduf"
                })
            ]
        }
        let session2 = Session.with { (s) in
            s.id = 2
            s.date = 1573486358
            s.duration = 16000
            s.title = "Accessibility Design Lab"
            s.room = "Lab 8020"
            s.abstract = """
            Make your apps accessible and simple to use for everyone. Learn the basics of VoiceOver and other accessibility features to better understand how customers with varying needs use your products. Come prepared with a working prototype, development build, or your released app. You can drop in to ask a quick question, or schedule an appointment for a longer review.

            Drop-in chats for user interface design and accessibility design are 5-10 minutes long, and are on a first come, first served basis. Appointments are 30 minutes long and are assigned by random selection. You can submit a request from 7:00-7:30 a.m. each morning, and you’ll get an email letting you know whether you received an appointment for that day shortly after 7:30 a.m. If you do not receive an appointment, you can submit a request again on another day. Appointments are limited to one per person per lab for the duration of the conference.
            """
            s.keywords = ["Design", "Ethics", "Accessibility"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Pamela"
                    speaker.lastName = "Johansson"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Erik"
                    speaker.lastName = "Mars"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Yui"
                    speaker.lastName = "Kazimoto"
                })
            ]
        }
        let session3 = Session.with { (s) in
            s.id = 3
            s.date = 1573486358
            s.duration = 3600
            s.title = "What's New in Xcode 11"
            s.room = "Hall 2"
            s.abstract = """
            Start the week with a tour of new features in Xcode 11, designed to help you get from idea to product faster than ever. Discover new ways to edit and organize your source code, new capabilities for designing and previewing user interfaces, and great improvements for debugging and testing. Get an overview for sessions covering developer tools this year.
            """
            s.keywords = ["Xcode"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Owen"
                    speaker.lastName = "Haven"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Josh"
                    speaker.lastName = "Moore"
                })
            ]
        }
        let session4 = Session.with { (s) in
            s.id = 4
            s.date = 1573486358
            s.duration = 4000
            s.title = "Machine Learning Lab"
            s.room = "Hall 4"
            s.abstract = """
            Meet with Apple’s Machine Learning engineers for expert advice on model training in Create ML or Turi Create, the Core ML Framework, model conversion, and domain APIs for Vision, Natural Language, Speech, and Sound. Bring your datasets, source code, and demos.
            """
            s.keywords = ["CoreML","APIs","Frameworks"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Miley"
                    speaker.lastName = "Cyrus"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Justin"
                    speaker.lastName = "Timberlake"
                })
            ]
        }
        let session5 = Session.with { (s) in
            s.id = 5
            s.date = 1573486358
            s.duration = 4000
            s.title = "Advances in macOS Security"
            s.room = "Hall 3"
            s.abstract = """
            We are on a journey to continuously improve macOS security, with a particular focus on preventing malware and protecting user data. Join us on the next step and learn more about what’s new in Gatekeeper—for keeping malware out of macOS—as well as new protections that help keep users’ data and activity under their control.
            """
            s.keywords = ["macOS","Security"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Marshall"
                    speaker.lastName = "Matters"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Dr."
                    speaker.lastName = "Dre"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Skylar"
                    speaker.lastName = "Gray"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Minato"
                    speaker.lastName = "Namikaze"
                })
            ]
        }
        let session6 = Session.with { (s) in
            s.id = 6
            s.date = 1573486358
            s.duration = 1500
            s.title = "Apple Developer Program Support By Appointment Lab"
            s.room = "Hall 3"
            s.abstract = """
            Receive help with updating your developer account information, managing your development devices and certificates, renewing your membership, and more.

            Appointments are recommended, but not required — you may drop in anytime during these hours. Appointment requests are accepted starting at 7:00 a.m. for that day only.
            """
            s.keywords = ["Support"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Rowan"
                    speaker.lastName = "Mitchell"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Tim"
                    speaker.lastName = "Simpson"
                })
            ]
        }
        let session7 = Session.with { (s) in
            s.id = 7
            s.date = 1573486358
            s.duration = 4500
            s.title = "Design Lab"
            s.room = "Lab 8010"
            s.abstract = """
            Get advice on making your apps simple to use and visually compelling. Come prepared with a working prototype, development build, or your released app. You can walk in to ask a quick question, or schedule an appointment for a longer review.

            Drop-in chats for user interface design and accessibility design are 5-10 minutes long, and are on a first come, first served basis. Appointments are 30 minutes long and are assigned by random selection. You can submit a request from 7:00-7:30 a.m. each morning, and you’ll get an email letting you know whether you received an appointment for that day shortly after 7:30 a.m. If you do not receive an appointment, you can submit a request again on another day. Appointments are limited to one per person per lab for the duration of the conference.
            """
            s.keywords = ["Design", "Workshop"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Melissa"
                    speaker.lastName = "Rich"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Tim"
                    speaker.lastName = "Simpson"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Samantha"
                    speaker.lastName = "Bulk"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Alan"
                    speaker.lastName = "Cornfield"
                })
            ]
        }
        let session8 = Session.with { (s) in
            s.id = 8
            s.date = 1573486358
            s.duration = 1800
            s.title = "In-App Purchases & Subscriptions Lab"
            s.room = "Hall 3"
            s.abstract = """
            Members of App Store Engineering and App Store Operations will be on hand to answer your questions about StoreKit, in-app purchases, server-to-server notifications, receipt validation, subscriptions, ODR, payment queue and the sandbox environment.
            """
            s.keywords = ["Support"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Duncan"
                    speaker.lastName = "Witt"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Jorgen"
                    speaker.lastName = "Olso"
                })
            ]
        }
        let session9 = Session.with { (s) in
            s.id = 9
            s.date = 1573486358
            s.duration = 2400
            s.title = "System Extensions and DriverKit"
            s.room = "Hall 3"
            s.abstract = """
            One of the next steps in modernizing and improving the security and reliability of macOS is to provide a better architecture for kernel extensions and drivers. Learn how to make this transition with System Extensions and DriverKit.
            """
            s.keywords = ["DriverKit","Extensions"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Polly"
                    speaker.lastName = "Vitman"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Manson"
                    speaker.lastName = "Highes"
                })
            ]
        }
        let session10 = Session.with { (s) in
            s.id = 10
            s.date = 1573486358
            s.duration = 1500
            s.title = "Siri Shortcuts and SiriKit Lab"
            s.room = "Hall 3"
            s.abstract = """
            Shortcuts and SiriKit allow people to have rich interactions with your apps through Siri when they're on the go. You may have questions about how to get the most out of them and we're here to help. Meet with an Apple engineer to review your code and talk about your resolve method, configuring your custom intents, or any facet of Shortcuts or SiriKit you may be stuck on.
            """
            s.keywords = ["Siri"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Gunther"
                    speaker.lastName = "Holl"
                })
            ]
        }

        let sessions = [session0, session1, session2, session3, session4, session5, session6, session7, session8, session9, session10]
        return sessions
    }()

    
}
