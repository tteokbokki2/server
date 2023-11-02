package com.test.toy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.toy.DBUtil;

public class Dummy {
	
	public static void main(String[] args) {
		
		try {
			
			Connection conn = null;
			PreparedStatement stat = null;
			
			conn = DBUtil.open();
			
			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, id) values (seqBoard.nextVal, ?, '내용', default, default, 'hong')";
			
			String temp = "[헤럴드경제=윤호 기자] 비트코인이 미국의 금리동결과 채권금리 하락에 급등하고 있다.2일 오전 코인마켓캡에 따르면 비트코인은 전날보다 2.8% 오른 3만5000달러대에 거래되고 있다. 국내 거래소인 업비트와 빗썸에서는 각각 4690만원, 4790만원에 거래 중이다.24시간 거래되는 비트코인이 매일 오전 9시 집계되는 코인마켓캡 종가기준으로 올해 3만5000달러를 넘어선 적은 없었으며, 이날 올해 최초로 종가기준 3만5000달러선을 기록할 것으로 전망된다. 비트코인이 종가기준 3만5000달러를 기록한 것은 지난해 5월 테라-루나 사태 당시 내리막이 가장 최근 수치다.이날 미국 국채금리는 민간 고용 지표에 하락세를 보인 이후 재무부의 분기 재차입 계획이 발표된 후 낙폭을 확대했다. 또한 연방공개시장위원회(FOMC) 회의 결과 금리동결이 확정되자 추가 하락했다. 연준의 추가 금리 인상 가능성이 크게 줄었기 때문이다.미 연방준비제도는 FOMC 정례회의에서 기준 금리를 5.25~5.50%로 유지키로 만장일치로 결정했다. 제롬 파월 연준 의장은 당장은 금리 인하는 고려하지 않는다고 밝혔다. 다만 파월 의장은 당장 추가 인상 가능성을 강하게 시사하는 발언을 하지 않았고, 시장에서는 예상보다는 덜 매파적인 금리 동결이라는 평가가 나온다. 주식보다 더 위험한 자산인 비트코인은 금리에 매우 민감하다.한편 전날 미 투자회사 번스타인은 비트코인 가격이 2년 내 2억원으로 치솟을 것이라고 전망했다.번스타인은 보고서를 통해 비트코인이 새로운 사이클을 시작하면서 2025년 중반까지 15만달러(2억295만원)까지 치솟을 것으로 예상된다고 밝혔다. 비트코인이 다가오는 반감기와 최초의 현물 비트코인 상장지수펀드(ETF) 승인 가능성 등 잠재적으로 큰 산업 시장의 변화를 목전에 두고 있다는 분석이다.세계 최대 자산운용사 블랙록 등 여러 운용사가 미 증권거래위원회(SEC)에 현물 비트코인 ETF 신청서를 제출해 승인을 기다리고 있다. 반감기는 비트코인 채굴로 주어지는 공급량이 4년마다 절반씩 줄어드는 시기로, 시장에서는 그 시기를 내년 4월로 예상하고 있다.";
			
			String[] templist = temp.split(" ");
			
			Random rnd = new Random();
			
			stat = conn.prepareStatement(sql);
			
			for (int i=0; i<250; i++) {
				
				String subject = "";
				
				for (int j=0; j<5; j++) {
					subject += templist[rnd.nextInt(templist.length)] + " ";
				}
				
				stat.setString(1, subject);
				stat.executeUpdate();
				System.out.println(i);
	
			}
			
			stat.close();
			conn.close();
			
			
			
		} catch (Exception e) {
			System.out.println("Dummy.main()");
			e.printStackTrace();
		}
		
	}
}
