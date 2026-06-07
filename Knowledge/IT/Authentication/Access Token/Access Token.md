---
id: 2599
name: "Access Token"
---

# Token là gì? [id:1282 order:1]
- là 1 chuỗi dữ liệu để cho phép user gọi API để truy cập tài nguyên

# thành phần của Access Token [id:1283 order:2]
- gồm 3 phần: header, payload, signature

# Token tương ứng với cái gì ở thế giới thực? [id:1284 order:3]
- tấm vé vào cửa, hoặc chìa khoá tạm thời

# Tại sao lại dùng Token thay vì session truyền thống? [id:1285 order:4]
- session k hỗ trợ mobile và các  (do chỉ có trên browser)
- session khó scale cho các ứng dụng lớn, micro service, còn token thì dễ hơn vì stateless

# Các loại token phổ biến? [id:1286 order:5]
- JWT
- SAML

# Access Token là gì? [id:1287 order:6]
- là token dùng để truy cập tài nguyên của server,

# ReFresh token là gì? [id:1288 order:7]
- là token dùng để lấy access token mới khi access token hết hạn

# Claim trong token là gì? [id:1289 order:8]
Các mẩu thông tin nhỏ (key-value) nằm trong token (ví dụ: name, email, role…).

# đặc điểm của Access Token? [id:1290 order:9]
- được gửi kèm trong mỗi request đến server
- thời gian sống nhắn, thường được set từ 15' - 1h

# JWT là gì? [id:1291 order:10]
Loại 1 loại token

# đặc điểm của Refresh Token? [id:1292 order:11]
- không được dùng để truy cập tài nguyên
- thời gian sống dài, (vài ngày, vài tuần hoặc vài tháng)

# Ưu điểm của Token-based Authentication [id:1293 order:12]
- dễ scale ngang
- đa nền tảng

# Nhược điểm của Token-based [id:1294 order:13]
không thể thu hồi ngay lập tức.