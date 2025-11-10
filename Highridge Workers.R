set.seed(123)

tryCatch({
  
  # Step 1: Define vectors of first and last names
  first_names <- c(
    "James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda",
    "William", "Elizabeth", "David", "Barbara", "Richard", "Susan", "Joseph", "Jessica",
    "Thomas", "Sarah", "Charles", "Karen", "Daniel", "Nancy", "Matthew", "Lisa",
    "Anthony", "Betty", "Mark", "Sandra", "Donald", "Ashley", "Steven", "Kimberly",
    "Paul", "Emily", "Andrew", "Donna", "Joshua", "Michelle", "Kenneth", "Carol"
  )
  
  last_names <- c(
    "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis",
    "Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson",
    "Thomas", "Taylor", "Moore", "Jackson", "Martin", "Lee", "Perez", "Thompson",
    "White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson", "Walker",
    "Young", "Allen", "King", "Wright", "Scott", "Torres", "Nguyen", "Hill"
  )
  
  # Step 2: Create a data frame of 400 workers
  n_workers <- 400
  genders <- c("Male", "Female")
  
  workers <- data.frame(
    id     = 1:n_workers,
    name   = paste(
      sample(first_names, n_workers, replace = TRUE),
      sample(last_names,  n_workers, replace = TRUE)
    ),
    gender = sample(genders, n_workers, replace = TRUE),
    salary = sample(5000:30000, n_workers, replace = TRUE),
    stringsAsFactors = FALSE
  )
  
  # Step 3: Conditional logic for employee level
  workers$level <- ifelse(
    workers$salary > 10000 & workers$salary < 20000,
    "A1",
    ifelse(
      workers$salary > 7500 & workers$salary < 30000 & workers$gender == "Female",
      "A5-F",
      "B2"
    )
  )
  
  # Step 4: Print payment slips
  for (i in 1:nrow(workers)) {
    cat("Payment Slip for", workers$name[i], "\n")
    cat("Gender: ", workers$gender[i], "\n", sep = "")
    cat("Weekly Salary: $", workers$salary[i], "\n", sep = "")
    cat("Employee Level: ", workers$level[i], "\n", sep = "")
    cat(strrep("-", 40), "\n\n")
  }
  
}, error = function(e) {
  cat("An error occurred while generating payment slips:", e$message, "\n")
})

print(workers)