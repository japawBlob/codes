class vehicle:
    def __init__(self, id, current_location):
        self.id = id
        self.current_location = current_location

    def move_to(self, place):
        print(self.id)
        self.route()

    def route(self):
        pass

    def location(self):
        pass

class WaterVehicle(vehicle):
    def route(self):
        print("No route available.")

    def location(self):
        pass

class GroundVehicle(vehicle):
    pass

class AirVehicle(vehicle):
    pass




if __name__ == "__main__":
    vehicles = [
        WaterVehicle(id='Titanic', current_location='Liverpool'),
        GroundVehicle(id='Humvee', current_location='Baghdad'),
        AirVehicle(id='Air Force One', current_location='Washington')
    ]

    for vehicle in vehicles:
        vehicle.move_to('Prague')
        print(vehicle)