BGP Router - README
High-Level Approach:
This is a simulation that mimics the behavior of a BGP router. It creates BGP peer/provider/customer sessions with other simulated routers, exchanges routing information, and maintains a routing table in order to forward data.

Breakdown of the Program Flow -
- Initialization: The router starts by parsing command-line arguments containing its AS number and the connections to other routers. This information is used to establish sessions with neighboring routers, and save their relationships with itself.
- Session Establishment: The router creates sockets for each neighbor and sends a handshake message to the neighboring router. Once the handshake is successful, that means a session is established, allowing for the exchange of information.
- Message Processing: The router continuously listens for incoming messages on its sockets. When a message is received, it is parsed to determine what type it is (UPDATE, WITHDRAW, DATA, DUMP). Based on the message type, the router takes appropriate actions to update its routing table, forward data packets, or dump its routing table to neighbors.
- Routing Table Management: The router maintains a routing table, which stores information about networks and their prefixes, next-hops, and path attributes. When a new route is advertised or an existing route is withdrawn, the router updates its routing table to match, also running aggregation and deggregation accordingly to maintain the most efficient routing table possible. The routing table is used to make forwarding decisions for DATA messages.
- Data Packet Forwarding: When a router receives a DATA message, it consults its routing table to determine the next hop for the message's destination address. The router then forwards the packet to the next-hop router using the established socket. If no route exists in the routing table, or a data message would be unprofitable based on peer relations, the message is dropped.

Challenges Faced -
- Routing Logic: Implementing the BGP routing algorithm involves complex decision-making, such as selecting the best path based on attributes like localpref, AS path, and origin. It was hard getting this to work as expected. It also requires handling route aggregation and disaggregation.
- Network Address Manipulation: Working with IP addresses and netmasks efficiently requires performing calculations like bitwise operations and prefix length conversions. It was tricky at times to keep in mind whether an IP is the peer's IP or the IP of the network it belongs to.
- Maintaining legal and profitable peer relations when sending updates, withdrawals and data messages.

Testing Approach -
- The router was thoroughly tested using various configuration scenarios (provided by CS4700 professors) to ensure its functionality and correctness.
- Edge cases were tested manually by manipulating different configs to stress-test our implementation.