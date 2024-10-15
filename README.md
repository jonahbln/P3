BGP Router - README
High-Level Approach:
This BGP router is a Python-based simulation that mimics the behavior of a real-world BGP router. It establishes BGP peering sessions with other routers, exchanges routing information, and maintains a routing table to make forwarding decisions.

Breakdown of the Program Flow -
- Initialization: The router starts by parsing command-line arguments to determine its AS number and connections to other routers. This information is used to establish BGP sessions with neighboring routers.
- Session Establishment: The router creates TCP sockets for each BGP connection and sends an initial handshake message to the neighboring router. Once the handshake is successful, a BGP session is established, allowing for the exchange of routing information.
- BGP Message Processing: The router continuously listens for incoming BGP messages on its sockets. When a message is received, it is parsed to determine its type (e.g., UPDATE, WITHDRAW, DATA). Based on the message type, the router takes appropriate actions to update its routing table or forward data packets.
- Routing Table Management: The router maintains a routing table, which stores information about network prefixes, next-hop routers, and path attributes. When a new route is advertised or an existing route is withdrawn, the router updates its routing table accordingly. The routing table is used to make forwarding decisions for data packets.
- Route Updates and Withdrawals: When a neighbor advertises or withdraws a route, the router updates its routing table accordingly. Also running aggregation and deggregation accordingly to maintain the most efficient routing table possible.
- Data Packet Forwarding: When a router receives a data packet, it consults its routing table to determine the next hop for the packet's destination address. The router then forwards the packet to the next-hop router using the established BGP session. If no route exists in the routing table, or a data messgae would be unprofitable based on peer relations, the message is dropped,

Challenges Faced -
- Routing Logic: Implementing the BGP routing algorithm involves complex decision-making, such as selecting the best path based on attributes like localpref, AS path, and origin. It was hard getting this to work as expected. It also requires handling route aggregation and disaggregation.
- Network Address Manipulation: Working with IP addresses and netmasks efficiently requires performing calculations like bitwise operations and prefix length conversions. It was tricky at times to keep in mind whether an IP is the peer's IP or the IP of the network it belongs to.
- Maintaining legal and profitable peer relations when sending updates, withdrawals and data messages.

Testing Approach -
- The router was thoroughly tested using various configuration scenarios (provided by CS4700 professors) to ensure its functionality and correctness.
- Edge cases were tested manually by manipulating different configs to stress-test our implementation.