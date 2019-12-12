import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import os


class MinimalSubscriber(Node):

    def __init__(self):
        super().__init__('heartbeat_subscriber')
        self.subscription = self.create_subscription(
            String,
            'heartbeat',
            self.listener_callback,
            10)
        self.subscription  # prevent unused variable warning
        self.devices = [
        'ChartServer', 
        'TrolleyBed', 
        'OTWorkcell', 
        'CSSDDoor', 
        'LiftController',
        'MIR',
        'Magni4',
        'Magni2',
        'HumanRmfCore',
        'Magni3'
        ]
        self.last_heard = {
            'ChartServer': self.get_clock().now(),
            'TrolleyBed':  self.get_clock().now(),
            'OTWorkcell': self.get_clock().now(), 
            'CSSDDoor': self.get_clock().now(),  
            'LiftController': self.get_clock().now(), 
            'MIR': self.get_clock().now(), 
            'Magni4': self.get_clock().now(), 
            'Magni2': self.get_clock().now(), 
            'HumanRmfCore': self.get_clock().now(), 
            'Magni3': self.get_clock().now()
        }

    def listener_callback(self, msg):
        if msg.data not in self.last_heard.keys():
            self.get_logger().info("I heard '%s' But it doesn't exist!" % msg.data)
        else:
            self.last_heard[msg.data] = self.get_clock().now()
        os.system('clear')
        for device in self.last_heard.keys():
            last_heard = self.last_heard[device]
            current_time = self.get_clock().now()
            time_diff = current_time.nanoseconds - last_heard.nanoseconds
            if time_diff > 15000000000: # More than 15 seconds since last heard
                self.get_logger().info(device + " was not heard for more than 15 seconds.")

def main(args=None):
    rclpy.init(args=args)

    minimal_subscriber = MinimalSubscriber()

    rclpy.spin(minimal_subscriber)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    minimal_subscriber.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()