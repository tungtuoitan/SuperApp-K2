---
id: 2868
name: "Stream vs Base64"
---

# Cái nào tốn băng thông mạng hơn? [id:3644 order:1]
Base64 — tốn hơn 33% do encoding.

# Cái nào hiển thị nội dung nhanh hơn? [id:3645 order:2]
Stream.

# Tại sao stream hiển thị nhanh hơn? [id:3646 order:3]
Vì có thể render từ chunk đầu tiên, không cần chờ toàn bộ file.

# Cái nào browser cache được qua reload? [id:3647 order:4]
Stream (qua URL thật).

# Tại sao Base64 không cache được qua reload? [id:3648 order:5]
Vì Base64 không có URL — browser cache hoạt động theo URL.

# File 500KB dùng cách nào? [id:3649 order:6]
Cả hai đều ổn.

# File 20MB dùng cách nào? [id:3650 order:7]
Stream.

# Tại sao file 20MB không nên dùng Base64? [id:3651 order:8]
Dễ timeout API call và tốn RAM lớn.