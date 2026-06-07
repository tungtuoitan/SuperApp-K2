---
nodeId: 2569
knowledgeId: 1141
nodeStatus: learning
---

# Kill switch hoạt động khi VPN tunnel rớt mạng không? [id:1098 order:0]
1Có. Rule firewall tồn tại độc lập với trạng thái tunnel — tunnel rớt thì traffic bị block hoàn toàn, không lọt ra ngoài.

# Kill switch là gì? [id:1096 order:1]
2Cơ chế inject firewall rule vào OS: chỉ cho traffic đi qua VPN interface, block tất cả interface khác.

# Kill switch được bật và tắt khi nào? [id:1097 order:2]
3Rule được inject khi bật VPN app, chỉ bị gỡ khi tắt VPN app chủ động.

<!--# Ba trạng thái của kill switch là gì? [id:1099 order:3]
44444VPN bật + tunnel up → traffic đi qua tunnel bình thường. VPN bật + tunnel rớt → traffic bị block. VPN tắt chủ động → rule gỡ, traffic đi thẳng internet. -->

# Không có kill switch thì điều gì xảy ra? [id:1101 order:4]
5Khi tunnel rớt, OS tự fallback ra interface thật ngay lập tức — IP thật bị lộ trong vài giây mà người dùng không nhận ra.

# Mục đích chính của kill switch là gì? [id:1100 order:5]
6Không cho traffic lọt ra ngoài tunnel khi tunnel không còn — bảo vệ khoảng thời gian tunnel rớt mà người dùng không hay biết.

# new [id:1108 order:6]
7


7
7
7
7
7