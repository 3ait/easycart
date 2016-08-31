package com.easycart.controller.cart.logic;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.easycart.controller.web.cart.ToArea;
import com.easycart.controller.web.cart.logic.CartLogic;
import com.easycart.controller.web.index.ProductView;
import com.easycart.db.entity.Product;


/**
 * 
 * @author yaoliang
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = MockServletContext.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class CartLogicTest {
	
	
	CartLogic cartLogic;
	@Before
	public void setUp(){
		cartLogic = new CartLogic();
	}
	
	@Test
	public void testGetProductByIds() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetFromAddress() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetToAddress() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetProductTotalPrice() {
		List<ProductView> productViewList = new ArrayList<>();
		
		ProductView pv1 = new ProductView();
		pv1.setNum(1);
		Product p1 = new Product();
		p1.setPrice1(0.1D);
		p1.setWeight(0.1);
		pv1.setProduct(p1);
		productViewList.add(pv1);
		
		
		ProductView pv3 = new ProductView();
		pv3.setNum(3);
		Product p3 = new Product();
		p3.setPrice1(0.3D);
		p3.setWeight(0.3);
		pv3.setProduct(p3);
		productViewList.add(pv3);
		
		ProductView pv2 = new ProductView();
		pv2.setNum(2);
		Product p2 = new Product();
		p2.setPrice1(0.2D);
		p2.setWeight(0.2);
		pv2.setProduct(p2);
		productViewList.add(pv2);
		
		double discount = 1;
		
		
		
		Double[] ret = cartLogic.getProductTotalPrice(productViewList,discount,ToArea.china);
		assertTrue(ret[0]==1.4);
		assertTrue(ret[1]==1.4);
		
	}
	
	@Test
	public void testFormat(){
		System.out.println(new BigDecimal(1.2).setScale(0, RoundingMode.CEILING).doubleValue());
	}

}
