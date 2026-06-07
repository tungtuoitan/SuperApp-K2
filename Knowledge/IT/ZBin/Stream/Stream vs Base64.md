---
nodeId: 2552
knowledgeId: 1141
nodeStatus: draft
---

# Cái nào tốn băng thông mạng hơn? [id:964 order:0]
Base64 — tốn hơn 33% do encoding.

# Cái nào hiển thị nội dung nhanh hơn? [id:965 order:1]
Stream.

# Tại sao stream hiển thị nhanh hơn? [id:966 order:2]
Vì có thể render từ chunk đầu tiên, không cần chờ toàn bộ file.

# Cái nào browser cache được qua reload? [id:967 order:3]
Stream (qua URL thật).

# Tại sao Base64 không cache được qua reload? [id:968 order:4]
Vì Base64 không có URL — browser cache hoạt động theo URL.

# File 500KB dùng cách nào? [id:969 order:5]
Cả hai đều ổn.

# File 20MB dùng cách nào? [id:970 order:6]
Stream.

# Tại sao file 20MB không nên dùng Base64? [id:971 order:7]
Dễ timeout API call và tốn RAM lớn.