---
id: 2554
name: "Display Image"
---

# Cách tốt nhất hiển thị ảnh trên UI là gì? [id:978 order:0]
Dùng URL thật làm `src` — browser tự stream, tự cache.

# Browser có tự stream ảnh không? [id:979 order:1]
Có.

# Browser stream ảnh như thế nào? [id:980 order:2]
Nhận từng chunk → render dần từ trên xuống (hoặc progressive nếu ảnh hỗ trợ).

# Base64 ảnh có progressive render được không? [id:981 order:3]
Không.

# Tại sao Base64 không progressive render được? [id:982 order:4]
Phải parse toàn bộ chuỗi base64 xong mới render.

# `loading="lazy"` trên `<img>` có tác dụng gì? [id:983 order:5]
Trì hoãn fetch ảnh đến khi gần vào viewport.

# Khi nào nên dùng Base64 inline cho ảnh? [id:984 order:6]
Ảnh rất nhỏ cần embed trực tiếp vào HTML để tránh thêm HTTP request.