---
id: 2587
name: "Học React"
---

# khi nào thì cleanUp trong useEffect chạy ? [id:1223 order:1]
cleanup chạy khi:

effect sắp chạy lại (deps đổi)
component unmount

# Nguyên tắc dùng useEffect? [id:1224 order:2]
nếu k làm việc với external system (vd: server,...) thì ta k nên dùng useEffect