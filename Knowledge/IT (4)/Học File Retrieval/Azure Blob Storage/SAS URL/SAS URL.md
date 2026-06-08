---
id: 2806
name: "SAS URL"
---

# SAS là viết tắt của gì? [id:3120 order:1]
Shared Access Signature.

# SAS URL là gì? [id:3121 order:2]
là URL cho phép truy cập tạm thời vào file trên Azure Blob mà không cần username/password.

# Ai tạo ra SAS URL? [id:3122 order:3]
Backend.

# Backend dùng gì để tạo SAS URL? [id:3123 order:4]
Storage Account Key.

# Frontend có tự tạo SAS URL được không? [id:3124 order:5]
Không.

# Tại sao frontend không tự tạo được SAS URL? [id:3125 order:6]
Vì cần Storage Account Key — thứ chỉ backend mới có.

# Có thể sửa tham số `se` trên URL để kéo dài thời hạn không? [id:3126 order:7]
Không.

# Tại sao sửa `se` không được? [id:3127 order:8]
Vì `sig` đã được tính từ giá trị `se` cũ — sửa `se` thì `sig` không khớp, Azure trả 403.

# Muốn giả mạo SAS URL cần gì? [id:3128 order:9]
Storage Account Key.

# Tại sao SAS URL tồn tại? [id:3129 order:10]
Để cấp quyền truy cập tạm thời vào file private mà không cần credentials.

# SAS tương ứng với gì ở ngoài đời? [id:3130 order:11]
- giống vé xem bảo tàng, vé được tạo bởi người chủ, để user có thể vào xem tranh vào 1 ngày cụ thể, sau ngày đó thì vé hết hạn