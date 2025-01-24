
# MLC script automation workflow 

```mermaid
flowchart TD
    A[MLC interface] --> B{Script Automation}
    A[MLC interface] --> C{Cache Automation}
    B[Script Automation] --> C{Cache Automation}
    B[Script Automation] --> D{MLPerf Scripts}
```
