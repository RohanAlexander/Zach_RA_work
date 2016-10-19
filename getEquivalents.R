########################################
# This script gathers data on derivatives of names from Behind the Name - http://www.behindthename.com/
# The data will be used to study the impact of immigration. The names are needed to homogenize names that perhaps should be the same but were written differently. 
# The data is available as HTML with a table of results for each name on a different page - this script just makes it usable in a different format.
# The data will not be made available independently of Behind the Name, it will just be used to make the analysis quicker and then deleted.
# Author: Rohan Alexander
# Email: rohan.alexander@anu.edu.au
# Date: 18 October 2016
########################################

#install.packages("rvest")
#install.packages("magrittr")

library(rvest)
library(magrittr)

# Change working directory
setwd("~/Dropbox/PhD/Zach/Test")

# Initialize a vector that contains the numbers of each page that the script should go through (adjust the middle number to change where it ends).
pages <- c("Giuseppe", "Antonio", "Francesco", "Giovanni", "John", "Salvatore", "Josef", "Vincenzo", "Luigi", "Guiseppe", "Domenico", "Jan", "Michele", "Pietro", "William", "James", "Angelo", "Antonino", "David", "Pasquale", "Joseph", "George", "Nicola", "Thomas", "Franz", "Robert", "Abram", "Jacob", "Gaetano", "Karl", "Johann", "Chaim", "Anton", "Stanislaw", "Albert", "Peter", "Raffaele", "Carl", "Vito", "Janos", "Arthur", "Charles", "Edward", "Jose", "Johan", "Samuel", "Jankel", "Alexander", "Mario", "Carmine", "Stefan", "Paolo", "Carlo", "Abraham", "Filippo", "Alfred", "Michael", "Leib", "Paul", "Johannes", "Henry", "Aron", "Harry", "Moische", "Israel", "Carmelo", "Rocco", "Alfonso", "Frank", "Rosario", "Heinrich", "Alfredo", "Rudolf", "Wilhelm", "Walter", "Moses", "Andrea", "Michal", "Louis", "Calogero", "Otto", "Giacomo", "Emil", "Martin", "Richard", "Leon", "Hans", "Patrick", "Adolf", "Leonardo", "Donato", "Georg", "Jakob", "Francisco", "Alberto", "Hersch", "Ernesto", "Emilio", "Wm", "Georges", "Mihaly", "Sebastiano", "Simon", "Stefano", "Daniel", "Mendel", "Manuel", "Nicolo", "Ivan", "Ernest", "Elias", "August", "Lorenzo", "Felice", "Michel", "Benjamin", "Oscar", "Jozef", "Ernst", "Umberto", "Victor", "Jean", "Adam", "Agostino", "Enrico", "Wladyslaw", "Harold", "Eugenio", "Friedrich", "Santo", "Vittorio", "Wolf", "Antoni", "Erik", "Isaac", "Gustav", "Max", "Andras", "Nils", "Tommaso", "Herbert", "Alessandro", "Jossel", "Hendrik", "Mariano", "Leiser", "Gennaro", "Frederick", "Herman", "Andrew", "Ignazio", "Andreas", "Fritz", "Juan", "Alois", "Pieter", "Christian", "Matteo", "Arturo", "Francis", "Armando", "Jozsef", "Wladislaw", "Salomon", "Ludwig", "Willem", "Guido", "Saverio", "Hermann", "Bernard", "Berl", "Jack", "Gustaf", "Ferdinando", "Cornelis", "Giorgio", "Biagio", "Benedetto", "Meyer", "Maurice", "Axel", "Ole", "Hugh", "Meier", "Bruno", "Julius", "Dawid", "Franciszek", "Leonard", "Hirsch", "Srul", "Gaspare", "Eduard", "Morris", "Attilio", "Cesare", "Fred", "Karel", "Henri", "Georgios", "Carlos", "Gyorgy", "Natale", "Istvan", "Ferdinand", "Isak", "Anders", "Norman", "Leopold", "Stanley", "Willie", "Boruch", "Dimitrios", "Gerardo", "Mordche", "Alex", "Luis", "Olaf", "Piotr", "Schmul", "Nicolas", "Rafael", "Bronislaw", "Ciro", "Eduardo", "Nicolaos", "Constantinos", "Frans", "Iwan", "Jonas", "Vaclav", "G", "Philip", "Roberto", "Frantisek", "Vincenso", "Leibe", "Maria", "Adolfo", "Eric", "Silvio", "Isaak", "Gerrit", "Federico", "Felix", "Marco", "Augusto", "Leo", "Schmuel", "Rene", "Sven", "Panagiotis", "Ettore", "Boleslaw", "Pal", "Lars", "Nathan", "Willy", "Thos", "Jens", "Giulio", "Oskar", "Reginald", "Fortunato", "Arnold", "Gino", "Nunzio", "Leslie", "Girolamo", "Moise", "Emile", "Hugo", "Manoel", "Rubin", "Bernardo", "Motel", "Amedeo", "Fernando", "Christos", "Michelangelo", "Pedro", "Costantino", "Pierre", "Gioacchino", "Raymond", "Donald", "Emanuel", "Guglielmo", "Elie", "Miguel", "Itzik", "Schloime", "Luciano", "Solomon", "Arcangelo", "Marcel", "Joao", "Jules", "Sidney", "Josel", "Jas", "Josip", "Theodor", "Percy", "Moritz", "Welwel", "Cyril", "Franc", "Julian", "Gabriele", "Bernhard", "Edmund", "Edwin", "Judel", "Bartolomeo", "Camillo", "Cosimo", "Niels", "Karol", "Battista", "Per", "Gabriel", "Dirk", "Sam", "Orazio", "Serafino", "Einar", "Harald", "Andre", "Kenneth", "Dante", "Aniello", "Vassilios", "Erich", "Itzig", "Ronald", "Oreste", "Berel", "Jacobus", "Herschel", "Petar", "Diego", "Ugo", "Wilfred", "Alfio", "Mathias", "Gunnar", "Roman", "Mottel", "Kasimir", "Emanuele", "Americo", "Ferencz", "Pawel", "Tomas", "Wasyl", "Eugen", "Cecil", "Schmiel", "Robt", "Francois", "Achille", "Knut", "Arne", "Marko", "Constantin", "Nikola", "Waclaw", "Douglas", "Alfons", "Enrique", "Demetrios", "Sydney", "Peder", "Jankiel", "Aldo", "Marino", "Klaas", "Orlando", "Miklos", "Kristian", "Edgar", "Joe", "Abe", "Mojsche", "Czeslaw", "Elia", "Selig", "Pavel", "Awrum", "Julio", "Gottlieb", "Joel", "Andrej", "Geo", "Renato", "Giuseppi", "Gerard", "Franjo", "Chane", "Edmond", "Petrus", "Gregorio", "Marcus", "Hyman")

