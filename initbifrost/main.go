package main

import (
	"database/sql"
	"log"
	"io/ioutil"
	"strings"
	_ "github.com/lib/pq"
	"fmt"
	"os"
)

func main()  {
	dbUrl := os.Getenv("DB_URL")
	db, err := sql.Open("postgres", dbUrl)
	if err != nil {
		log.Fatal(fmt.Sprintf("Cannot parse db-url: `%s`", dbUrl))
	}

	dumpFile := os.Getenv("DB_DUMP_FILE")
  log.Print(dumpFile)
	file, err := ioutil.ReadFile(dumpFile)
	if err != nil {
    log.Print(err)
    log.Fatal(fmt.Sprintf("Cannot open sql-dump: `%s`", dumpFile))
	} else {
    log.Print(fmt.Sprintf("Dump file OK: `%s`", dumpFile))
  }

	requests := strings.Split(string(file), ";")

	// TODO: put it in transaction
	for _, request := range requests {
		_, err := db.Exec(request)
		if err != nil {
			log.Fatal(err)
		}
	}

	ethereumLastBlock := os.Getenv("ETHEREUM_LAST_BLOCK")
	if ethereumLastBlock != "" {
		_, err := db.Exec("UPDATE key_value_store SET value = $1 WHERE key = $2", ethereumLastBlock, "ethereum_last_block")
		if err != nil {
			log.Fatal(err)
		}
	}

	bitcoinLastBlock := os.Getenv("BITCOIN_LAST_BLOCK")
	if bitcoinLastBlock != "" {
		_, err := db.Exec("UPDATE key_value_store SET value = $1 WHERE key = $2", bitcoinLastBlock, "bitcoin_last_block")
		if err != nil {
			log.Fatal(err)
		}
	}
}
