flowchart LR
    A[terraform] -->|ssh| B[Management 'jump box' VSI]
    B -->|ssh| D[Workload VSI 1]
    B -->|ssh| E[Workload VSI 2]
    B -->|ssh| F[Workload VSI 3]