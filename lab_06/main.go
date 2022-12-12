package main

import "bmstu_db/lab_06/sql"

func main() {
	println("CONNECTING...")
	db, err := sql.Connect()
	if err != nil {
		panic(err)
	}
	defer db.Close()
	println("\n\n1:")
	err = sql.Sql1(db)
	if err != nil {
		panic(err)
	}
	println("\n\n2:")
	err = sql.Sql2(db)
	if err != nil {
		panic(err)
	}
	println("\n\n3:")
	err = sql.Sql3(db)
	if err != nil {
		panic(err)
	}
	println("\n\n4:")
	err = sql.Sql4(db)
	if err != nil {
		panic(err)
	}
	println("\n\n5:")
	err = sql.Sql5(db)
	if err != nil {
		panic(err)
	}
	println("\n\n6:")
	err = sql.Sql6(db)
	if err != nil {
		panic(err)
	}
	println("\n\n7:")
	err = sql.Sql7(db)
	if err != nil {
		panic(err)
	}
	println("\n\n8:")
	err = sql.Sql8(db)
	if err != nil {
		panic(err)
	}
	println("\n\n9:")
	err = sql.Sql9(db)
	if err != nil {
		panic(err)
	}
	println("\n\n10:")
	err = sql.Sql10(db)
	if err != nil {
		panic(err)
	}
}
