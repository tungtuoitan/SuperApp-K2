---
id: 137
name: "Architecture"
---

# lợi ích của public api? [id:1181 order:1]
Ẩn implementation detail
Cho phép refactor internal mà không ảnh hưởng consumer
Một entry point duy nhất

# Barrel là gì? [id:1182 order:2]
là file index chứa public api của 1 module

# nhược điểm của barrel? [id:1183 order:3]
dependency mơ hồ
dễ circular
build chậm trong monorepo