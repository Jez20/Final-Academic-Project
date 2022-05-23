/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FV
 */
public class pdfGenerator {

    private Font[] fontSet;

    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    private static Font bigFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);
    private static Font smallRegular = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL);

    private static Font tableTitle = new Font(Font.FontFamily.TIMES_ROMAN, 8,
            Font.BOLD);

    public pdfGenerator() {
        this.fontSet = new Font[]{
            new Font(),
            new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, new BaseColor(0, 0, 0))
        };
    }

    public void pendingOrderReport(PdfWriter writer, Document document, ResultSet data, OutputStream out, String email) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yy HH-mm-ss");
        Date dateNow = new Date();
        try {
            String preTitle = "PendingOrderReport.pdf";
            String pdfTitle = String.format("%s - %s", dateFormat.format(dateNow), preTitle);
            
            HeaderFooterPageEvent event = new HeaderFooterPageEvent(String.format("Generated by: %s", email));
            writer.setPageEvent(event);
            document.open();
            document.setMargins(1, 1, 1, 1);
            addMetaData(pdfTitle, "Pending Orders in DB", "user", email, document);
            addTitlePage(document, "Pending Orders", email);

            Paragraph content4 = new Paragraph("", smallBold);
            content4.add("Document Description");
            content4.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(content4, 1);
            document.add(content4);

            Paragraph start = new Paragraph("", smallRegular);
            start.add("All orders that are pending");
            start.setAlignment(Element.ALIGN_LEFT);
            addEmptyLine(start, 4);
            document.add(start);

            document.newPage();
            document.setMargins(1, 1, 1, 1);
            Paragraph spaceMaker = new Paragraph("");
            addEmptyLine(spaceMaker, 3);
            document.add(spaceMaker);

            Paragraph desc = new Paragraph("", bigFont);
            desc.add("Order Table");
            desc.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(desc, 1);
            document.add(desc);

            createTable(document, data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void generateUserReport(PdfWriter writer, Document document, ResultSet data, OutputStream out, String email) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yy HH-mm-ss");
        Date dateNow = new Date();
        try {
            String preTitle = "UserReport.pdf";
            String pdfTitle = String.format("%s - %s", dateFormat.format(dateNow), preTitle);
            HeaderFooterPageEvent event = new HeaderFooterPageEvent(String.format("Generated by: %s", email));
            writer.setPageEvent(event);
            document.open();
            document.setMargins(1, 1, 1, 1);
            addMetaData(pdfTitle, "User Data in DB", "user", email, document);
            addTitlePage(document, "User", email);

            Paragraph content4 = new Paragraph("", smallBold);
            content4.add("Document Description");
            content4.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(content4, 1);
            document.add(content4);

            Paragraph start = new Paragraph("", smallRegular);
            start.add("All Users retreived from the database.");
            start.setAlignment(Element.ALIGN_LEFT);
            addEmptyLine(start, 4);
            document.add(start);

            document.newPage();
            document.setMargins(1, 1, 1, 1);
            Paragraph spaceMaker = new Paragraph("");
            addEmptyLine(spaceMaker, 3);
            document.add(spaceMaker);

            Paragraph desc = new Paragraph("", bigFont);
            desc.add("User Table");
            desc.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(desc, 1);
            document.add(desc);

            createTable(document, data);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String newFileLocation = String.format("%s - %s", dateFormat.format(dateNow), fileName);
        //putPageNumbers(newFileLocation, newFileLocation, out);
    }

    private void addMetaData(String title,
            String subject,
            String keyWords,
            String author,
            Document document) {
        document.addTitle(title);
        document.addSubject(subject);
        document.addKeywords(author);
        document.addAuthor(author);
        document.addCreator("<User Id Name>");
    }

    private void addTitlePage(Document document, String reportType, String email) {
        try {
            Paragraph blankSpace = new Paragraph("");
            addEmptyLine(blankSpace, 2);
            document.add(blankSpace);

            Paragraph content1 = new Paragraph("", bigFont);
            content1.add(String.format("%s Report", reportType));
            content1.setAlignment(Element.ALIGN_CENTER);
            addEmptyLine(content1, 1);
            document.add(content1);

            Paragraph content2 = new Paragraph("", smallBold);
            content2.add(String.format("Report generated by:  %s", email));
            content2.setAlignment(Element.ALIGN_LEFT);
            addEmptyLine(content2, 1);
            document.add(content2);

            Paragraph content3 = new Paragraph("", smallRegular);
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yy HH-mm-ss");
            Date dateNow = new Date();
            content3.add("Date Format: MM-dd-yy HH-mm-ss \n");
            content3.add(String.format(String.format("Date Generated: %s", dateFormat.format(dateNow)), reportType));
            content3.setAlignment(Element.ALIGN_LEFT);
            addEmptyLine(content3, 1);
            document.add(content3);

        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    private void createTable(Document document, ResultSet data) {
        try {
            ResultSetMetaData metaData = data.getMetaData();
            int getColumnCount = metaData.getColumnCount();
            PdfPTable table = new PdfPTable(getColumnCount);
            table.setSplitLate(false);
            for (int i = 1; i <= getColumnCount; i++) {
                PdfPCell c1 = new PdfPCell(new Phrase(metaData.getColumnName(i), smallBold));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
            }
            table.completeRow();
            document.add(table);

            int counter = 0;
            while (data.next()) {
                counter++;
                PdfPTable dataTable = new PdfPTable(getColumnCount);
                if (counter % 15 == 0) {
                    document.newPage();
                    Paragraph spaceMaker = new Paragraph("");
                    addEmptyLine(spaceMaker, 4);
                    document.add(spaceMaker);
                }
                for (int i = 1; i <= getColumnCount; i++) {
                    dataTable.addCell(data.getString(i));
                }
                dataTable.completeRow();
                document.add(dataTable);
            }
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (SQLException ae) {
            ae.printStackTrace();
        }

    }

    public void putPageNumbers(String src, String dest, OutputStream out) {
        try {
            PdfReader reader = new PdfReader(src);
            int n = reader.getNumberOfPages();
            PdfStamper stamper = new PdfStamper(reader, out);
            PdfContentByte pagecontent;
            for (int i = 0; i < n;) {
                pagecontent = stamper.getOverContent(++i);
                ColumnText.showTextAligned(pagecontent, Element.ALIGN_RIGHT, new Phrase(String.format("page %s of %s", i, n)), 550, 30, 0);
            }
            stamper.close();
            reader.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException a) {
            a.printStackTrace();
        }
        deleteFile(src);
    }

    public void deleteFile(String filetoDelete) {
        File obj = new File(filetoDelete);
        System.out.println(String.format("File to Delete: %s", filetoDelete));
        obj.delete();
    }

    private void createList(Section subCatPart) {
        List list = new List(true, false, 10);
        list.add(new ListItem("First point"));
        list.add(new ListItem("Second point"));
        list.add(new ListItem("Third point"));
        subCatPart.add(list);
    }

    private void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }

}
