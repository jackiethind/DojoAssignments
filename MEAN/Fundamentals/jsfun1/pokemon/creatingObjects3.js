function VehicleConstructor(name, numOfWheels, numOfPassengers, speed) {
/*
Addition of properties to vehicle.
*/
  if (!(this instanceof VehicleConstructor)) {
   // the constructor was called without "new".
    return new VehicleConstructor(name, numOfWheels, numOfPassengers, speed);
  }
// PRIVATE
  var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";



// PUBLIC
  this.distance_travelled = 0;
  this.name = name || "unicycle";
  this.numOfWheels = numOfWheels || 1;
  this.numOfPassengers = numOfPassengers || 0;
  this.speed = speed;

  this.vin = createVin();

  function createVin(){
      var vin = "";
      for (var i = 0; i < 17; i+=1){
          vin +=chars[Math.floor(Math.random()*35)];
      }
      return vin;
  }

}
VehicleConstructor.prototype.updateDistanceTravelled = function () {
    console.log("you are traveling at a speed of: " + this.speed);
    // console.log("this is a private method " + _this.name);
    this.distance_travelled += this.speed;
    console.log(this.distance_travelled);
    return this;
};
VehicleConstructor.prototype.makeNoise = function () {
    console.log(this.name + " makes the sound: Vrooooom!");
    return this;
};

VehicleConstructor.prototype.move = function () {
    this.updateDistanceTravelled();
    this.makeNoise();
    return this;
};
VehicleConstructor.prototype.checkMiles = function () {
    console.log(this.distance_travelled);
    return this;
};
                      // Create the Bike Vehicle
var bike = new VehicleConstructor("Bike", 2, 1, 50);


bike.move();
bike.move();
bike.checkMiles();
console.log(bike.vin);
