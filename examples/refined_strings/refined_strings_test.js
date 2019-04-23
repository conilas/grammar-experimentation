let Zipcode be the Universe String where length is 14 and format is "d9*d3" //means 000000000*000
let Price be the Universe String where format is "d1,d1" //means 0,0
let Name be the Universe String where length < 15

let Purchase be the Product where zipcode is Zipcode, price is Price

let Purchase be the Product where {
  zipcode is Zipcode, price is Price
}

let Purchase be the Product having Zipcode, Price and Name

//we perform some random calculation here
let calc_ship be the Fn of Price (purchase is Purchase) => {
  purchase.price //pretend we've done some extensive calculation
}
