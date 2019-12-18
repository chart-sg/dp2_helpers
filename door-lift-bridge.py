import rclpy
import argparse
from rclpy.node import Node

from std_msgs.msg import String
from rmf_door_msgs.msg import DoorRequest, DoorMode, DoorState
from rmf_lift_msgs.msg import LiftRequest, LiftState

class DoorLiftAdapter(Node):

    def __init__(self):
        super().__init__('door_lift_bridge')
        lift_adapter_subscriber = self.create_subscription(DoorRequest, 'door_requests', self.lift_adapter_subscriber_callback, 10)
        door_adapter_subscriber = self.create_subscription(LiftState, 'lift_states', self.door_adapter_subscriber_callback, 10)
        lift_adapter_publisher = self.create_publisher(LiftRequest, 'lift_requests', 10)
        door_adapter_publisher = self.create_publisher(DoorState, 'door_states', 10)

    def door_adapter_subscriber_callback(self, msg):
        print("translating lift_states to door_states")
        pass
    
    def lift_adapter_subscriber_callback(self, msg):
        print("translating door_requests to lift_requests")
        pass

def main(args=None):
    rclpy.init(args=args)
    door_lift_adapter = DoorLiftAdapter()
    rclpy.spin(door_lift_adapter)

    door_lift_adapter.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
