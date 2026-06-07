---
nodeId: 2530
knowledgeId: 1141
nodeStatus: learning
---

# khi nào thì cleanUp trong useEffect chạy ? [id:814 order:0]
cleanup chạy khi:

effect sắp chạy lại (deps đổi)
component unmount

# Nguyên tắc dùng useEffect? [id:815 order:32]
nếu k làm việc với external system (vd: server,...) thì ta k nên dùng useEffect