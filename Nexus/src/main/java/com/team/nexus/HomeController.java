package com.team.nexus;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Autowired
    private kakaoService kakaoService;
	// 1�� īī���忡 ����� �ڵ� �ޱ�(jsp�� a�±� href�� ��� ����)
	@RequestMapping(value = "/kakao", method = RequestMethod.GET, produces = "application/hal+json; charset=UTF-8" )
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {
		String access_Token = kakaoService.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
		
		return null;	
		// return�� �������� �ص� �ǰ�, ���⼭�� �ڵ尡 �Ѿ�������� Ȯ���Ұű� ������ ���� return ���� ������ �ʾ���

	}
	
	
}
