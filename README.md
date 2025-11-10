# Payment Slip Generator

This project contains a simple worker **payment slip generator** implemented in R (converted from an original Python script).

It simulates a list of workers with:
- Randomly generated names  
- Randomly assigned gender  
- Random weekly salaries  

For each worker, it then:
- Determines their **employee level** based on salary and gender  
- Prints a formatted **payment slip** to the console  

---

## Features

- Generates data for **400 workers**
- Randomly combines common **first** and **last** names
- Randomly assigns **gender** (`Male` / `Female`)
- Randomly assigns **weekly salary** between **5,000** and **30,000**
- Applies conditional logic to set an employee **level**:
  - `A1`  → salary between 10,000 and 20,000  
  - `A5-F` → salary between 7,500 and 30,000 **and** gender is Female  
  - `B2`  → all other cases
- Prints a clear, human-readable **Payment Slip** for each worker

---

## File Structure

You can name your main R script e.g.:

- `payment_slips.R`  
  Contains:
  - Name lists
  - Worker data frame creation
  - Level assignment logic
  - Loop to print payment slips
  - Basic error handling using `tryCatch`

---

## Requirements

- **R** (version 3.6+ recommended, but any recent version should work)
- No additional packages are required (base R only).

---

## How It Works

1. **Name Vectors**

   The script defines two character vectors:
   - `first_names` – common first names  
   - `last_names` – common surnames  

2. **Worker Generation**

   It then creates a data frame `workers` with 400 rows, containing:
   - `id` – 1 to 400  
   - `name` – random combination of first and last name  
   - `gender` – randomly selected from `"Male"` or `"Female"`  
   - `salary` – random integer between 5000 and 30000  

3. **Employee Level Logic**

   A new column `level` is created using nested `ifelse` statements:

   ```r
   workers$level <- ifelse(
     workers$salary > 10000 & workers$salary < 20000,
     "A1",
     ifelse(
       workers$salary > 7500 & workers$salary < 30000 & workers$gender == "Female",
       "A5-F",
       "B2"
     )
   )
