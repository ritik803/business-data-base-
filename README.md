# 🗃️ SQL Practice Database

A MySQL practice database and structured question set for building SQL skills — from basic queries to window functions, correlated subqueries, and hierarchical self-joins.

---

## 📌 Overview

This project provides two realistic, interconnected schemas for practicing scenario-based SQL queries of the kind commonly used in technical interviews and real-world reporting:

- **Company schema** — HR/organizational data, including a self-referencing employee-manager hierarchy
- **Sales schema** — e-commerce style transactional data (customers, orders, products)

All data uses Indian names and INR pricing.

---

## 🧱 Schema

### Company
| Table | Description |
|---|---|
| `departments` | Department ID, name, location |
| `employees` | Employee details, salary, department, and manager (self-referencing FK) |
| `projects` | Projects run by each department, with budgets and timelines |
| `employee_projects` | Many-to-many mapping of employees to projects, with hours logged and role |

### Sales
| Table | Description |
|---|---|
| `customers` | Customer details and signup info |
| `products` | Product catalog with category and price |
| `orders` | Orders placed, with status (completed / cancelled / pending) |
| `order_items` | Line items per order — product, quantity, unit price |

---

## 🎯 Question Set

31 questions across 7 progressive difficulty levels:

| Level | Focus Area |
|---|---|
| 1 | Basic `SELECT`, `WHERE`, `ORDER BY` |
| 2 | `JOIN`s across related tables |
| 3 | `GROUP BY`, `HAVING`, aggregate functions |
| 4 | Scalar & correlated subqueries, set logic |
| 5 | Self-joins, employee-manager hierarchies |
| 6 | Window functions — `RANK()`, `DENSE_RANK()`, `LAG`/`LEAD`, running totals |
| 7 | Interview-style edge cases — tie-safe ranking, pivoting, month-over-month trends |

Each question mirrors real-world query patterns rather than textbook syntax drills.

---

## 📂 Repository Structure

```
├── practice_db_mysql.sql     # Full schema + seed data (MySQL)
├── practice_db.sql           # SQLite-compatible version
├── practice_questions.md     # All 31 practice questions
├── answers.md                # Verified solutions with explanations
└── README.md
```

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   ```

2. **Load the database in MySQL Workbench**
   - Open MySQL Workbench and connect to your local server
   - `File → Open SQL Script` → select `practice_db_mysql.sql`
   - Execute the script (⚡) to create the `sql_practice` database

3. **Start querying**
   ```sql
   USE sql_practice;
   ```
   Work through `practice_questions.md` level by level, and check answers against `answers.md`.

---

## 🛠️ Tech Stack

- **Database:** MySQL (also compatible with SQLite)
- **Tooling:** MySQL Workbench

---

## 📄 License

Free to fork and use.
