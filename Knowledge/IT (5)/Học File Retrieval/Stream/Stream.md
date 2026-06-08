---
id: 2852
name: "Stream"
---

# Stream là gì? [id:3397 order:1]
Dữ liệu truyền từng phần (chunk) — không cần có toàn bộ mới dùng được.

# Proxy stream là gì? [id:3398 order:2]
Backend nhận chunk từ external source rồi chuyển tiếp ngay cho frontend mà không giữ trong RAM.

# Proxy stream tốn RAM backend bao nhiêu? [id:3399 order:3]
Gần như không.

# Tại sao proxy stream không tốn RAM backend? [id:3400 order:4]
Vì data chảy qua, không được giữ lại.

# Stream có hiển thị được ngay khi chưa nhận đủ file không? [id:3401 order:5]
Có.