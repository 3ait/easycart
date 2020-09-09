package com.mail.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.easycart.controller.admin.companyinfo.CompanyInfoView;
import com.easycart.controller.admin.companyinfo.logic.CompanyInfoLogic;
import com.easycart.db.dao.IOrderDao;
import com.easycart.db.dao.IOrderRecordDao;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.OrderRecord;


@Component("royalDeerMailLogic")
public class RoyalDeerMailLogic {
	@Autowired
	IOrderDao orderDao;
	@Autowired
	IOrderRecordDao orderRecordDao;
	@Autowired
	SendMail sendMail;
	@Autowired
	CompanyInfoLogic companyInfoLogic;

	/**
	 *  新订单邮件
	 */
	public void newOrderMail(int orderId, Customer customer) {
		Order order = orderDao.getOrder(orderId, customer.getId());

		if (order != null) {
			StringBuffer subject = new StringBuffer();
			subject.append("新订单(New Order)：   Phone:" + customer.getPhone());

			CompanyInfoView CompanyInfo = companyInfoLogic.getCompanyInfo();
			MailProperty mailProperty = new MailProperty();
			mailProperty.setEmail(CompanyInfo.getEmail());
			mailProperty.setPassword(CompanyInfo.getEmailPassword());
			mailProperty.setDebug("false");
			mailProperty.setHost(CompanyInfo.getEmailSmtp());
			mailProperty.setTo(CompanyInfo.getEmail());
			mailProperty.setCc("");
			sendMail.send(mailProperty, subject.toString(), mailContent(order,customer,null));
			
		}
	}
	
	/**
	 *  支付后的邮件
	 */
	public void paidMail(int orderId, Customer customer,String unionpayId) {
		Order order = orderDao.getOrder(orderId, customer.getId());

		if (order != null) {
			StringBuffer subject = new StringBuffer();
			subject.append("已支付订单(paid Order)：   Phone:" + customer.getPhone());

			CompanyInfoView CompanyInfo = companyInfoLogic.getCompanyInfo();
			MailProperty mailProperty = new MailProperty();
			mailProperty.setEmail(CompanyInfo.getEmail());
			mailProperty.setPassword(CompanyInfo.getEmailPassword());
			mailProperty.setDebug("false");
			mailProperty.setHost(CompanyInfo.getEmailSmtp());
			mailProperty.setTo(CompanyInfo.getEmail());
			mailProperty.setCc("");
			sendMail.send(mailProperty, subject.toString(), mailContent(order,customer,unionpayId));
		}
	}
	
	/**
	 * 邮件内容
	 * @param order
	 * @param customer
	 * @param unionpayId null 不显示
	 * @return String
	 */
	public String mailContent(Order order,Customer customer,String unionpayId){
		
		
		List<OrderRecord> orderRecordList = orderRecordDao.getByOrderId(order.getId());
		
		StringBuffer content = new StringBuffer();

		content.append("<!DOCTYPE html>");
		content.append("<html lang='en'>");
		content.append("<head>");
		content.append("<meta charset='UTF-8' />");
		content.append(" <title></title>");
		
		content.append(" <div>");
		content.append("Order ID：" + order.getId()).append("<br/><br/>");
		if(unionpayId!=null){
			content.append("UnionPay ID：" + unionpayId).append("<br/><br/>");
		}
		content.append("CustomerName:" + customer.getName() + "Email:" + customer.getEmail()  +  "&nbsp;     &nbsp;Phone:" + customer.getPhone()).append("<br/><br/>");
		content.append("</div>");

		content.append(" <div>");
		content.append("<div>");
		content.append("<table style='border-collapse:collapse'>");
		content.append(" <tr>");
		content.append(" <td style='border:1px solid #999999;width: 200px;'>发件人姓名/From Name</td>");
		content.append(" <td style='border:1px solid #999999;width: 200px;'>发件人电话/From Phone</td>");
		content.append("<td style='border:1px solid #999999;width: 200px;'>发件人地址/From Address</td>");
		content.append("</tr>");
		content.append(" <tr>");

		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromName()));
		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromPhone()));
		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromAddress()));

		content.append(" </tr>");
		content.append("<tr>");
		content.append("<td style='border:1px solid #999999;width: 200px;'>收件人姓名/To Name</td>");
		content.append("<td style='border:1px solid #999999;width: 200px;'>收件人电话/To Phone</td>");
		content.append("<td style='border:1px solid #999999;width: 200px;'>收件人地址/To Address</td>");
		content.append("</tr>");
		content.append("<tr>");
		
		
		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToName()));
		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToPhone()));
		content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToAddress()));
		
		
		content.append("</tr></table></div></div>");
		content.append("<div style='height:20px;'></div>");
		content.append("<div><table style='border-collapse:collapse'><tr ><td style='border:1px solid #999999;width: 150px;'>产品名称/ProductName</td><td style='border:1px solid #999999;width: 150px;'>条码/Barcode</td><td style='border:1px solid #999999;width: 150px;'>数量/Num</td><td style='border:1px solid #999999;width: 150px;'>单价/SinglePrice(NZD)</td></tr>");
		
		orderRecordList.forEach(or -> {
			content.append("<tr>");
			content.append(String.format("<td style='border:1px solid #999999;width: 150px;'>%s</td>", or.getProduct().getProductNameCn()));
			content.append(String.format("<td style='border:1px solid #999999;width: 150px;'>%s</td>", or.getProduct().getMpn()));
			content.append(String.format("<td style='border:1px solid #999999;width: 150px;'>%s</td>", or.getNum()+""));
			content.append(String.format("<td style='border:1px solid #999999;width: 150px;'>%s</td>", or.getProductPrice()+""));
			content.append("</tr>");
		});
		
		content.append("<tr><td colspan='4' style='border:1px solid #999999;width: 200px;'> ");
		content.append("用户折扣(CustomerDiscount)：").append(customer.getDiscount()).append("<br/>");
		content.append("产品合计(ProductPrice)：$").append(order.getTotalProductPrice()).append("<br/>");
		content.append("运费合计(Freight)：$").append(order.getTotalFreight()).append("<br/>");
		content.append("价格合计(TotalPrice NZD)：$").append(order.getTotalProductPrice() + order.getTotalFreight()).append("<br/>");
		
		content.append("</td></tr></table></div></head><body></body></html>");
		
		return content.toString();
	}
}
