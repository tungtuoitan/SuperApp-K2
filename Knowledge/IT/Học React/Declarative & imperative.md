---
id: 2671
name: "Declarative & imperative"
---

# imperative là gì? [id:1899 order:1]
- code nhiều dòng, mỗi dòng là 1 hành động nhỏ

# Declarative là gì? [id:1900 order:2]
là code 1 dòng mô tả kết quả

# Liên hệ giữa declarative và imperative? [id:1901 order:3]
declarative api là imperative code được đóng gói lại

# React được thiết kế theo kiểu gì? [id:1902 order:4]
vì sao? [id:238 order:22]
theo kiểu declarative
vì dev chỉ cần mô tả UI, React sẽ lo việc cập nhật DOM

# React có imperative không? [id:1903 order:5]
ví dụ? [id:239 order:23]
có
ví dụ: useEffect, useRef

# declarative và imperative, cái nào phổ biến hơn? [id:1904 order:6]
tại sao? [id:241 order:25]
declarative phổ biến hơn

vì declarative giải quyết được 90% công việc, imperative chỉ để giải quyết 10% công việc còn lại mà declarative không làm được

# ví dụ declarative và imperative? [id:1905 order:7]
declarative: React, SQL
imperative: useEffect, DOM api,

# vì sao useEffect là imperative? [id:1906 order:8]
vì nó luôn chứa chuỗi hành động nhỏ bên trong