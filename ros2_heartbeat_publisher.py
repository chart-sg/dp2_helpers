import rclpy
import argparse

from std_msgs.msg import String


def main(args=None):
    '''
    10.233.29.42, ChartServer
    10.233.29.64, TrolleyBed
    10.233.29.70, OTWorkcell
    10.233.29.71, CSSDDoor
    10.233.29.72, LiftController
    10.233.29.73, MIR
    10.233.29.74, Magni4
    10.233.29.75, Magni2
    10.233.29.76, MagniFleetManager
    10.233.29.77, Magni3
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--name', default='HumanRmfCore')
    x = parser.parse_args()

    rclpy.init(args=args)

    name = x.name
    node = rclpy.create_node(name + '_heartbeat')
    publisher = node.create_publisher(String, 'heartbeat', 10)

    msg = String()
    i = 0

    def timer_callback():
        nonlocal i
        msg.data = name
        node.get_logger().info('Publishing: "%s"' % msg.data)
        publisher.publish(msg)

    timer_period = 5  # seconds
    timer = node.create_timer(timer_period, timer_callback)

    rclpy.spin(node)

    # Destroy the timer attached to the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    node.destroy_timer(timer)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
