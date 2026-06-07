---
id: 2550
name: "Base64"
---

# Base64 giải quyết bài toán gì? [id:948 order:0]
Nhúng binary data vào môi trường chỉ chứa text được (JSON, HTML, Email).

# Base64 có phải mã hóa bảo mật không? [id:949 order:1]
Không.

# Tại sao Base64 không phải mã hóa bảo mật? [id:950 order:2]
Ai cũng decode được mà không cần key.

# Base64 làm tăng kích thước file bao nhiêu? [id:951 order:3]
33%.

# Tại sao Base64 tăng 33%? [id:952 order:4]
Vì 3 bytes binary được biểu diễn bằng 4 ký tự ASCII.

# Base64 có stream được không? [id:953 order:5]
Không.

# Tại sao Base64 không stream được? [id:954 order:6]
Phải decode toàn bộ chuỗi mới có data — không thể decode một nửa.

# Base64 ảnh hưởng RAM như thế nào? [id:955 order:7]
File tồn tại 3 lần trong RAM: string base64 → ArrayBuffer → Blob.

# Email attachment có thể dùng stream thay Base64 không? [id:956 order:8]
Không.

# Tại sao email attachment không dùng stream được? [id:957 order:9]
Email không phải HTTP — không có khái niệm stream. Base64 là chuẩn MIME bắt buộc (RFC 2045).

# Khi nào Base64 là lựa chọn đúng? [id:958 order:10]
Khi cần nhúng binary vào text-based format: email attachment, data URI trong HTML, file nhỏ bundle cùng API response.