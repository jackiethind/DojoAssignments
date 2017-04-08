function VehicleConstructor(name, numOfWheels, numOfPassengers) {
  var vehicle = {};     // the object that will eventually be returned
/*
Addition of properties to vehicle.
*/
  vehicle.name = name;
  vehicle.numOfWheels = numOfWheels;
  vehicle.numOfPassengers = numOfPassengers;
/*
Addition of methods to ninja
*/
  vehicle.makeNoise = function() {
    console.log("Vrooooom!");
  }
/*
return ninja
*/
  return vehicle;
}


                      // Create the Bike Vehicle
var bike = VehicleConstructor("Bike", 2, 1 );
bike.makeNoise = function () {
    console.log("ring ring...ring ring");
};
bike.makeNoise();

                      // Create the Sedan Vehicle
var sedan = VehicleConstructor("Sedan", 4, 5);
sedan.makeNoise = function () {
    console.log("Honk Honk...Honk Honk");
}
sedan.makeNoise();

var Bus = VehicleConstructor("Bus", 6, 26);
Bus.pickUp = function (newPassengers) {
    Bus.numOfPassengers += newPassengers;
    console.log(Bus.numOfPassengers);
}
Bus.pickUp(2);
