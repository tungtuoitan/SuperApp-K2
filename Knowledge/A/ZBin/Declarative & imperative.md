---
id: 2538
name: "Declarative & imperative"
---

# imperative là gì? [id:870 order:0]
- code nhiều dòng, mỗi dòng là 1 hành động nhỏ

# Declarative là gì? [id:871 order:1]
là code 1 dòng mô tả kết quả

# Liên hệ giữa declarative và imperative? [id:872 order:2]
declarative api là imperative code được đóng gói lại

# React được thiết kế theo kiểu gì? [id:1116 order:3]
vì sao? [id:873 order:22]
theo kiểu declarative
vì dev chỉ cần mô tả UI, React sẽ lo việc cập nhật DOM

# React có imperative không? [id:1117 order:4]
ví dụ? [id:874 order:23]
có
ví dụ: useEffect, useRef

# declarative và imperative, cái nào phổ biến hơn? [id:1118 order:5]
tại sao? [id:875 order:25]
declarative phổ biến hơn

vì declarative giải quyết được 90% công việc, imperative chỉ để giải quyết 10% công việc còn lại mà declarative không làm được

# ví dụ declarative và imperative? [id:876 order:6]
declarative: React, SQL
imperative: useEffect, DOM api,

# vì sao useEffect là imperative? [id:877 order:7]
vì nó luôn chứa chuỗi hành động nhỏ bên trong