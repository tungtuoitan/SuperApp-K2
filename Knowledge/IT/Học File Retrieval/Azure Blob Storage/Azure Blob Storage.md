---
id: 95
name: "Azure Blob Storage"
---

# Azure Blob Storage là gì? [id:770 order:1]
Dịch vụ lưu trữ file của Microsoft Azure dùng để lưu file nhị phân (ảnh, PDF, video...) trên cloud.

# File trong Azure Blob có public mặc định không? [id:771 order:2]
Không.

# Azure Blob có mấy chế độ truy cập? [id:772 order:3]
Hai chế độ: Public và Private.

# Public và Private khác nhau thế nào? [id:773 order:4]
Public: ai cũng truy cập được. Private: chỉ owner mới truy cập được.

# Azure Blob có CDN sẵn không? [id:774 order:5]
Có.

# Bật CDN thì URL thay đổi như thế nào? [id:775 order:6]
```
Trước: https://mystorage.blob.core.windows.net/files/img.jpg
Sau:   https://mystorage.azureedge.net/files/img.jpg
```