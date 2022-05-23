/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author FV
 */
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class HeaderFooterPageEvent extends PdfPageEventHelper {

    private String generatedBy;
    private Image logo;

    public HeaderFooterPageEvent(String user) {
        String imageFile = "";
        try {
            this.logo = Image.getInstance(imageFile);
            this.generatedBy = user;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onStartPage(PdfWriter writer, Document document) {
        try {
            logo.scaleToFit(500, 70);
            logo.setAbsolutePosition(215, 780);
            document.add(logo);
            document.setMargins(1, 1, 1, 1);
        } catch (Exception x) {
            x.printStackTrace();
        }
//        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("Top Right"), 550, 800, 0);
    }

    public void onEndPage(PdfWriter writer, Document document) {
        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase(this.generatedBy), 110, 30, 0);
        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase(String.format("%d", document.getPageNumber())), 550, 30, 0);
    }

}
