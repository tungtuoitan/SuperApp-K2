---
id: 2553
name: "Blob URL"
---

# Blob URL là gì? [id:972 order:0]
URL tạm thời (`blob://localhost/...`) trỏ vào vùng RAM của browser tab hiện tại.

# Blob URL tồn tại bao lâu? [id:973 order:1]
Chỉ trong session — tab đóng hoặc reload là mất.

# Tại sao phải gọi `URL.revokeObjectURL()`? [id:974 order:2]
Để giải phóng RAM sau khi không dùng nữa.

# Không gọi `revokeObjectURL` thì sao? [id:975 order:3]
Memory tích lũy dần — memory leak.

# Blob URL có browser cache được không? [id:976 order:4]
Không.

# Tại sao Blob URL không cache được? [id:977 order:5]
Vì không phải URL thật — browser cache chỉ hoạt động với URL thật.