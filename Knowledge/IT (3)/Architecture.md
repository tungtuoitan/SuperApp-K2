---
id: 2705
name: "Architecture"
---

# lợi ích của public api? [id:2226 order:1]
Ẩn implementation detail
Cho phép refactor internal mà không ảnh hưởng consumer
Một entry point duy nhất

# Barrel là gì? [id:2227 order:2]
là file index chứa public api của 1 module

# nhược điểm của barrel? [id:2228 order:3]
dependency mơ hồ
dễ circular
build chậm trong monorepo