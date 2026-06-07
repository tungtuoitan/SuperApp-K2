---
id: 158
name: "Blob URL"
---

# Blob URL là gì? [id:1300 order:1]
URL tạm thời (`blob://localhost/...`) trỏ vào vùng RAM của browser tab hiện tại.

# Blob URL tồn tại bao lâu? [id:1301 order:2]
Chỉ trong session — tab đóng hoặc reload là mất.

# Tại sao phải gọi `URL.revokeObjectURL()`? [id:1302 order:3]
Để giải phóng RAM sau khi không dùng nữa.

# Không gọi `revokeObjectURL` thì sao? [id:1303 order:4]
Memory tích lũy dần — memory leak.

# Blob URL có browser cache được không? [id:1304 order:5]
Không.

# Tại sao Blob URL không cache được? [id:1305 order:6]
Vì không phải URL thật — browser cache chỉ hoạt động với URL thật.