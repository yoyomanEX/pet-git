package com.web.controller._05;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
@ServerEndpoint(value = "/onebyonechat/{toname}/{sendname}")
public class OneByOneWebSocket {

//	private static MessageService service;
//
//	
//	@Autowired
//	public static void setService(MessageService service) {
//		OneByOneWebSocket.service = service;
//	}

	// 記錄當前在線連接數
	Logger logger = LoggerFactory.getLogger(getClass());
	private static int onlineCount = 0;
	private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// 用來存放每個會員對應的MyWebSocket對象
	private static CopyOnWriteArraySet<OneByOneWebSocket> webSocketSet = new CopyOnWriteArraySet<OneByOneWebSocket>();
	private static CopyOnWriteArraySet<String> usernameSet = new CopyOnWriteArraySet<>();

	// 與某個客戶端的連接會話，需要通過它來給客戶端發送數據
	private Session session;
	private String sendName;
	private String toName;

	// 建立連線
	@OnOpen
	public void onOpen(Session session, @PathParam("sendname") String sendName, @PathParam("toname") String toName) {
		this.session = session;
		this.sendName = sendName;
		// 加入set中
		webSocketSet.add(this);
		usernameSet.add(sendName);
//		List<MessageBean> mb = service.getByToUser(toName, sendName);
//	
//		for (OneByOneWebSocket item : webSocketSet) {
//
//			for (MessageBean m : mb) {
//				try {
//					item.sendMessage(m.getContent());
//				}
//				catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		service.deleteByToUser(toName, sendName);
		
//		System.out.println(usernameSet.contains("dylan"));
//		System.out.println(this.session.getContainer());
		// foreach
//		for(String u:usernameSet) {
//			System.out.println("u:" + u);
//		}
//	    System.out.println(usernameSet.contains("dylan2"));
//	    Iterator iterator = usernameSet.iterator();
//        while(iterator.hasNext()){
//                System.out.println(iterator.next());
//        }
//	    System.out.println(webSocketSet.contains("dylan2"));
//	    Iterator iterator1 = webSocketSet.iterator();
//        while(iterator.hasNext()){
//                System.out.println(iterator1.next());
//        }
	}

	// 關閉連線
	@OnClose
	public void onClose() throws IOException {
		// 從set中刪除
		webSocketSet.remove(this);
		usernameSet.remove(sendName);
	}

	/**
	 * 回傳訊息給前端
	 *
	 * @param message 客戶端發送過來的消息
	 */
	@OnMessage
	public void onMessage(String message) {
		JsonParser jsonParser = new JsonParser();
		// 將json字符串轉化成json對象
		// 運用取出來的toName、content、sendName

		
		String date = format.format(new Date().getTime());
		JsonObject jsonObject = jsonParser.parse(message).getAsJsonObject();
		String content = jsonObject.get("content").getAsString();
		String toName = jsonObject.get("toName").getAsString();
		String sendName = jsonObject.get("sendName").getAsString();

		Gson gson = new Gson();
		Map aa = gson.fromJson(message, Map.class);
		aa.put("content", "不在線上");
		aa.put("sendName", toName);
		aa.put("toName", sendName);
		String nouserMessage = gson.toJson(aa);
		String messageBody = message;
		System.out.println("nouserMessage="+nouserMessage);
//		String nouserMessage="{"+"'sendName'"+":"+sendName+","+"content"+":"+"下線"+","+"toName"+":"+toName+"}";
//		System.out.println(messageBody);
		logger.info(messageBody);
		for (OneByOneWebSocket item : webSocketSet) {
			try {
				if (item.sendName.equals(toName) || item.sendName.equals(this.sendName)) {
					if (usernameSet.contains(toName)) {
						item.sendMessage(messageBody);
					} else {
						
						item.sendMessage(nouserMessage);
						
					}
//					System.out.println(usernameSet.contains("dylan"));

				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
//	    }

	/**
	 * @param error 出錯方法
	 */
	@OnError
	public void onError(Throwable error) {
		String date = format.format(new Date().getTime());
		logger.error(date + ":  " + this.sendName + "   連接發送錯誤");
		error.printStackTrace();
	}

	// 基本方法，傳訊息
	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
	}

	// 取得線上人數
	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	// 增加線上人數
	public static synchronized void addOnlineCount() {
		OneByOneWebSocket.onlineCount++;
	}

	// 減少線上人數
	public static synchronized void subOnlineCount() {
		OneByOneWebSocket.onlineCount--;
	}
}
