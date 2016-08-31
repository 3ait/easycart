package com.easycart.controller.web.cart;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.easycart.controller.BaseController;
import com.easycart.controller.admin.companyinfo.CompanyInfoView;
import com.easycart.controller.admin.companyinfo.logic.CompanyInfoLogic;
import com.easycart.controller.admin.order.logic.OrderLogic;
import com.easycart.controller.web.cart.logic.CartLogic;
import com.easycart.controller.web.index.MenuView;
import com.easycart.controller.web.index.ProductView;
import com.easycart.controller.web.index.logic.IndexLogic;
import com.easycart.db.entity.Cart;
import com.easycart.db.entity.Customer;
import com.easycart.db.entity.FromAddress;
import com.easycart.db.entity.Order;
import com.easycart.db.entity.ToAddress;
import com.latipay.config.LatipayConfig;
import com.mail.logic.RoyalDeerMailLogic;
import com.unionpay.upop.sdk.QuickPayConf;
import com.unionpay.upop.sdk.QuickPayUtils;

/**
 * admin login
 * 
 * @author yaoliang 24-12-2015
 */
@Controller
@RequestMapping(value = "/cart")
public class CartController extends BaseController {

	private static Logger logger = LogManager.getLogger(CartController.class);

	@Autowired
	IndexLogic indexLogic;
	@Autowired
	CartLogic cartLogic;
	@Autowired
	CompanyInfoLogic companyInfoLogic;
	@Autowired
	OrderLogic orderLogic;
	@Autowired
	RoyalDeerMailLogic royalDeerMailLogic;
	
