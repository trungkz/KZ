# Quản lý cơ sở PCCC & CNCH

Ứng dụng web một trang (HTML thuần, không cần máy chủ) để quản lý hồ sơ, hệ thống và lực lượng PCCC của các cơ sở.

## Chạy trên GitHub Pages

1. Tạo repository mới trên GitHub, ví dụ `quan-ly-pccc`.
2. Tải lên các tệp `index.html`, `.nojekyll` và `README.md` ở nhánh `main`.
3. Vào **Settings → Pages**. Ở mục **Build and deployment**, chọn **Deploy from a branch**, nhánh `main`, thư mục `/ (root)`, rồi bấm **Save**.
4. Sau 1–2 phút, ứng dụng chạy tại `https://<tên-tài-khoản>.github.io/quan-ly-pccc/`.

## Lưu ý về dữ liệu

- Dữ liệu lưu trong trình duyệt của từng người dùng (localStorage), không gửi lên GitHub và không dùng chung giữa các máy.
- Dùng **Xuất Excel** hoặc **Sao lưu JSON** để sao lưu và chuyển dữ liệu giữa các máy.
- Không đưa file Excel hoặc JSON chứa dữ liệu thật của cơ sở vào repository công khai.
- Thư viện đọc/ghi Excel (JSZip) đã gắn sẵn trong `index.html`, nên ứng dụng không cần tải gì từ mạng khi chạy.
