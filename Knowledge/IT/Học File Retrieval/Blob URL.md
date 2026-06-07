---
id: 2726
name: "Blob URL"
---

# Blob URL là gì? [id:2345 order:1]
URL tạm thời (`blob://localhost/...`) trỏ vào vùng RAM của browser tab hiện tại.

# Blob URL tồn tại bao lâu? [id:2346 order:2]
Chỉ trong session — tab đóng hoặc reload là mất.

# Tại sao phải gọi `URL.revokeObjectURL()`? [id:2347 order:3]
Để giải phóng RAM sau khi không dùng nữa.

# Không gọi `revokeObjectURL` thì sao? [id:2348 order:4]
Memory tích lũy dần — memory leak.

# Blob URL có browser cache được không? [id:2349 order:5]
Không.

# Tại sao Blob URL không cache được? [id:2350 order:6]
Vì không phải URL thật — browser cache chỉ hoạt động với URL thật.