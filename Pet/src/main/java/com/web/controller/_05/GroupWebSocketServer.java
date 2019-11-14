package com.web.controller._05;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

//groupId為前端帶來的值，這邊設定為群組ID&會員ID
@ServerEndpoint("/groupchat/{groupId}/{memberId}")
@Component
public class GroupWebSocketServer {
	// 使用map來收集websocket session，key為groupId，value為同一群組的會員
	private static final Map<String, Set<Session>> groups = new ConcurrentHashMap();
	private static final Map<String, String> members = new ConcurrentHashMap();

	// 建立websocket連線
	@OnOpen
	public void connect(@PathParam("groupId") String groupId, @PathParam("memberId") String memberId, Session session)
			throws Exception {
		// 將連接websocket的會員，依不同群組隔離
		if (!groups.containsKey(groupId)) {
			System.out.println("xxxxx");
			// 群組不存在則建立群組
			Set<Session> room = new HashSet<Session>();
			// 群組加入成員
			room.add(session);
			groups.put(groupId, room);
		} else {
			// 群組已存在直接加會員到群組
			groups.get(groupId).add(session);
		}
//		System.err.println("memberId" + memberId);
//		System.out.println("a client has connected!");
//		System.out.println("groupId=" + groupId);
	}

	// 關閉websocket連線
	@OnClose
	public void disConnect(@PathParam("groupId") String groupId, @PathParam("memberId") String memberId,
			Session session) {
		groups.get(groupId).remove(session);
		System.out.println("a client has disconnected" + memberId);
	}

	// 傳遞訊息
	@OnMessage
	public void receiveMsg(@PathParam("groupId") String groupId, @PathParam("memberId") String memberId, String msg,
			Session session) throws Exception {

//		System.out.println(msg);
		// 接收到信息則進行傳遞訊息
		instantMsg(groupId, msg);
	}

	// 設計依群組傳遞訊息
	public static void instantMsg(String groupId, String msg) throws Exception {
		for (Session session : groups.get(groupId)) {
			session.getBasicRemote().sendText(msg);
		}
	}
}
