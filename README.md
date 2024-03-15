# Routing Library iOS

Purple's routing library used to navigate from point-to-point within Purple's
RTLS ecosystem of products.

## Getting Started

Create a `RoutingGraph` instance. A `RoutingGraph` is what holds the state for
all Nodes and Edges; as-well-as providing a mechanism to find the shortest path
and the closest Node to a geographical point.

```swift
import RoutingCore

func routing() {
    let nodes = [
            Node(uuid: "node-1", longitude: 10.0, latitude: 10.0, floorLayerUuid: "floor-layer-1"),
            Node(uuid: "node-2", longitude: 20.0, latitude: 20.0, floorLayerUuid: "floor-layer-1"),
            Node(uuid: "node-3", longitude: 30.0, latitude: 30.0, floorLayerUuid: "floor-layer-1"),
            Node(uuid: "node-4", longitude: 40.0, latitude: 40.0, floorLayerUuid: "floor-layer-1")
        ]
                
        let edges = [
            Edge(uuid: "edge-1", nodeA: "node-1", nodeB: "node-2", lengthMetres: 10.0, weight: 1),
            Edge(uuid: "edge-2", nodeA: "node-2", nodeB: "node-3", lengthMetres: 10.0, weight: 1)
        ]
        
        let graph = try RoutingGraph(nodes: nodes, edges: edges)
}
```

Get the shortest path. This returns a sorted list of `RouteStep`s, which
note the Edges required to be traversed in order to follow the shortest path.

```swift
import RoutingCore

func routing() {
    //...

    let shortestPath = try graph.getShortestPath(aUuid: "node-1", bUuid: "node-3")
}
```

Get the closest Node to a point on a particular set of floor layers. This is
usually for getting the closest Node to a start/end point of a Wayfinding
route.

```swift
import RoutingCore

func routing() {
    //...

    let closestNode = try graph.getClosestNode(
        latitude: 50.0,
        longitude: 50.0,
        floorLayers: ["floor-layer-1"]
        )
}
```
