X <- 42
X


my_apples <- 5
my_oranges <- "six"

my_apples + my_oranges

my_fruit = my_apples + my_oranges
my_fruit

my_numeric <- 42
my_character <- "universe"
my_logical = FALSE

class(my_numeric)
class(my_character)
class(my_logical)


numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)


some_vector <- c("John Doe", "poker player")
names(some_vector) <- c("Name", "Profession")
some_vector["Name"]
some_vector["Profession"]



poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)

names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
poker_vector["Monday"]
roulette_vector["Thursday"]

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- c(days_vector)
names(roulette_vector) <- c(days_vector)
poker_vector[days_vector]
roulette_vector[days_vector]

c(1, 2,3) + c(4, 5, 6)
c(1 + 4, 2 + 5, 3 + 6)
c(5, 7, 9)


a <- c(1, 2, 3)
b <- c(4, 5, 6)
c <- c(a + b)
c

A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

total_vector <- c(A_vector + B_vector)
total_vector

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- c(days_vector)
names(roulette_vector) <- c(days_vector)
total_daily <- c(poker_vector + roulette_vector)
total_daily


total_poker <- sum(poker_vector)
total_poker
total_roulette <- sum(roulette_vector)
total_roulette

total_week <- c(total_poker + total_roulette)
total_week


poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- c(days_vector)
names(roulette_vector) <- c(days_vector)
total_daily <- c(poker_vector + roulette_vector)
total_daily
total_poker <- sum(poker_vector)
total_poker
total_roulette <- sum(roulette_vector)
total_roulette
total_poker > total_roulette

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50,100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- c(days_vector)
names(roulette_vector) <- c(days_vector)

poker_wednesday <- c(poker_vector[3])
poker_wednesday

poker_vector[c(1, 5)]


poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
poker_midweek <- poker_vector[c(2, 3, 4)]
poker_midweek

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
roulette_selection_vector <- roulette_vector[c(2:5)]
roulette_selection_vector

poker_vector[c("Monday", "Tuesday")]

poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
poker_vector[c("Monday", "Tuesday", "Wednesday")]
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]
poker_start
mean(poker_start)


c(4, 5, 6) > 5


poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector
selection_vector <- c(poker_vector > 1)
selection_vector
poker_vector[selection_vector]
poker_winning_days <- poker_vector[selection_vector]
poker_winning_days

matrix(1:9, byrow = TRUE, nrow = 3)

matrix(1:9, byrow = FALSE, nrow = 3)


new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
box_office <- c(new_hope, empire_strikes, return_jedi)
stars_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE)
stars_wars_matrix


new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi))
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
colnames(star_wars_matrix) <- region
rownames(star_wars_matrix) <- titles
star_wars_matrix

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix
