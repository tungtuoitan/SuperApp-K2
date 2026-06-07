---
nodeId: 2547
knowledgeId: 1141
nodeStatus: draft
---

# SAS là viết tắt của gì? [id:920 order:0]
Shared Access Signature.

# SAS URL là gì? [id:921 order:1]
là URL cho phép truy cập tạm thời vào file trên Azure Blob mà không cần username/password.

# Ai tạo ra SAS URL? [id:922 order:2]
Backend.

# Backend dùng gì để tạo SAS URL? [id:923 order:3]
Storage Account Key.

# Frontend có tự tạo SAS URL được không? [id:924 order:4]
Không.

# Tại sao frontend không tự tạo được SAS URL? [id:925 order:5]
Vì cần Storage Account Key — thứ chỉ backend mới có.

# Có thể sửa tham số `se` trên URL để kéo dài thời hạn không? [id:926 order:6]
Không.

# Tại sao sửa `se` không được? [id:927 order:7]
Vì `sig` đã được tính từ giá trị `se` cũ — sửa `se` thì `sig` không khớp, Azure trả 403.

# Muốn giả mạo SAS URL cần gì? [id:928 order:8]
Storage Account Key.

# Tại sao SAS URL tồn tại? [id:929 order:9]
Để cấp quyền truy cập tạm thời vào file private mà không cần credentials.

# SAS tương ứng với gì ở ngoài đời? [id:930 order:10]
- giống vé xem bảo tàng, vé được tạo bởi người chủ, để user có thể vào xem tranh vào 1 ngày cụ thể, sau ngày đó thì vé hết hạn