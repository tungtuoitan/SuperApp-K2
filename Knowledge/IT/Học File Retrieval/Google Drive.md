---
nodeId: 2546
knowledgeId: 1141
nodeStatus: draft
---

# Google Drive có CDN không? [id:913 order:0]
Không.

# Tại sao Google Drive không có CDN? [id:914 order:1]
Vì Google Drive không được thiết kế làm storage server.

# Google Drive có cache được không? [id:915 order:2]
Không.

# Tại sao file từ Google Drive không cache được qua reload? [id:916 order:3]
Vì không có Cache-Control header — browser không biết cache đến khi nào.

# Giải pháp tốt nhất để cache khi buộc phải dùng Google Drive là gì? [id:917 order:4]
Dùng Cache API của browser để lưu response vào disk.

# Cache API khác RAM cache ở điểm gì? [id:918 order:5]
RAM cache mất khi reload. Cache API lưu trên disk, tồn tại đến khi clear hoặc hết TTL.

# Cache API có tự expire không? [id:919 order:6]
Không.