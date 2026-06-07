---
id: 2624
name: "Stream vs Base64"
---

# Cái nào tốn băng thông mạng hơn? [id:1592 order:1]
Base64 — tốn hơn 33% do encoding.

# Cái nào hiển thị nội dung nhanh hơn? [id:1593 order:2]
Stream.

# Tại sao stream hiển thị nhanh hơn? [id:1594 order:3]
Vì có thể render từ chunk đầu tiên, không cần chờ toàn bộ file.

# Cái nào browser cache được qua reload? [id:1595 order:4]
Stream (qua URL thật).

# Tại sao Base64 không cache được qua reload? [id:1596 order:5]
Vì Base64 không có URL — browser cache hoạt động theo URL.

# File 500KB dùng cách nào? [id:1597 order:6]
Cả hai đều ổn.

# File 20MB dùng cách nào? [id:1598 order:7]
Stream.

# Tại sao file 20MB không nên dùng Base64? [id:1599 order:8]
Dễ timeout API call và tốn RAM lớn.