	/**
	 * 展示购物车 || 直接购买
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView cart(@RequestParam(required = false, value = "pid", defaultValue = "-1") int productId,
			HttpServletRequest request) {
		logger.debug("/");
		ModelAndView modelAndView = new ModelAndView("web/cart/cart");
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(productId, 1, request);

		List<ProductView> productViewList = cartLogic.getProductByIds(cartList, customer);
		modelAndView.addObject("productViewList", productViewList);

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(cartList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartList, customer));
		modelAndView.addObject("customer", customer);
		return modelAndView;
	}

	/**
	 * 订单确认页面
	 * 
	 * @return
	 */
	@RequestMapping("/confirm/{area}")
	public ModelAndView confirm(@PathVariable("area")String area, HttpServletRequest request) {
		logger.debug("checkout");
		ModelAndView modelAndView = new ModelAndView("web/cart/confirm");

		//只能选择香港，中国和新西兰
		ToArea toArea ;
		try {
			toArea = ToArea.valueOf(area);
		} catch (Exception e) {
			return new ModelAndView(new RedirectView(request.getServletContext().getContextPath() + "/cart/"));
		}
		
		
		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);
		if (cartList.size() == 0) {
			return new ModelAndView(new RedirectView(request.getServletContext().getContextPath() + "/cart/"));
		}

		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		List<ProductView> productViewList = cartLogic.getProductByIds(cartList, customer);
		modelAndView.addObject("productViewList", productViewList);

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(cartList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartList, customer));

		// 折扣
		Double discount = 1D;
		if (customer != null) {
			// 获取发货人地址信息
			modelAndView.addObject("fromAddressList", cartLogic.getFromAddress(customer.getId()));
			// 获取收货人地址信息
			modelAndView.addObject("toAddressList", cartLogic.getToAddress(customer.getId()));
			discount = customer.getDiscount();
		}

		Double[] priceAndFreight = cartLogic.getProductTotalPrice(productViewList, discount,toArea);
		// 产品总价
		modelAndView.addObject("productTotalPrice", priceAndFreight[0]);
		// 运费总价
		modelAndView.addObject("weightTotalPrice", priceAndFreight[1]);

		// confirm提交页面默认空数据
		ConfirmView confirmView = new ConfirmView();

		CompanyInfoView companyInfoView = companyInfoLogic.getCompanyInfo();
		confirmView.setFromName(companyInfoView.getCompanyName());
		confirmView.setFromPhone(companyInfoView.getCompanyPhone());
		confirmView.setFromAddress(companyInfoView.getCompanyAddress());

		confirmView.setTotalProductPrice(priceAndFreight[0]);
		confirmView.setTotalFreight(priceAndFreight[1]);
		modelAndView.addObject("confirmView", confirmView);
		modelAndView.addObject("customer", customer);

		return modelAndView;
	}

	/**
	 * 订单提交
	 * 
	 * @param request
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/confirm/submit/", method = RequestMethod.POST)
	public ModelAndView comfirmSubmit(HttpServletRequest request,
			@ModelAttribute(value = "confirmView") @Valid ConfirmView confirmView, BindingResult br) {
		logger.debug("comfirmSubmit");
		ModelAndView modelAndView = new ModelAndView("web/cart/checkout");
		if (null == request.getSession().getAttribute(SESSION_CART)) {
			return new ModelAndView(new RedirectView(request.getContextPath() + "/"));
		}
		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);
		if (br.hasFieldErrors()) {
			return new ModelAndView(new RedirectView(request.getContextPath() + "/cart/confirm/"));
		}

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		// 保存订单数据
		Order order = cartLogic.saveOrder(customer, cartList, confirmView);
		modelAndView.addObject("orderId", order.getId());
		if(customer==null){
			customer = order.getCustomer();
		}
		request.getSession().setAttribute(SESSION_CUSTOMER, customer);

		modelAndView.addObject("confirmView", confirmView);
		// 购物车产品数量
		modelAndView.addObject("productInCartNum", 0);
		// 清除SEssion数据
		request.getSession().removeAttribute(SESSION_CART);
		modelAndView.addObject("customer", customer);
		modelAndView.addObject("companyInfo", companyInfoLogic.getCompanyInfo());

		royalDeerMailLogic.newOrderMail(order.getId(), customer);
		return modelAndView;
	}

	/**
	 * checkout 支付
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping("/checkout/")
	public ModelAndView checkout(HttpServletRequest request) {
		logger.debug("checkout");
		ModelAndView modelAndView = new ModelAndView("");
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);

		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();
		modelAndView.addObject("menuViewList", menuList);

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);

		List<ProductView> productViewList = cartLogic.getProductByIds(cartList, customer);
		modelAndView.addObject("productViewList", productViewList);

		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(cartList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartList, customer));
		modelAndView.addObject("customer", customer);

		return modelAndView;
	}

	/**
	 * 添加到购物车
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/addToProduct", method = RequestMethod.POST)
	public int addProductToCart(@RequestParam(required = true, value = "productId") int productId,
			@RequestParam(required = true, value = "productNum") int productNum, HttpServletRequest request) {
		logger.debug("addProductToCart");
		return super.getCartNum(this.getAllProductFromSession(productId, productNum, request));
	}

	/**
	 * 保存发货人地址
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/save/from", method = RequestMethod.POST)
	public String saveFromAddress(@RequestParam(required = true, value = "fromName") String fromName,
			@RequestParam(required = true, value = "fromPhone") String fromPhone,
			@RequestParam(required = true, value = "fromAddress") String fromAddress, HttpServletRequest request) {
		logger.debug("saveFromAddress");
		String ret = "success";
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		if (customer != null) {
			FromAddress fa = new FromAddress();
			fa.setFromName(fromName);
			fa.setFromPhone(fromPhone);
			fa.setFromAddress(fromAddress);
			fa.setCustomer(customer);
			cartLogic.saveFromAddress(fa);
		} else {
			ret = "fail";
		}
		return ret;
	}

	/**
	 * 删除购物车产品
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/delete")
	public int deleteProductFromCart(@RequestParam(value = "id") int id, HttpServletRequest request) {
		logger.debug("deleteProductFromCart");

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);
		List<Cart> newList = cartList.stream().filter(c -> c.getProduct().getId() != id).collect(Collectors.toList());
		request.getSession().setAttribute(SESSION_CART, newList);

		return super.getCartNum(newList);
	}

	/**
	 * 调整产品数量
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/product/num")
	public int changeProductInCartNum(@RequestParam(value = "num") int num, @RequestParam(value = "id") int id,
			HttpServletRequest request) {
		logger.debug("changeProductInCartNum");

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);
		cartList.forEach(cart -> {
			if (cart.getProduct().getId() == id) {
				cart.setProductNum(num);
			}
		});
		request.getSession().setAttribute(SESSION_CART, cartList);

		return super.getCartNum(cartList);
	}

	/**
	 * 删除发货人地址
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/delete/from/{id}", method = RequestMethod.GET)
	public String deleteFromAddress(@PathVariable(value = "id") int id, HttpServletRequest request) {
		logger.debug("deleteFromAddress");
		String ret = "success";
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		if (customer != null) {
			FromAddress fa = new FromAddress();
			fa.setCustomer(customer);
			fa.setId(id);
			cartLogic.deleteFromAddress(fa);
		} else {
			ret = "fail";
		}
		return ret;
	}

	/**
	 * 保存收货人地址
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/save/to", method = RequestMethod.POST)
	public String saveToAddress(@RequestParam(required = true, value = "toName") String toName,
			@RequestParam(required = true, value = "toPhone") String toPhone,
			@RequestParam(required = true, value = "toAddress") String toAddress, HttpServletRequest request) {
		logger.debug("saveToAddress");
		String ret = "success";
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		if (customer != null) {
			ToAddress ta = new ToAddress();
			ta.setToName(toName);
			ta.setToPhone(toPhone);
			ta.setToAddress(toAddress);
			ta.setCustomer(customer);
			cartLogic.saveToAddress(ta);
		} else {
			ret = "fail";
		}
		return ret;
	}

	/**
	 * 删除收货人地址
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/delete/to/{id}", method = RequestMethod.GET)
	public String deleteToddress(@PathVariable(value = "id") int id, HttpServletRequest request) {
		logger.debug("deleteToddress");
		String ret = "success";
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		if (customer != null) {
			ToAddress ta = new ToAddress();
			ta.setCustomer(customer);
			ta.setId(id);
			cartLogic.deleteToAddress(ta);
		} else {
			ret = "fail";
		}
		return ret;
	}

	/**
	 * 获取latipay Md5 info getMd5Info
	 * 
	 * @return JSONObject
	 */
	@ResponseBody
	@RequestMapping(value = "/ajax/latipay/{id}/{currency}", method = RequestMethod.GET)
	public LatipayConfig latipay(@PathVariable(value = "id") int id, @PathVariable(value = "currency") String currency,
			HttpServletRequest request) {
		logger.debug("latipay");

		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		LatipayConfig latipayConfig = cartLogic.getLatiPayConfig(id, customer, currency);

		return latipayConfig;
	}

	/**
	 * 银联支付
	 * @param orderId
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/unionpay", method = RequestMethod.POST)
	public void forwordToUnionpay(@RequestParam(value = "orderId") int orderId, HttpServletRequest request,
			HttpServletResponse response) {

		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		if (customer != null) {
			Order order = orderLogic.getOrderById(orderId, customer);

			// 商户需要组装如下对象的数据
			String merId = "620055459475012";
			// 01 消费 02 预授权
			String transType = "01";
			// 原始系统交易跟踪号
			String origQid = "";
			// 商户类型
			String merCode = "5947";
			String ipAddr = new QuickPayUtils().getAddr(request);
			// 商户名称
			String merName = "ROYALDEER.CO.NZ";
			// 商品URL
			String commodityUrl = "";
			// 商品名称
			String commodityName = "";
			// 商户保留字段 size="50"
			String merReserved = "";
			// 交易超时时间
			String transTimeout = "300000";
			String acqCode = "";

			String commodityUnitPrice = "";
			String commodityQuantity = "";
			String commodityDiscount = "";
			String transferFee = "";
			// 支付类型 554 纽币
			String orderCurrency = "554";
			String orderAmount = new DecimalFormat("0").format((order.getTotalFreight()+order.getTotalProductPrice())*100);
//			String orderAmount = "1";

			String signType = QuickPayConf.signType;

			String html;
			String[] valueVo;

			if (QuickPayConf.isMerInterface) {
				valueVo = new String[] { QuickPayConf.version, // 协议版本
						QuickPayConf.charset, // 字符编码
						transType, // 交易类型
						origQid, // 原始交易流水号
						merId, // 商户代码
						merName, // 商户简称
						commodityUrl, // 商品URL
						commodityName, // 商品名称
						commodityUnitPrice, // 商品单价 单位：分
						commodityQuantity, // 商品数量
						commodityDiscount, // 折扣 单位：分
						transferFee, // 运费 单位：分
						new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + order.getId(), // 订单号（需要商户自己生成）
						orderAmount, // 交易金额 单位：分
						orderCurrency, // 交易币种
						new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()), // 交易时间
						ipAddr, // 用户IP
						customer.getPhone(), // 用户真实姓名
						"", // 默认支付方式
						"", // 默认银行编号
						transTimeout, // 交易超时时间
						QuickPayConf.merFrontEndUrl, // 前台回调商户URL
						QuickPayConf.merBackEndUrl, // 后台回调商户URL
						merReserved // 商户保留域
				};
				html = new QuickPayUtils().createPayHtml(QuickPayConf.merReqVo, valueVo, signType,
						QuickPayConf.gateWay);// 跳转到银联页面支付

			} else {
				valueVo = new String[] { QuickPayConf.version, // 协议版本
						QuickPayConf.charset, // 字符编码
						transType, // 交易类型
						origQid, // 原始交易流水号
						merId, // 商户代码
						merName, // 商户简称
						acqCode, // 收单机构代码（仅收单机构接入需要填写）
						merCode, // 商户类别（收单机构接入需要填写）
						commodityUrl, // 商品URL
						commodityName, // 商品名称
						commodityUnitPrice, // 商品单价 单位：分
						commodityQuantity, // 商品数量
						commodityDiscount, // 折扣 单位：分
						transferFee, // 运费 单位：分
						new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + order.getId(), // 订单号（需要商户自己生成）
						orderAmount, // 交易金额 单位：分
						orderCurrency, // 交易币种
						new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()), // 交易时间
						ipAddr, // "127.0.0.1",//用户IP
						"", // 用户真实姓名
						"", // 默认支付方式
						"", // 默认银行编号
						transTimeout, // 交易超时时间
						QuickPayConf.merFrontEndUrl, // 前台回调商户URL
						QuickPayConf.merBackEndUrl, // 后台回调商户URL
						merReserved // 商户保留域
				};

				html = new QuickPayUtils().createPayHtml(QuickPayConf.reqVo, valueVo, signType, QuickPayConf.gateWay);// 跳转到银联页面支付

			}

			response.setContentType("text/html;charset=" + QuickPayConf.charset);
			response.setCharacterEncoding(QuickPayConf.charset);
			try {
				response.getWriter().write(html);
			} catch (IOException e) {
				logger.debug(e);
			}
			response.setStatus(HttpServletResponse.SC_OK);
		}
	}

	/**
	 * 支付返回跳转
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/unionpay/ret")
	public ModelAndView forwordToUnionpayReturn(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("web/cart/pay_return");
		Customer customer = (Customer) request.getSession().getAttribute(SESSION_CUSTOMER);
		try {
			request.setCharacterEncoding(QuickPayConf.charset);
		} catch (UnsupportedEncodingException e) {
			
		}

		Map<String, String> map = new TreeMap<String, String>();

		String[] resArr = new String[QuickPayConf.notifyVo.length];
		for (int i = 0; i < QuickPayConf.notifyVo.length; i++) {
			resArr[i] = request.getParameter(QuickPayConf.notifyVo[i]);
			map.put(QuickPayConf.notifyVo[i], resArr[i]);
		}
		
		logger.info("支付信息" + resArr);
		String signature = request.getParameter(QuickPayConf.signature);
		String signMethod = request.getParameter(QuickPayConf.signMethod);
		Boolean signatureCheck = new QuickPayUtils().checkSign(QuickPayConf.notifyVo, resArr, signMethod, signature);

		//支付状态
		//支付成功更新订单
		String respMsg = "";
		if("00".equals(map.get("respCode")) && map.get("respMsg").equals("success") && signatureCheck){
			Integer orderId = Integer.valueOf(map.get("orderNumber").substring(14));
			//更新Order 变为已付款 status = 1;
			orderLogic.updateOrder(orderId,1);
			respMsg = map.get("respMsg");
			royalDeerMailLogic.paidMail(orderId, customer,map.get("orderNumber"));
		}else{
			respMsg = "fail";
		}
		// 获取菜单
		List<MenuView> menuList = indexLogic.getMenus();

		// 获取SESSION数据
		List<Cart> cartList = this.getAllProductFromSession(-1, 0, request);


		// 购物车产品数量
		modelAndView.addObject("productInCartNum", super.getCartNum(cartList));
		modelAndView.addObject("productInCartPrice", super.getCartPrice(cartList, customer));
		modelAndView.addObject("customer", customer);
		modelAndView.addObject("respMsg", respMsg);
		modelAndView.addObject("menuViewList", menuList);

		return modelAndView;
	}
	

}
