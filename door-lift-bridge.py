import rclpy
import argparse
from rclpy.node import Node

from std_msgs.msg import String
from rmf_door_msgs.msg import DoorRequest, DoorMode, DoorState
from rmf_lift_msgs.msg import LiftRequest, LiftState

class DoorLiftAdapter(Node):

    def __init__(self):
        super().__init__('door_lift_bridge')
        self.lift_adapter_subscriber = self.create_subscription(DoorRequest, 'door_requests', self.lift_adapter_subscriber_callback, 10)
        self.door_adapter_subscriber = self.create_subscription(LiftState, 'lift_states', self.door_adapter_subscriber_callback, 10)
        self.lift_adapter_publisher = self.create_publisher(LiftRequest, 'lift_requests', 10)
        self.door_adapter_publisher = self.create_publisher(DoorState, 'door_states', 10)

    def door_adapter_subscriber_callback(self, msg):
        print("translating lift_states to door_states")
	# translates liftStates to the appropriate door_states
        pass
    
    def lift_adapter_subscriber_callback(self, in_msg):
	# Check if message is for door LF001
	# process in_msg door_requests to lift_requests
        if in_msg.requester_id == "MiR_R1442" and in_msg.door_name == "chart_cssd_door": # and in_msg.door_name == "LF001": # verify this is correct requester_id
            print("received lift_request from MiR_R1442, translating")
            out_msg = LiftRequest()
            out_msg.request_time = self.get_clock().now().to_msg()
            out_msg.session_id = "lift_door_bridge"
            out_msg.lift_name = "LF001"
            out_msg.destination_floor = 'L3'
            out_msg.request_type = out_msg.REQUEST_AGV_MODE
            out_msg.door_state = out_msg.DOOR_CLOSED
            print(out_msg)
            self.lift_adapter_publisher.publish(out_msg)
        # can extend to more scenarios, perhaps based on session id name

def main(args=None):
    rclpy.init(args=args)
    door_lift_adapter = DoorLiftAdapter()
    rclpy.spin(door_lift_adapter)

    door_lift_adapter.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
