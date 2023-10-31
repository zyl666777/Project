<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

<jsp:useBean id='objDBconfig' scope='request' class='hitstd.group.tool.database.DBconfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>INSERT</title>
</head>
<body>
<%
    // 檢查請求中是否包含字符編碼信息
    if (request.getCharacterEncoding() == null) {
        request.setCharacterEncoding("BIG5");
    }

    // 獲取表單欄位的值
    String textValue = request.getParameter("textValue");
if (textValue != null && !textValue.isEmpty()) {
    // 在這裡使用textValue
} else {
    // 處理textValue為null或空的情況
    response.sendRedirect("test.jsp"); // 重定向到錯誤頁面或顯示錯誤消息
}

    String role = request.getParameter("role");
    if (role != null && !role.isEmpty()) {
        // 在這裡使用textValue
    } else {
        // 處理textValue為null或空的情況
        response.sendRedirect("test.jsp"); // 重定向到錯誤頁面或顯示錯誤消息
    }
    String dateValueStr = request.getParameter("dateValue");
    if (dateValueStr != null && !dateValueStr.isEmpty()) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(dateValueStr);
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        // 餘下的代碼
    } else {
        // 處理dateValueStr為null或空的情況，例如重定向到另一個頁面或顯示錯誤消息。
        response.sendRedirect("test.jsp"); // 將error.jsp替換為適當的錯誤處理頁面
    
    }


    // 將日期字串轉換為 java.util.Date 對象
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date utilDate = dateFormat.parse(dateValueStr);
    
    // 將 java.util.Date 對象轉換為 java.sql.Date 對象
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

    // 連接到數據庫並插入數據
    Connection con = null;
    PreparedStatement updateWorkStmt = null;

    try {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBconfig.FilePath() + ";");
        Statement smt = con.createStatement();
        String insertQuery = "INSERT INTO break (doctor_ID, reason, `date`) VALUES (?, ?, ?)";
        PreparedStatement insertStmt = con.prepareStatement(insertQuery);
        insertStmt.setString(1, role);
        insertStmt.setString(2, textValue);
        insertStmt.setDate(3, sqlDate); // 使用 java.sql.Date 物件
        insertStmt.executeUpdate();

        String updateWorkQuery = "UPDATE work SET solution = false WHERE doctor_ID = ?";
        updateWorkStmt = con.prepareStatement(updateWorkQuery);
        updateWorkStmt.setString(1, role); // 使用表單提交的 role 參數
        updateWorkStmt.executeUpdate();

        response.sendRedirect("work_schedule.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 確保關閉資源
        try {
            if (updateWorkStmt != null) {
                updateWorkStmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
