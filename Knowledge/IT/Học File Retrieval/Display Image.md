---
id: 2606
name: "Display Image"
---

# Cách tốt nhất hiển thị ảnh trên UI là gì? [id:1331 order:1]
Dùng URL thật làm `src` — browser tự stream, tự cache.

# Browser có tự stream ảnh không? [id:1332 order:2]
Có.

# Browser stream ảnh như thế nào? [id:1333 order:3]
Nhận từng chunk → render dần từ trên xuống (hoặc progressive nếu ảnh hỗ trợ).

# Base64 ảnh có progressive render được không? [id:1334 order:4]
Không.

# Tại sao Base64 không progressive render được? [id:1335 order:5]
Phải parse toàn bộ chuỗi base64 xong mới render.

# `loading="lazy"` trên `<img>` có tác dụng gì? [id:1336 order:6]
Trì hoãn fetch ảnh đến khi gần vào viewport.

# Khi nào nên dùng Base64 inline cho ảnh? [id:1337 order:7]
Ảnh rất nhỏ cần embed trực tiếp vào HTML để tránh thêm HTTP request.