---
id: 2531
name: "State Managment"
---

# trade-off của zustand là gì? [id:816 order:0]
- flexible nên cần có convention để code thống nhất
- middleware, devtool, thư viện ngon nhưng k ngon bằng redux

# trade-off của React context [id:818 order:1]
performance kém
ít tính năng

# dùng react context ở giai đoạn đầu, khi cần thì migrate qua zustand, đây có phải flow tốt không? [id:1119 order:2]
vì sao? [id:819 order:11]
không,
ta nên dùng zustand ngay từ đầu

# Thư viện quản lí state nào phức tạp nhất? [id:820 order:3]
Redux + Saga

# khi nào dùng Redux saga? [id:821 order:4]
khi cần async phức tạp, hoặc cần realtime

# Tại sao React Context lại k tốt cho hiệu suất? [id:822 order:5]
vì khi 1 state update, mọi component link đến context đều re-render

# Những tính năng mà React context k có ? [id:823 order:6]
- computed state
- middleware
- devtool
- dùng state bên ngoài component tree

# Tại sao zustand có hiệu suất cao hơn React Context? [id:824 order:7]
vì react context sẽ trigger re-render hàng loạt

# React Context là gì? [id:1120 order:8]
React có phải state manager không? [id:825 order:21]
nó là kỹ thuật DI, k phải là state manager

# React Context nên dc dùng để làm gì? [id:1121 order:9]
nó k nên dùng cho việc gì?
vì sao? [id:826 order:22]
để truyền giá trị ít thay đổi
nó k nên dùng để quản lí state thay đổi nhiều
vì nó có vấn đề re-render

# vì sao Zustand phù hợp với hầu hết các case? [id:827 order:10]
vì nó dễ dùng, hiệu suất khá tốt, khá nhiều tính năng

# cách chọn state manager nhanh? [id:828 order:11]
- mặc định dùng Zustand
- app nhỏ thì dùng Context
- khi team lớn và cần autit trail rõ ràng thì dùng Redux Toolkit

# Các công nghệ phổ biến để quản lí state? [id:830 order:12]
- React
- Zustand
- Redux
- Redux Saga

# ưu điểm của React Context [id:831 order:13]
có sẵn, dễ dùng

# Tanstack Query là gì? [id:839 order:14]
nó là data fetching + caching LAYER

# vì sao Zustand là lựa chọn an toàn và phổ biến? [id:832 order:15]
vì nó phù hợp với hầu hết các case

# vì sao app nhỏ thì nên dùng Context? [id:833 order:16]
vì nó đơn giản, k cần setup

# saga là gì? [id:834 order:17]
là middleware dùng để xử lí side effect trong redux

# Khi nào nên dùng Tanstack Query? [id:836 order:18]
khi cần quản lí server state

# tại sao nên dùng Tanstack Query? [id:837 order:19]
vì Tanstack tiện lợi hơn, mình khỏi cần quản lí server state, loading, cache nữa