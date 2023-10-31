package date.text;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class turndate {
    public static java.sql.Date convertToSqlDate(String dateString) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        java.util.Date parsedDate = dateFormat.parse(dateString);
        return new java.sql.Date(parsedDate.getTime());
    }
}
