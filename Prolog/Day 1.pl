/*
   Prolog Day 1 Solutions
   Nathaniel Morrow
   Due 4/30/2021
*/

/* make a knowlege base to represent your favorite books and authors
   Find all books in your knowlege base written by one author */

wrote(knuth, the_art_of_programming).
wrote(riordan, the_lightning_theif).
wrote(riordan, sea_of_monsters).
wrote(paolini, eragon).
wrote(tolkien, the_hobbit).
wrote(tolkien, the_silmarillion).
wrote(tolkien, the_return_of_the_king).

/* find books by tolkien:
   wrote(tolkien, What).
   a */

/* make a knowlege base representing musicians and instraments and genres
   Find all musicians who play guitar */

plays(mozart, piano).
plays(bach, piano).
plays(ellington, piano).
plays(hendrix, guitar).
plays(page, guitar).


genre(mozart, classical).
genre(bach, classical).
genre(ellington, jazz).
genre(hendrix, rock).
genre(page, rock).

/* find musicians who play guitar:
   plays(What, guitar).
   a */

taught(kosa, csc4010, sec001, 202110, 30, slc1201, mwf, 230, 55).
