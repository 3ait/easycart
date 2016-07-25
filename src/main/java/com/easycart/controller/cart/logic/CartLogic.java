package com.easycart.controller.cart.logic;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.easycart.controller.BaseLogic;
import com.easycart.controller.cart.ConfirmView;
import com.easycart.controller.index.ProductView;
import com.easycart.db.dao.ICustomerDao;
import com.easycart.db.dao.IFromAddressDao;
import com.easycart.db.dao.IMenuDao;
import com.easycart.db.dao.IOrderDao;
import com.easycart.db.dao.IOrderRecordDao;
import com.easycart.db.dao.IProductDao;
import com.easycart.db.dao.IToAddressDao;
import com.easycart.db.entity.Cart;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.FromAddress;
import com.easycart.db.entity.Menu;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.OrderRecord;
import com.easycart.db.entity.Product;
import com.easycart.db.entity.ToAddress;
import com.easycart.utils.DateHelper;
import com.easycart.utils.Md5;
import com.latipay.config.LatipayConfig;
import com.mail.logic.SendMail;

/**
 * 
 * @author yaoliang
 *
 */
@Component("cartLogic")
public class CartLogic extends BaseLogic {

	@Autowired
	IProductDao productDao;
	@Autowired
	IMenuDao menuDao;
	@Autowired
	IFromAddressDao fromAddressDao;
	@Autowired
	IToAddressDao toAddressDao;
	@Autowired
	IOrderDao orderDao;
	@Autowired
	IOrderRecordDao orderRecordDao;
	@Autowired
	ICustomerDao customerDao;
	@Autowired
	SendMail sendMail;

	/**
	 * 根据多个产品ID获取产品
	 * 
	 * @param ids
	 * @return
	 */
	@Transactional(rollbackOn = Exception.class)
	public List<ProductView> getProductByIds(List<Cart> cartList, Customer customer) {
		List<ProductView> pvList = new ArrayList<>();
		cartList.forEach(cart -> {
			Product p = productDao.getById(cart.getProduct().getId());
			if (p != null) {
				ProductView pv = this.getProductView(p, customer);
				pv.setNum(cart.getProductNum());
				pvList.add(pv);
			}
		});

		return pvList;
	}

	/**
	 * 获取发货人地址
	 * 
	 * @param customerId
	 * @return
	 */
	public List<FromAddress> getFromAddress(int customerId) {
		return fromAddressDao.getFromAddressByCustomerId(customerId);
	}

	/**
	 * 获取收获人地址
	 * 
	 * @param customerId
	 * @return
	 */
	public List<ToAddress> getToAddress(int customerId) {
		return toAddressDao.getToAddressByCustomerId(customerId);
	}

	/**
	 * 获取总运费与商品总价 按照所选商品的最低运费
	 * 
	 * @param productViewList
	 * @return Double[] 0 totalprice 1 totalFreight
	 */
	public Double[] getProductTotalPrice(List<ProductView> productViewList, double discount) {
		// 0 totalprice 1 totalFreight
		Double[] total = new Double[] { 0d, 0d };
		if (productViewList.size() > 0) {
			NumberFormat nf = new DecimalFormat("0.00");
			total[0] = new Double(nf.format(productViewList.stream()
					.map(pv -> pv.getNum() * pv.getProduct().getPrice1()).reduce(0D, (a, b) -> a + b) * discount));
			double productWeight = productViewList.stream().map(pv -> pv.getNum() * pv.getProduct().getWeight())
					.reduce(0D, (a, b) -> a + b);

			// 按照 升价排序
			Set<Integer> menu1Ids = new HashSet<>();
			productViewList.forEach(p -> menu1Ids.add(p.getProduct().getMenu().getFatherId()));

			Menu lowestUnitPriceMenu = menuDao.getMenuByIds(menu1Ids.toArray(new Integer[menu1Ids.size()])).get(0);
			Double totalWeight = (productWeight + lowestUnitPriceMenu.getBoxWeight());

			totalWeight = totalWeight < 1 ? 1D : totalWeight;

			total[1] = new Double(nf.format(totalWeight * lowestUnitPriceMenu.getUnitePrice()));
		}
		return total;
	}

