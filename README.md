# Quản lý cơ sở PCCC & CNCH (GitHub Pages + Supabase)

Ứng dụng một trang (`index.html`) lưu dữ liệu dùng chung trên Supabase.

## Triển khai
1. Tải `index.html`, `.nojekyll`, `README.md` và thư mục `supabase/` lên repository GitHub (nhánh `main`).
2. Settings → Pages → Deploy from a branch → `main` / `(root)` → Save.
3. Mở `https://<tên-tài-khoản>.github.io/<tên-repo>/`.

## Cấp quyền cho người dùng
Bảng `staff` là danh sách email được phép xem và sửa dữ liệu. Mỗi người tạo tài khoản ngay trong ứng dụng (nút "Tạo tài khoản"), sau đó quản trị viên thêm email (viết thường) trong Supabase → SQL Editor:

    insert into public.staff (email) values ('ten@congty.vn');

## Bảo mật
- Khóa `anon` trong `index.html` là khóa công khai theo thiết kế của Supabase. Dữ liệu được bảo vệ bởi đăng nhập và Row Level Security, người chưa được thêm vào `staff` không đọc hay ghi được gì.
- Không đưa khóa `service_role` vào mã nguồn.
- Cấu trúc bảng nằm ở `supabase/migrations/` (đã áp dụng cho project).
