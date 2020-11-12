Cát Huy Thành - FX01399
Môn DBI202x_01_VN
Project 3: Làm việc với các đối tượng khác trong môi trường SQL Server
Yêu cầu: 1. Sử dụng truy vấn để tạo view: Video_view (VideoId, Title, Description)
	 2. Trigger: trg_comment tăng view của video tương ứng khi có comment.
	 3. Store Procedure: 
		-sp_ShowVideoChannel: show video theo channel sắp xếp theo thời gian giảm dần.
	 4. User function: Tính total subcribe của 1 channel.
	 5. Nâng cao: 
		-Tạo thêm trường trend ở bảng video và set giá trị bằng cursor.
		-Viết thêm sp (sp_Trend) show ra các video sắp xếp theo trend vừa lập ở trên.