	/**
	 * 保存订单数据
	 * 
	 * @param customer
	 * @param cartList
	 * @param confirmView
	 */
	@Transactional(rollbackOn = Exception.class)
	public Order saveOrder(Customer customer, List<Cart> cartList, ConfirmView confirmView) {

		// 保存用户,线检查是否登陆，再检查用户电话号码
		if (customer == null) {
			customer = customerDao.getByPhone(confirmView.getFromPhone());
			if (customer == null) {
				customer = new Customer();
				customer.setEmail("");
				customer.setName(confirmView.getFromName());
				customer.setPhone(confirmView.getFromPhone());
				customer.setPassword(Md5.getMd5String(confirmView.getFromPhone()));
				customer.setDiscount(1D);
				customer.setStatus((byte) 1);
				customerDao.save(customer);
			}
		}
		// 保存用户fromAddress
		if ((fromAddressDao.getByFromPhone(confirmView.getFromPhone()) == null)) {
			FromAddress fromAddress = new FromAddress();
			fromAddress.setCustomer(customer);
			fromAddress.setDefaultAddress(1);
			fromAddress.setFromName(confirmView.getFromName());
			fromAddress.setFromPhone(confirmView.getFromPhone());
			fromAddress.setFromAddress(confirmView.getFromAddress());
			fromAddressDao.save(fromAddress);

		}
		if (toAddressDao.getByToPhone(confirmView.getToPhone()) == null) {
			// 保存用户toAddress
			ToAddress toAddress = new ToAddress();
			toAddress.setCustomer(customer);
			toAddress.setToPhone(confirmView.getToAddress());
			toAddress.setToAddress(confirmView.getToAddress());
			toAddressDao.save(toAddress);
		}

		// 保存订单
		Order order = new Order();
		order.setCustomer(customer);
		order.setPayType("");
		order.setIsPayed(0);
		order.setTotalFreight(confirmView.getTotalFreight());
		order.setTotalProductPrice(confirmView.getTotalProductPrice());
		order.setCustomerMsg(confirmView.getCustomerMessage());
		order.setAdminMsg("");
		order.setStatus(0);
		order.setCreateTime(DateHelper.getTime());
		order.setModifyTime(DateHelper.getTime());

		order.setFromName(confirmView.getFromName());
		order.setFromPhone(confirmView.getFromPhone());
		order.setFromAddress(confirmView.getFromAddress());
		order.setToName(confirmView.getToName());
		order.setToPhone(confirmView.getToPhone());
		order.setToAddress(confirmView.getToAddress());

		orderDao.save(order);

		for (Cart cart : cartList) {
			OrderRecord orderRecord = new OrderRecord();
			orderRecord.setCustomer(customer);
			orderRecord.setOrder(order);
			Product product = productDao.getById(cart.getProduct().getId());
			orderRecord.setProduct(product);
			orderRecord.setNum(cart.getProductNum());
			orderRecord.setProductPrice(product.getPrice1());
			// 换批量保存
			orderRecordDao.save(orderRecord);
		}

		return order;
	}

	/**
	 * 保存发件人地址
	 * 
	 * @param fa
	 */
	@Transactional(rollbackOn = Exception.class)
	public void saveFromAddress(FromAddress fa) {
		fromAddressDao.save(fa);
	}

	/**
	 * 删除发件人地址
	 * 
	 * @param fa
	 */
	@Transactional(rollbackOn = Exception.class)
	public void deleteFromAddress(FromAddress fa) {
		FromAddress ret = fromAddressDao.get(fa);
		if (ret != null) {
			fromAddressDao.delete(ret);
		}
	}

	/**
	 * 保存收件人
	 * 
	 * @param fa
	 */
	@Transactional(rollbackOn = Exception.class)
	public void saveToAddress(ToAddress ta) {
		toAddressDao.save(ta);
	}

