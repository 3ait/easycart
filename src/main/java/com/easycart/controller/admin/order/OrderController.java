package com.easycart.controller.admin.order;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.order.logic.OrderLogic;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.User;
import com.easycart.utils.Page;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

/**
 * order
 * @author yaoliang
 * 24-12-2015
 */
@Controller
@RequestMapping(value={"/administratro/order"})
public class OrderController extends BaseController{
	private static Logger logger = LogManager.getLogger(OrderController.class);
	private static int light = 1;
	@Autowired
	OrderLogic orderLogic;

	
	/**
	 * 订单
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView index(@ModelAttribute(value="orderSearchForm") @Valid OrderSearchForm orderSearchForm,BindingResult br,
			@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
		logger.debug("index");
		
		ModelAndView mv = new ModelAndView("admin/order/admin_order");
		mv.addObject(ADMIN_CATEGORY_LIGHT, light);
		mv.addObject("orderSearchForm", orderSearchForm);
		
		if(br.hasFieldErrors()){
			return mv;
		}
		
		Page page = new Page(pageNum,orderLogic.getOrderCount(orderSearchForm, new Page()));
		page.setPageNum(pageNum);
		
		mv.addObject("page", page);
		mv.addObject("productViewList", orderLogic.getOrderViewList(orderSearchForm, page));
		
		return mv;
	}
	
	
	/**
	 *  订单列表---编辑保存
	 * @return
	 */
	@RequestMapping("/list/edit/confirm")
	@ResponseBody
	public String listEditConfirm(
			@RequestParam(value="id",required=true,defaultValue="-1") int id,
			@RequestParam(value="isPayed",required=false,defaultValue="0") int isPayed,
			@RequestParam(value="status",required=false,defaultValue="0") int status,
			@RequestParam(value="adminMsg",required=false,defaultValue="") String adminMsg,
			@RequestParam(value="customerMsg",required=false,defaultValue="") String customerMsg,
			HttpServletRequest request
			){
		String ret = "success";
		if(id!=-1){
			Order order = new Order();
			order.setId(id);
			order.setIsPayed(isPayed);
			order.setStatus(status);
			order.setCustomerMsg(customerMsg);
			order.setAdminMsg(adminMsg);
			
			User user = (User) request.getAttribute(SESSION_USER);
			order.setUser(user);
			orderLogic.updateOrder(order);
		}else{
			ret = "fail";
		}
		return ret;
	}
	
	/**
	 * 打印订单
	 * @param orderId
	 * @param courierType
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="print/{orderId}/{courierType}",produces="application/pdf;")
	public void print(@PathVariable(value="orderId") Integer orderId,@PathVariable(value="courierType") String courierType,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		logger.debug("print");
		orderLogic.createPDF(orderId, courierType, response.getOutputStream());
		
		response.getOutputStream().flush();
	}
	/**
	 * 打印订单明细
	 * @param orderId
	 * @param courierType
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws DocumentException 
	 */
	@RequestMapping(value="print/detail/{orderId}",produces="application/pdf;")
	public void printDetail(@PathVariable(value="orderId") Integer orderId,HttpServletRequest request,
			HttpServletResponse response) throws IOException, DocumentException{
		
		logger.debug("printDetail");
		
		orderLogic.createOrderDetailPDF(orderId, response.getOutputStream());
		
		response.getOutputStream().flush();
	}

	
}
