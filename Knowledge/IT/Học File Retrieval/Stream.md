---
nodeId: 2551
knowledgeId: 1141
nodeStatus: draft
---

# Stream là gì? [id:959 order:0]
Dữ liệu truyền từng phần (chunk) — không cần có toàn bộ mới dùng được.

# Proxy stream là gì? [id:960 order:1]
Backend nhận chunk từ external source rồi chuyển tiếp ngay cho frontend mà không giữ trong RAM.

# Proxy stream tốn RAM backend bao nhiêu? [id:961 order:2]
Gần như không.

# Tại sao proxy stream không tốn RAM backend? [id:962 order:3]
Vì data chảy qua, không được giữ lại.

# Stream có hiển thị được ngay khi chưa nhận đủ file không? [id:963 order:4]
Có.