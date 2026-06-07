---
id: 2549
name: "SAS vs JWT"
---

# SAS và JWT có điểm gì giống nhau về cơ chế? [id:940 order:1]
Cả hai đều dùng HMAC để ký — sửa thông tin là chữ ký sai, bị từ chối.

# SAS và JWT khác nhau ở chỗ nào? [id:941 order:2]
JWT nằm trong Authorization header. SAS nằm trên URL.

# JWT dùng để làm gì? [id:942 order:3]
Xác thực người dùng với backend.

# SAS dùng để làm gì? [id:943 order:4]
Ủy quyền truy cập file trực tiếp với Azure.

# SAS có stateless không? [id:944 order:5]
Có.

# Tại sao SAS stateless? [id:945 order:6]
Azure không cần lưu danh sách SAS — chỉ verify chữ ký là đủ.

# JWT bị lộ nguy hiểm hơn hay SAS bị lộ nguy hiểm hơn? [id:946 order:7]
JWT bị lộ nguy hiểm hơn.

# Tại sao JWT bị lộ nguy hiểm hơn SAS? [id:947 order:8]
JWT cho phép giả danh user và làm mọi thứ user làm được. SAS chỉ truy cập được đúng file đó trong thời hạn giới hạn.

---