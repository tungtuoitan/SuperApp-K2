---
id: 2563
name: "VPN"
---

# Network là gì? [id:1034 order:0]
Network là nhiều thiết bị kết nối với nhau để trao đổi dữ liệu.

# Internet là gì? [id:1035 order:1]
Internet là network rất lớn nối nhiều network nhỏ lại với nhau.

# VPN là gì? [id:1036 order:2]
VPN là một mạng riêng ảo tạo kết nối mã hóa qua internet.

# VPN có thay thế internet không? [id:1038 order:3]
Không.

# VPN có cần internet để hoạt động không? [id:1039 order:4]
Có.

<!--# VPN tunnel là gì? [id:1040 order:5]
VPN tunnel là kết nối mã hóa giữa client và VPN server. -->

<!--# VPN dùng để làm gì? [id:1041 order:6]
VPN dùng để truy cập mạng riêng từ xa qua internet. -->

<!--# Consumer VPN và corporate VPN khác nhau thế nào? [id:1042 order:7]
Consumer VPN chủ yếu để privacy và đổi IP. Corporate VPN để vào mạng nội bộ công ty. -->

# Trong công ty, VPN dùng để làm gì? [id:1043 order:8]
VPN cho phép nhân viên truy cập tài nguyên nội bộ từ xa.

# VPN có phải internet riêng không? [id:1044 order:9]
Không.

# VPN có phải mạng vật lý không? [id:1045 order:10]
Không.

<!--# “Virtual” trong VPN nghĩa là gì? [id:1046 order:11]
Nó là mạng logic, không phải dây mạng thật. -->

<!--# VPN có luôn cần VPN server không? [id:1047 order:12]
Thông thường là có. -->

<!--# VPN server dùng để làm gì? [id:1048 order:13]
VPN server authenticate user, tạo tunnel và route traffic. -->

<!--# Client VPN có luôn connect đến VPN server trước không? [id:1049 order:14]
Thông thường là có. -->

# Khi connect VPN, client có được cấp IP riêng không? [id:1054 order:15]
Có.

# IP đó gọi là gì? [id:1055 order:16]
Virtual IP hoặc VPN IP.

# Virtual IP dùng để làm gì? [id:1056 order:17]
Để định danh và route traffic trong VPN.

<!--# Máy dùng VPN có thể có nhiều IP không? [id:1057 order:18]
Có. -->

<!--# Ví dụ máy có nhiều IP? [id:1058 order:19]
Một IP mạng nhà và một IP VPN. -->

<!--# Split tunnel VPN là gì? [id:1059 order:20]
Là kiểu VPN chỉ route một phần traffic qua VPN. -->

# Trong split tunnel, YouTube đi đâu? [id:1060 order:21]
Đi internet thường.

# Trong split tunnel, DB công ty đi đâu? [id:1061 order:22]
Đi qua VPN tunnel và VPN server.

# Vì sao công ty dùng split tunnel? [id:1062 order:23]
Để giảm tải VPN server và tăng tốc internet.

# Full tunnel VPN là gì? [id:1063 order:24]
Là kiểu VPN route toàn bộ traffic qua VPN server.

# VPN tunnel có chạy trên internet không? [id:1064 order:25]
Có.

# Nếu không có internet thì VPN có hoạt động không? [id:1065 order:26]
Không.

# Người ngoài internet thấy gì khi dùng VPN? [id:1066 order:27]
Họ chỉ thấy client đang connect đến VPN server.

# User lạ làm sao bị chặn khỏi VPN công ty? [id:1067 order:28]
VPN server yêu cầu account, password hoặc MFA.

<!--# Sau khi vào VPN, máy user giống như thế nào? [id:1068 order:29]
Giống như đang nằm trong mạng nội bộ công ty. -->

<!--# Bastion server khác VPN thế nào? [id:1069 order:30]
Bastion chỉ cho truy cập service cụ thể, còn VPN cho tham gia network riêng. -->

# User → Server A → DB B có phải VPN không? [id:1070 order:31]
Chưa hẳn.

# Mô hình User → Server A → DB B thường gọi là gì? [id:1071 order:32]
Gateway, proxy hoặc bastion server.

# Khi nào Server A trở thành VPN server? [id:1072 order:33]
Khi nó tạo tunnel, cấp virtual IP và route traffic mạng.