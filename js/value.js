let chance = Math.floor(Math.random() * 100);

if (chance < 60) {
  var value = Math.floor(Math.random() * 51);
} else if (chance < 90) {
  var value = Math.floor(Math.random() * 10001);
} else {
  var value = Math.floor(Math.random() * 100000001);
}

let pennies = Math.floor(Math.random() * 99);

let value_pretty = value.toLocaleString("en-US");

document.getElementById("id-concept").innerHTML =
  "$" + value_pretty + "." + pennies;
  