pages <- c(pages, "Marinus", "Werner", "Theodoros", "Angel", "Wojciech", "Valentino", "Chas", "Joannis", "Isidor", "Sandor", "Nochem", "Jorge", "Ramon", "Lajos", "Lewis", "Ian", "Ludwik", "Josif", "Matthew", "Markus", "Clifford", "Lawrence", "Alf", "Vincent", "Leizer", "Conrad", "Scholem", "Arie", "Simche", "Rodolfo", "Sigmund", "Ralph", "Horace", "Sigurd", "Kurt", "Eugene", "Leopoldo", "Riccardo", "Aurelio", "Kalman", "Filip", "Onofrio", "Haim", "Meische", "Antonios", "Denis", "Virgilio", "Martino", "Egidio", "Ivar", "Erling", "Petro", "Mate", "Allan", "Rolf", "Idel", "Albin", "Gordon", "Morduch", "Hjalmar", "Youssef", "Pellegrino", "Giov", "Viktor", "Olof", "Frederik", "Archibald", "Jacques", "Roy", "Antal", "Ricardo", "Michail", "Auguste", "Karoly", "Arvid", "Giacinto", "Willi", "Davide", "Italo", "Henryk", "Tom", "Gottfried", "Gerald", "Konrad", "Yankel", "Gustavo", "Henrik", "Stephen", "Antonin", "Loreto", "Schaje", "Hector", "Jaroslav", "Adriaan", "Errico", "Hubert", "Chaskel", "Lazar", "Guilio", "Teodor", "Stanislaus", "Clarence", "Primo", "Franco", "Nachman", "Froim", "Gilbert", "Cataldo", "Mechel", "Christopher", "Reinhold", "Alter", "Gustave", "Milan", "Fischel", "Bela", "Juda", "Stavros", "Clemente", "Sabatino", "Calagero", "Dominico", "Feiwel", "Abrahm", "Antonia", "Fernand", "Roger", "Sabato")

# The URL looks like http://www.behindthename.com/name/Francesco/related and it's just the name that needs to iterate.

# Loop through the pages of results
for (page in pages) {
  url <- paste0("http://www.behindthename.com/name/", page, "/related")  
  # Parse the html
  page_table <- url %>% read_html()
  # Look for table tags
  page_data <- page_table %>% html_nodes("b , .ngl")
  # Get the text
  page_text <- html_text(page_data)
  # Save the names
  setwd("~/Dropbox/PhD/Zach/Test/temp")
  file_name = paste(page, ".Rda", sep = "")
  save(page_text, file = file_name)
  print(paste("Done with page", page, "at", Sys.time()))
  # Space out each request by 10 seconds
  if (length(pages) != match(page, pages)) {
    Sys.sleep(5)
  } else {
    print("All done!")
  }
  # Clean up
  rm(url, page_table, page_data, page_text, file_name, page)
}
