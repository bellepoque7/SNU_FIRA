class Movie:

    def __init__(self, name, year, director, budget, actor):
        self.movie_name = name
        self.movie_year = year
        self.movie_director = director
        self.movie_budget = budget
        self.actor = actor

    def get_starts(self):
        print('{}'.format(self.movie_name))
        for star in self.actor:
            print(star)

movies = []
movies.append(Movie('Interstellar', 2014, 'Chistoper Nolan', '$165,000,000',
                ['Matthew McConaughey', 'Anne Hathaway','Jessica Chastain']))

for movie in movies:
    print('{}'.format(movie.movie_name))
    print('{}'.format(movie.movie_year))

movie.get_starts()