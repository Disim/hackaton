List<Device> devices = [
  Device(serialNumber: 'XUM0T-NX4SS-J9S8G', developer: "Ujin"),
  Device(type: 1, serialNumber: 'XDS9D-AIKV9-BHOK5', developer: "Ujin")
];

///type 0 - co2, 1 - lamp, 2 - switch
class Device {
  Device(
      {this.type = 0,
      this.state = 0,
      this.location = '',
      this.temperature = 0,
      this.humidity = 0,
      this.airQuality = 0,
      this.co2 = 0,
      this.developer = '',
      this.serialNumber = ''});
  int type, state;
  String location;
  double temperature;
  double humidity;
  double airQuality;
  double co2;
  String developer;
  String serialNumber;
}
