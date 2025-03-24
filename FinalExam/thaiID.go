package main

import "fmt"

func calcThaiIdChecksum(id []uint) uint {
	if len(id) != 13 {
		return 99
	}
	var sum uint = 0
	var i uint = 0
	for ; i < 12; i++ {
		sum += (13 - i) * id[i]
	}
	return (11 - (sum % 11)) % 10
}

func main() {

	id := []uint{1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 1}

	fmt.Printf("calcThaiIdChecksum %v is %d", id, calcThaiIdChecksum(id))
}
