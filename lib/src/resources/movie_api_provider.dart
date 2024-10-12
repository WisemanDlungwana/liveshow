part of netflix;

class MovieApiProvider {
  // Mocking the movie list locally
  Future<List<ItemModel>> fetchMovieList() async {
    // Hardcoded movie data (as if from API)
    const String mockData = '''
    [
      {
        "title": "Live Music",
        "items": [
          {
            "id": 1,
            "name": "Live at The Royal Albert Hall",
            "image": "assets/images/music/music1.jpg",
            "details": {
              "genres": ["Musical", "RnB"],
              "cast": [
                {"person": {"name": "Adele"}}
              ],
              "year": "2011-11-27",
              "description": "<p>Live at the Royal Albert Hall is a live album and video album by the English singer-songwriter Adele</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 2,
            "name": "The Gospel According to Jazz Ch. 2",
            "image": "assets/images/music/music2.jpeg",
            "details": {
              "genres": ["Musical","Jazz"],
              "cast": [
                {"person": {"name": "Kirk Whalum"}},
                {"person": {"name": "George Duke"}},
                {"person": {"name": "Jonathan Butler"}},
                {"person": {"name": "..."}}
              ],
              "year": "2002-10-29",
              "description": "<p>Saxophonist Kirk Whalum offers listeners Chapter 2 of his Gospel According to Jazz series with this ten-track collection of brilliant contemporary gospel-jazz.</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 3,
            "name": "Live",
            "image": "assets/images/music/music3.jpg",
            "details": {
              "genres": ["Musical", "RnB"],
              "cast": [
                {"person": {"name": "Lalah Hathaway"}}
              ],
              "year": "2015-10-30",
              "description": "<p>Be part of an intimate and soul-stirring evening with the five-time GRAMMY® Award-winning singer/songwriter and producer, Lalah Hathaway</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 4,
            "name": "Live at Ronnie Scott's",
            "image": "assets/images/music/music4.jpeg",
            "details": {
              "genres": ["Musical","Jazz"],
              "cast": [
                {"person": {"name": "Norah Jones"}},
                {"person": {"name": "Brian Blade"}}
              ],
              "year": "2018-06-15",
              "description": "<p>The intimate trio show with Brian Blade & Christopher Thomas from the legendary jazz club features songs from Day Breaks & Norah's entire catalogue</p>",
              "episodes": [
                
              ]
            }
          }          
        ]
      },

      {
        "title": "TV Shows",
        "items": [
          {
            "id": 1,
            "name": "Better Call Saul",
            "image": "assets/images/shows/show1.jpg",
            "details": {
              "genres": ["Drama", "Crime"],
              "cast": [
                {"person": {"name": "Bob Odenkirk"}},
                {"person": {"name": "Jonathan Banks"}},
                {"person": {"name": "Rhea Seehorn"}},
                {"person": {"name": "..."}}
              ],
              "year": "2015-04-06",
              "description": "<p>Ex-con artist Jimmy McGill turns into a small-time attorney and goes through a series of trials and tragedies, as he transforms into his alter ego Saul Goodman, a morally challenged criminal lawyer</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "S01 E01 · Uno",
                  "summary": "<p>Jimmy works magic in the courtroom, and after being inspired unexpectedly, Jimmy tries an unconventional method for pursuing potential clients.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "41:10"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "S01 E02 · Mijo",
                  "summary": "<p>Jimmy's troubles escalate when he is taken hostage, leaving him desperately planning his escape; carelessness puts Chuck at risk.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:05"
                },
                {
                  "number": 3,
                  "season": 1,
                  "name": "S01 E03 · Nacho",
                  "summary": "<p>Jimmy is eager to prove that his dangerous client is innocent, even though it causes problems with Kim.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:25"
                },
                {
                  "number": 4,
                  "season": 1,
                  "name": "S01 E04 · Hero",
                  "summary": "<p>Jimmy devises a bold plan to obtain new clients, but must face consequences when his relationships become strained.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:05"
                },
                {
                  "number": 5,
                  "season": 1,
                  "name": "S01 E05 · Alpine Shepherd Boy",
                  "summary": "<p>Alarming news disrupts Jimmy's efforts at drumming up new business, forcing him to make a difficult choice.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "41:08"
                },
                {
                  "number": 6,
                  "season": 1,
                  "name": "S01 E06 · Five-O",
                  "summary": "<p>When a tragic past comes back to haunt Mike, he seeks help from an unlikely source; Jimmy's moral compass is tested.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "41:05"
                },
                {
                  "number": 7,
                  "season": 1,
                  "name": "S01 E07 · Bingo",
                  "summary": "<p>Jimmy finds a novel way of finding new clients. After being given the opportunity to do the right thing, he cashes in a favour.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:06"
                },
                {
                  "number": 8,
                  "season": 1,
                  "name": "S01 E08 · RICO",
                  "summary": "<p>Jimmy shows Chuck that he is willing to do anything to win a case, including getting his hands dirty.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:05"
                },
                {
                  "number": 9,
                  "season": 1,
                  "name": "S01 E09 · Pimento",
                  "summary": "<p>Chuck wants Jimmy to accept a harsh truth and Mike's ability to complete a job is questioned, thereby threatening a deal.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "41:05"
                },
                {
                  "number": 10,
                  "season": 1,
                  "name": "S01 E10 · Marco",
                  "summary": "<p>Jimmy seizes an opportunity to reconnect with an old friend in the aftermath; Chuck adjusts to a new way of life.</p>",
                  "image": {"medium": "assets/images/shows/show1.jpg"},
                  "airtime": "40:35"
                }
              ]
            }
          },
          {
            "id": 2,
            "name": "Breaking Bad",
            "image": "assets/images/shows/show2.jpg",
            "details": {
              "genres": ["Drama", "Crime"],
              "cast": [
                {"person": {"name": "Bryan Cranston"}},
                {"person": {"name": "Aaron Paul"}},
                {"person": {"name": "Anna Gunn"}},
                {"person": {"name": "..."}}
              ],
              "year": "2008-01-20",
              "description": "<p>Walter White, a chemistry teacher, discovers that he has cancer and decides to get into the meth-making business to repay his medical debts. His priorities begin to change when he partners with Jesse.</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "S01 E01 · Pilot",
                  "summary": "<p>Walter White is a high school chemistry teacher who learns that he has lung cancer. With a new lease of life, Walter sets up a mobile meth lab with a former student and becomes a drug dealer in order to secure his family's financial security.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "41:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "S01 E02 · Cat's in the Bag...",
                  "summary": "<p>Following their debacle in the desert, Walter and Jesse are left with a mess to dispose of. Later, Skyler grows suspicious of Walt's recent activity.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "40:01"
                },
                {
                  "number": 3,
                  "season": 1,
                  "name": "S01 E03 · ...And the Bag's in the River",
                  "summary": "<p>Following an argument with Jesse, Walter is left to deal with Krazy-8 alone. After Marie raises concerns that Walt Jr is smoking cannabis, Hank shows him the dangers of drug use.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "40:50"
                },
                {
                  "number": 4,
                  "season": 1,
                  "name": "S01 E04 · Cancer Man",
                  "summary": "<p>The DEA becomes suspicious of a new drug kingpin. Walt reveals that he has cancer to Marie and Hank. Elsewhere, Jesse visits his estranged family.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "10:00"
                },
                {
                  "number": 5,
                  "season": 1,
                  "name": "S01 E05 · Gray Matter",
                  "summary": "<p>Walter and Skyler attend a former colleague's party, Jesse tries to free himself from the drugs, and Skyler organises an intervention for Walt.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "40:00"
                },
                {
                  "number": 6,
                  "season": 1,
                  "name": "S01 E06 · Crazy Handful of Nothin",
                  "summary": "<p>The side-effects of chemotherapy begin to plague Walt, who is also cooking meth again, and Jesse's friend, Skinny Pete, introduces him to a distributor named Tuco, but things go awry and Jesse ends up hospitalised.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "41:00"
                },
                {
                  "number": 7,
                  "season": 1,
                  "name": "S01 E07 · A No-Rough-Stuff-Type Deal",
                  "summary": "<p>Walter accepts his new identity as a drug dealer after a PTA meeting. Elsewhere, Jesse decides to put his aunt's house on the market, and Skyler is the recipient of a baby shower.</p>",
                  "image": {"medium": "assets/images/shows/show2.jpg"},
                  "airtime": "40:03"
                }
              ]
            }
          },
          {
            "id": 3,
            "name": "Emily in Paris",
            "image": "assets/images/shows/show3.jpg",
            "details": {
              "genres": ["Romantic", "Drama"],
              "cast": [
                {"person": {"name": "Lily Collins"}},
                {"person": {"name": "Ashley Park"}},
                {"person": {"name": "Lucas Bravo"}},
                {"person": {"name": "..."}}
              ],
              "year": "2020-10-02",
              "description": "<p>Chicago marketing executive Emily Cooper is hired to provide an American perspective at a marketing firm in Paris.</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "S01 E01 · Emily in Paris",
                  "summary": "<p>Marketing executive Emily Cooper brings a can-do American attitude to her new office in Paris, but she is hampered by her inability to speak French.</p>",
                  "image": {"medium": "assets/images/shows/show3.jpg"},
                  "airtime": "41:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "S01 E02 · Masculin Féminin",
                  "summary": "<p>Emily navigates the complexities of French amour after her enthusiasm at a work soirée attracts the attentions of a flirtatious -- and married -- client.</p>",
                  "image": {"medium": "assets/images/shows/show3.jpg"},
                  "airtime": "40:00"
                },
                {
                  "number": 3,
                  "season": 1,
                  "name": "S01 E03 · Sexy or Sexist",
                  "summary": "<p>Emily expresses her concerns over a risqué new ad campaign while juggling plumbing problems, French lessons and unpleasant coworkers.</p>",
                  "image": {"medium": "assets/images/shows/show3.jpg"},
                  "airtime": "41:00"
                }
              ]
            }
          },
          {
            "id": 4,
            "name": "How I Met Your Mother",
            "image": "assets/images/shows/show6.jpg",
            "details": {
              "genres": ["Drama", "Comedy"],
              "cast": [
                {"person": {"name": "Actor One"}},
                {"person": {"name": "Actor Two"}}
              ],
              "year": "2022-05-15",
              "description": "<p>Thrilling TV show description</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "Episode 1",
                  "summary": "<p>Episode 1 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "10:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "Episode 2",
                  "summary": "<p>Episode 2 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "11:00"
                },
                {
                  "number": 3,
                  "season": 1,
                  "name": "Episode 3",
                  "summary": "<p>Episode 3 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "11:00"
                },
                {
                  "number": 4,
                  "season": 1,
                  "name": "Episode 4",
                  "summary": "<p>Episode 4 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "11:00"
                },
                {
                  "number": 5,
                  "season": 1,
                  "name": "Episode 5",
                  "summary": "<p>Episode 5 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "11:00"
                }
              ]
            }
          },
          {
            "id": 5,
            "name": "TV Show Two",
            "image": "assets/images/shows/show5.jpg",
            "details": {
              "genres": ["Drama", "Thriller"],
              "cast": [
                {"person": {"name": "Actor One"}},
                {"person": {"name": "Actor Two"}}
              ],
              "year": "2022-05-15",
              "description": "<p>Thrilling TV show description</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "Episode 1",
                  "summary": "<p>Episode 1 summary</p>",
                  "image": {"medium": "assets/images/shows/show5.jpg"},
                  "airtime": "10:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "Episode 2",
                  "summary": "<p>Episode 2 summary</p>",
                  "image": {"medium": "assets/images/shows/show5.jpg"},
                  "airtime": "11:00"
                },
                {
                  "number": 3,
                  "season": 1,
                  "name": "Episode 3",
                  "summary": "<p>Episode 3 summary</p>",
                  "image": {"medium": "assets/images/shows/show5.jpg"},
                  "airtime": "11:00"
                },
                {
                  "number": 4,
                  "season": 1,
                  "name": "Episode 4",
                  "summary": "<p>Episode 4 summary</p>",
                  "image": {"medium": "assets/images/shows/show5.jpg"},
                  "airtime": "11:00"
                }
              ]
            }
          },
          {
            "id": 6,
            "name": "TV Show Two",
            "image": "assets/images/shows/show6.jpg",
            "details": {
              "genres": ["Drama", "Thriller"],
              "cast": [
                {"person": {"name": "Actor One"}},
                {"person": {"name": "Actor Two"}}
              ],
              "year": "2022-05-15",
              "description": "<p>Thrilling TV show description</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "Episode 1",
                  "summary": "<p>Episode 1 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "10:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "Episode 2",
                  "summary": "<p>Episode 2 summary</p>",
                  "image": {"medium": "assets/images/shows/show6.jpg"},
                  "airtime": "11:00"
                }
              ]
            }
          },
          {
            "id": 7,
            "name": "TV Show Two",
            "image": "assets/images/shows/show7.jpg",
            "details": {
              "genres": ["Drama", "Thriller"],
              "cast": [
                {"person": {"name": "Actor One"}},
                {"person": {"name": "Actor Two"}}
              ],
              "year": "2022-05-15",
              "description": "<p>Thrilling TV show description</p>",
              "episodes": [
                {
                  "number": 1,
                  "season": 1,
                  "name": "Episode 1",
                  "summary": "<p>Episode 1 summary</p>",
                  "image": {"medium": "assets/images/shows/show7.jpg"},
                  "airtime": "10:00"
                },
                {
                  "number": 2,
                  "season": 1,
                  "name": "Episode 2",
                  "summary": "<p>Episode 2 summary</p>",
                  "image": {"medium": "assets/images/shows/show7.jpg"},
                  "airtime": "11:00"
                }
              ]
            }
          }                    
        ]
      },

      {
        "title": "Movies",
        "items": [
          {
            "id": 1,
            "name": "Black Mirror",
            "image": "assets/images/movies/movie1.jpg",
            "details": {
              "genres": ["Sci-Fin", "Thriller"],
              "cast": [
                {"person": {"name": "Bryce Dallas Howard"}},
                {"person": {"name": "Alex Lawther"}},
                {"person": {"name": "Hayley Atwell"}},
                {"person": {"name": "..."}}
              ],
              "year": "2011-12-04",
              "description": "<p>In an abstrusely dystopian future, several individuals grapple with the manipulative effects of cutting edge technology in their personal lives and behaviours.</p>",
              "episodes": [
                           
              ]
            }
          },
          {
            "id": 2,
            "name": "Death Note",
            "image": "assets/images/movies/movie2.jpg",
            "details": {
              "genres": ["Horror", "Fantasy"],
              "cast": [
                {"person": {"name": "Nat Wolff"}},
                {"person": {"name": "Willem Dafoe"}},
                {"person": {"name": "LaKeith Stanfield"}},
                {"person": {"name": "..."}}
              ],
              "year": "2017-08-24",
              "description": "<p>The god of death presents Light, a student, with a diary which can kill those whose name is written on its pages. Soon, he inches towards trouble when strange killings attract a detective's attention.</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 3,
            "name": "The Green Mile",
            "image": "assets/images/movies/movie3.jpg",
            "details": {
              "genres": ["Drama", "Thriller"],
              "cast": [
                {"person": {"name": "Tom Hanks"}},
                {"person": {"name": "Micheal Clarke"}},
                {"person": {"name": "David Morse"}},
                {"person": {"name": "..."}}
              ],
              "year": "1999-12-06",
              "description": "<p>Paul Edgecomb, the head guard of a prison, meets an inmate, John Coffey, a black man who is accused of murdering two girls. His life changes drastically when he discovers that John has a special gift.</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 4,
            "name": "Joker",
            "image": "assets/images/movies/movie6.jpg",
            "details": {
              "genres": ["Crime", "Thriller"],
              "cast": [
                {"person": {"name": "Joaquin Phoenix"}},
                {"person": {"name": "Robert De Niro"}},
                {"person": {"name": "Zazie Beetz"}},
                {"person": {"name": "..."}}
              ],
              "year": "2019-10-04",
              "description": "<p>Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.</p>",
              "episodes": [
                
              ]
            }
          },
          {
            "id": 5,
            "name": "Hatty Potter",
            "image": "assets/images/movies/movie5.jpg",
            "details": {
              "genres": ["Drama", "Thriller"],
              "cast": [
                {"person": {"name": "Actor One"}},
                {"person": {"name": "Actor Two"}}
              ],
              "year": "2022-05-15",
              "description": "<p>Thrilling TV show description</p>",
              "episodes": [
                
              ]
            }
          }
        ]
      }
    ]
    ''';

    // Parsing the mock data
    List<dynamic> jsonResponse = json.decode(mockData);
    return jsonResponse.map((movie) => ItemModel.fromJson(movie)).toList();
  }

  Future<Result> fetchOne(int id) async {
    // Hardcoded movie detail data for a specific movie
    final String mockData = '''
    {
      "id": $id,
      "name": "Movie Detail $id",
      "image": "assets/images/movies/movie1.jpg",
      "details": {
        "genres": ["Action"],
        "cast": [
          {"person": {"name": "Actor $id"}}
        ],
        "year": "2020-01-01",
        "description": "<p>This is a detailed description of movie $id.</p>",
        "episodes": [
          {
            "number": 1,
            "season": 1,
            "name": "Episode 1",
            "summary": "<p>Episode 1 summary</p>",
            "image": {"medium": "assets/images/movies/movie1.jpg"},
            "airtime": "12:00"
          }
        ]
      }
    }
    ''';

    // Parsing the mock data
    Map<String, dynamic> jsonResponse = json.decode(mockData);
    return Result.fromJson(jsonResponse);
  }
}
