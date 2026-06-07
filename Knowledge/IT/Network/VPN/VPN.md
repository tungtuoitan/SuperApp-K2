---
id: 105
name: "VPN"
---

# Network là gì? [id:865 order:1]
Network là nhiều thiết bị kết nối với nhau để trao đổi dữ liệu.

# Internet là gì? [id:866 order:2]
Internet là network rất lớn nối nhiều network nhỏ lại với nhau.

# VPN là gì? [id:867 order:3]
VPN là một mạng riêng ảo tạo kết nối mã hóa qua internet.

# VPN có thay thế internet không? [id:868 order:4]
Không.

# VPN có cần internet để hoạt động không? [id:869 order:5]
Có.

<!--# VPN tunnel là gì? [id:870 order:6]
VPN tunnel là kết nối mã hóa giữa client và VPN server. -->

<!--# VPN dùng để làm gì? [id:871 order:7]
VPN dùng để truy cập mạng riêng từ xa qua internet. -->

<!--# Consumer VPN và corporate VPN khác nhau thế nào? [id:872 order:8]
Consumer VPN chủ yếu để privacy và đổi IP. Corporate VPN để vào mạng nội bộ công ty. -->

# Trong công ty, VPN dùng để làm gì? [id:873 order:9]
VPN cho phép nhân viên truy cập tài nguyên nội bộ từ xa.

# VPN có phải internet riêng không? [id:874 order:10]
Không.

# VPN có phải mạng vật lý không? [id:875 order:11]
Không.

<!--# “Virtual” trong VPN nghĩa là gì? [id:876 order:12]
Nó là mạng logic, không phải dây mạng thật. -->

<!--# VPN có luôn cần VPN server không? [id:877 order:13]
Thông thường là có. -->

<!--# VPN server dùng để làm gì? [id:878 order:14]
VPN server authenticate user, tạo tunnel và route traffic. -->

<!--# Client VPN có luôn connect đến VPN server trước không? [id:879 order:15]
Thông thường là có. -->

# Khi connect VPN, client có được cấp IP riêng không? [id:880 order:16]
Có.

# IP đó gọi là gì? [id:881 order:17]
Virtual IP hoặc VPN IP.

# Virtual IP dùng để làm gì? [id:882 order:18]
Để định danh và route traffic trong VPN.

<!--# Máy dùng VPN có thể có nhiều IP không? [id:883 order:19]
Có. -->

<!--# Ví dụ máy có nhiều IP? [id:884 order:20]
Một IP mạng nhà và một IP VPN. -->

<!--# Split tunnel VPN là gì? [id:885 order:21]
Là kiểu VPN chỉ route một phần traffic qua VPN. -->

# Trong split tunnel, YouTube đi đâu? [id:886 order:22]
Đi internet thường.

# Trong split tunnel, DB công ty đi đâu? [id:887 order:23]
Đi qua VPN tunnel và VPN server.

# Vì sao công ty dùng split tunnel? [id:888 order:24]
Để giảm tải VPN server và tăng tốc internet.

# Full tunnel VPN là gì? [id:889 order:25]
Là kiểu VPN route toàn bộ traffic qua VPN server.

# VPN tunnel có chạy trên internet không? [id:890 order:26]
Có.

# Nếu không có internet thì VPN có hoạt động không? [id:891 order:27]
Không.

# Người ngoài internet thấy gì khi dùng VPN? [id:892 order:28]
Họ chỉ thấy client đang connect đến VPN server.

# User lạ làm sao bị chặn khỏi VPN công ty? [id:893 order:29]
VPN server yêu cầu account, password hoặc MFA.

<!--# Sau khi vào VPN, máy user giống như thế nào? [id:894 order:30]
Giống như đang nằm trong mạng nội bộ công ty. -->

<!--# Bastion server khác VPN thế nào? [id:895 order:31]
Bastion chỉ cho truy cập service cụ thể, còn VPN cho tham gia network riêng. -->

# User → Server A → DB B có phải VPN không? [id:896 order:32]
Chưa hẳn.

# Mô hình User → Server A → DB B thường gọi là gì? [id:897 order:33]
Gateway, proxy hoặc bastion server.

# Khi nào Server A trở thành VPN server? [id:898 order:34]
Khi nó tạo tunnel, cấp virtual IP và route traffic mạng.