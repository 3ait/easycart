package com.easycart.controller.statistics;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.statistics.logic.StatisticsLogic;

@Controller
@RequestMapping("/administratro/statistics")
public class StatisticsController {

	
	@Autowired
	StatisticsLogic statisticsLogic;
	
	/**
	 * page view 统计
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index(@RequestParam(value="from",required=false,defaultValue="") String from, @RequestParam(value="to",required=false,defaultValue="")  String to) {
		ModelAndView modelAndView = new ModelAndView("admin/statistics/log_url");
		
		
		modelAndView.addObject("categoryLight",12);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if("".equals(from)){
			//默认一个月的日志
			Calendar calendar = Calendar.getInstance(); 
			calendar.setTime(calendar.getTime());
			calendar.add(Calendar.MONTH, -1);
			from = df.format(calendar.getTime());
		}
		if("".equals(to)){
			to = df.format(Calendar.getInstance().getTime());
		}
		
		try {
			modelAndView.addObject("dateNumber", statisticsLogic.getLogUrl(df.parse(from) ,df.parse(to)));
			modelAndView.addObject("urlList", statisticsLogic.getLogUrlNumber(df.parse(from) ,df.parse(to),30));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		modelAndView.addObject("from", from);
		modelAndView.addObject("to", to);
		
		return modelAndView;
	}
	
	
	
}
