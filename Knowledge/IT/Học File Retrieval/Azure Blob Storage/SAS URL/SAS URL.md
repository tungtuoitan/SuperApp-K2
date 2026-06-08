---
id: 2623
name: "SAS URL"
---

# SAS là viết tắt của gì? [id:1581 order:1]
Shared Access Signature.

# SAS URL là gì? [id:1582 order:2]
là URL cho phép truy cập tạm thời vào file trên Azure Blob mà không cần username/password.

# Ai tạo ra SAS URL? [id:1583 order:3]
Backend.

# Backend dùng gì để tạo SAS URL? [id:1584 order:4]
Storage Account Key.

# Frontend có tự tạo SAS URL được không? [id:1585 order:5]
Không.

# Tại sao frontend không tự tạo được SAS URL? [id:1586 order:6]
Vì cần Storage Account Key — thứ chỉ backend mới có.

# Có thể sửa tham số `se` trên URL để kéo dài thời hạn không? [id:1587 order:7]
Không.

# Tại sao sửa `se` không được? [id:1588 order:8]
Vì `sig` đã được tính từ giá trị `se` cũ — sửa `se` thì `sig` không khớp, Azure trả 403.

# Muốn giả mạo SAS URL cần gì? [id:1589 order:9]
Storage Account Key.

# Tại sao SAS URL tồn tại? [id:1590 order:10]
Để cấp quyền truy cập tạm thời vào file private mà không cần credentials.

# SAS tương ứng với gì ở ngoài đời? [id:1591 order:11]
- giống vé xem bảo tàng, vé được tạo bởi người chủ, để user có thể vào xem tranh vào 1 ngày cụ thể, sau ngày đó thì vé hết hạn