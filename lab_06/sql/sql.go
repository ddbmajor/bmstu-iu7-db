package sql

import (
	"database/sql"
	_ "github.com/lib/pq"
)

func Connect() (*sql.DB, error) {
	connStr := "user=ddbmajor password=nick202002 dbname=bmstu_db_lab_01 sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		return nil, err
	}
	return db, nil
}

func Sql1(db *sql.DB) error {
	rows, err := db.Query("SELECT 123")
	if err != nil {
		return err
	}
	var res string
	for rows.Next() {
		rows.Scan(&res)
		println(res)
	}
	return nil
}

func Sql2(db *sql.DB) error {
	var query = `SELECT DISTINCT
			C1.id,
			C1.name
		FROM
			public.book AS C1
		JOIN public.genre AS C2 ON C1.genre = C2.id
		WHERE
			C1.year > 2015
		AND C2.name = 'Вузовская'
		ORDER BY
			C1.name,
			C1.id;`
	rows, err := db.Query(query)
	if err != nil {
		return err
	}
	var id string
	var name string
	for rows.Next() {
		err = rows.Scan(&id, &name)
		if err != nil {
			return err
		}
		println(id, name)
	}
	return nil
}

func Sql3(db *sql.DB) error {
	var query = `WITH CTE(reader, books_owned) AS (
        		SELECT
            		reader,
            		COUNT(id)
        		FROM
            		public.book
        		GROUP BY
            		reader
    			)
				SELECT
    				AVG(books_owned) AS "AVG"
				FROM
    				CTE;`
	rows, err := db.Query(query)
	if err != nil {
		return err
	}
	var avg string
	for rows.Next() {
		err = rows.Scan(&avg)
		if err != nil {
			return err
		}
		println(avg)
	}
	return nil
}

func Sql4(db *sql.DB) error {
	var query = `SELECT p.proname
                FROM pg_proc p
                WHERE p.pronargs > 5;`
	rows, err := db.Query(query)
	if err != nil {
		return err
	}
	var avg string
	for rows.Next() {
		err = rows.Scan(&avg)
		if err != nil {
			return err
		}
		println(avg)
	}
	return nil
}

func Sql5(db *sql.DB) error {
	rows, err := db.Query("SELECT bookowned(5)")
	if err != nil {
		return err
	}
	var res string
	for rows.Next() {
		rows.Scan(&res)
		println(res)
	}
	return nil
}

func Sql6(db *sql.DB) error {
	rows, err := db.Query("SELECT name FROM public.booksOwnedBy(25)")
	if err != nil {
		return err
	}
	var res string
	for rows.Next() {
		rows.Scan(&res)
		println(res)
	}
	return nil
}

func Sql7(db *sql.DB) error {
	_, err := db.Query("CALL proc_recursive(4)")
	if err != nil {
		return err
	}
	rows, err := db.Query("SELECT * FROM public.employee")
	if err != nil {
		return err
	}
	var id, fname, lname, title, dep, manager string
	for rows.Next() {
		rows.Scan(&id, &fname, &lname, &title, &dep, &manager)
		println(id, fname, lname, title, dep, manager)
	}
	return nil
}

func Sql8(db *sql.DB) error {
	rows, err := db.Query("SELECT gen_random_uuid();")
	if err != nil {
		return err
	}
	var res string
	for rows.Next() {
		rows.Scan(&res)
		println(res)
	}
	return nil
}

func Sql9(db *sql.DB) error {
	query := `
				CREATE TABLE IF NOT EXISTS broken_books
                (
                    id INT primary key,
    				name TEXT,
    				why_broken TEXT
                );`
	_, err := db.Exec(query)
	if err != nil {
		return err
	}
	return nil
}

func Sql10(db *sql.DB) error {
	query := `
				INSERT INTO broken_books(id, name, why_broken)
                VALUES (2,'qwer', 'fffff')`
	_, err := db.Query(query)
	if err != nil {
		return err
	}
	rows, err := db.Query("SELECT * FROM broken_books")
	if err != nil {
		return err
	}
	var id, name, why string
	for rows.Next() {
		rows.Scan(&id, &name, &why)
		println(id, name, why)
	}
	return nil
}
