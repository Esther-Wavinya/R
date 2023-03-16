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
