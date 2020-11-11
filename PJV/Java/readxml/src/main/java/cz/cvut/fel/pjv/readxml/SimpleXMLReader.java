package cz.cvut.fel.pjv.readxml;
 
import java.io.FileInputStream;
import java.io.InputStream;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;
 
public class SimpleXMLReader {
 
    public static void main(String[] args) throws Exception {
        InputStream in = new FileInputStream("c:\\tmp\\input.xml");
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLStreamReader parser = factory.createXMLStreamReader(in);
        while (parser.hasNext()) {
            System.out.println("Zjistuji novy event!!!!!");
            int event = parser.next();
            System.out.println("Event type:"+parser.getEventType());
            if (event == XMLStreamConstants.START_ELEMENT) {
                System.out.println(">Event type START_ELEMENT");
                System.out.println(">TAG:"+parser.getLocalName());
                System.out.println("->Atribute count:"+parser.getAttributeCount());
                if (parser.getAttributeCount() > 0) {
                    for (int i = 0; i < parser.getAttributeCount(); i++) {
                        System.out.println("-->Atribute name:" + parser.getAttributeName(i));
                        System.out.println("-->Atribute type:" + parser.getAttributeType(i));
                        System.out.println("-->Atribute value:" + parser.getAttributeValue(i));
                    }
                }               
            }
 
            if (event == XMLStreamConstants.CHARACTERS){
                System.out.println(">Event type CHARACTERS"); 
                System.out.println("->Text: >"+parser.getText()+"<");
            }
            if (event == XMLStreamConstants.END_ELEMENT){
                System.out.println(">Event type END_ELEMENT");
                System.out.println(">TAG:"+parser.getLocalName());
            }
 
        }
    }
}