	/**
	 * 删除收货人地址
	 * 
	 * @param fa
	 */
	@Transactional(rollbackOn = Exception.class)
	public void deleteToAddress(ToAddress ta) {
		ToAddress ret = toAddressDao.get(ta);
		if (ret != null) {
			toAddressDao.delete(ret);
		}
	}

	/**
	 * 获取latipay的支付参数 LatipayConfig
	 * 
	 * @return String
	 */
	public LatipayConfig getLatiPayConfig(int id, Customer customer, String currency) {

		Order order = orderDao.getOrder(id, customer.getId());

		return LatipayConfig.getInstance(customer, currency, order);

	}

	/**
	 * 发送邮件
	 */
	public void sendMail(int orderId, Customer customer) {
		Order order = orderDao.getOrder(orderId, customer.getId());

		if (order != null) {
			StringBuffer subject = new StringBuffer();
			subject.append("新订单：   Phone:" + customer.getPhone());

			List<OrderRecord> orderRecordList = orderRecordDao.getByOrderId(orderId);
			StringBuffer content = new StringBuffer();
			content.append("订单ID：" + order.getId()).append("<br/><br/>");
			content.append("CustomerName:" + customer.getName() + "   Phone" + customer.getPhone()).append("<br/><br/>");

			content.append("<!DOCTYPE html>");
			content.append("<html lang='en'>");
			content.append("<head>");
			content.append("<meta charset='UTF-8'>");
			content.append(" <title></title>");

			content.append(" <div>");
			content.append("<div>");
			content.append("<table style='border-collapse:collapse'>");
			content.append(" <tr>");
			content.append(" <td style='border:1px solid #999999;width: 200px;'>发件人姓名</td>");
			content.append(" <td style='border:1px solid #999999;width: 200px;'>发件人电话</td>");
			content.append("<td style='border:1px solid #999999;width: 200px;'>发件人地址</td>");
			content.append("</tr>");
			content.append(" <tr>");

			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromName()));
			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromPhone()));
			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getFromAddress()));

			content.append(" </tr>");
			content.append("</table>");
			content.append("</div>");
			content.append("<br/>");
			content.append("<br/>");
			content.append("<div>");
			content.append("<table>");
			content.append("<tr>");
			content.append("<td style='border:1px solid #999999;width: 200px;'>收件人姓名</td>");
			content.append("<td style='border:1px solid #999999;width: 200px;'>收件人电话</td>");
			content.append("<td style='border:1px solid #999999;width: 200px;'>收件人地址</td>");
			content.append("</tr>");
			content.append("<tr>");
			
			
			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToName()));
			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToPhone()));
			content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", order.getToAddress()));
			
			
			content.append("</tr></table></div></div><br/><br/><div><table ><tr ><td style='border:1px solid #999999;width: 200px;'>产品名称</td><td style='border:1px solid #999999;width: 200px;'>条码</td><td style='border:1px solid #999999;width: 200px;'>数量</td><td style='border:1px solid #999999;width: 200px;'>单价</td></tr>");
			
			orderRecordList.forEach(or -> {
				content.append("<tr>");
				content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", or.getProduct().getProductNameCn()));
				content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", or.getProduct().getMpn()));
				content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", or.getNum()+""));
				content.append(String.format("<td style='border:1px solid #999999;width: 200px;'>%s</td>", or.getProductPrice()+""));
				content.append("</tr>");
			});
			
			content.append("<tr><td colspan='4' height='40px;' style='border:1px solid #999999;width: 200px;'></td></tr><tr><td colspan='4' style='border:1px solid #999999;width: 200px;'> ");
			content.append("用户折扣：").append(customer.getDiscount()).append("<br/>");
			content.append("产品合计：").append(order.getTotalProductPrice()).append("$<br/>");
			content.append("运费合计：").append(order.getTotalFreight()).append("$<br/>");
			content.append("价格合计：").append(order.getTotalProductPrice() + order.getTotalFreight()).append("$<br/>");
			
			content.append("</td></tr></table></div></head><body></body></html>");
			
			sendMail.send(subject.toString(), content.toString(),customer.getEmail());

		}
	}
}
