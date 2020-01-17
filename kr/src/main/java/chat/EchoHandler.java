package chat;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mn.project.util.SessionClass;

public class EchoHandler extends TextWebSocketHandler {
	private String myid;
	private String yourid;
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Inject
	SessionClass getids;

	public String getid(String myid) {
		this.myid = myid;
		System.out.println(this.myid);
		return this.myid;
	}
	public String getyourid(String yourid) {
		this.yourid = yourid;
		System.out.println(this.yourid);
		return this.yourid;
	}
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		File file = new File("C:\\Users\\11\\Desktop\\" + getids.getId("myid")+ getids.getId("yourid") + ".txt");
		File file2 = new File("C:\\Users\\11\\Desktop\\" + getids.getId("yourid")+ getids.getId("myid") + ".txt");

		FileWriter writer = null;
		FileWriter writer2 = null;
		BufferedWriter bWriter = null;
		BufferedWriter bWriter2 = null;

		if (!file.exists()&&!file2.exists()) {
			try {
				file.createNewFile();
				file2.createNewFile();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String mes = message.getPayload();
		
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(mes));
			try {
				writer = new FileWriter(file, true);
				bWriter = new BufferedWriter(writer);
				bWriter.write(mes+"\r\n");
				bWriter.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (bWriter != null)
						bWriter.close();
					if (writer != null)
						writer.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			try {
				writer2 = new FileWriter(file2, true);
				bWriter2 = new BufferedWriter(writer2);
				bWriter2.write(mes+"\r\n");
				bWriter2.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (bWriter2 != null)
						bWriter2.close();
					if (writer2 != null)
						writer2.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}