package com.easycart.controller.index;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = MockServletContext.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class IndexControllerTest {

	private MockMvc mockMvc;
	@Autowired
	private WebApplicationContext context;
	@Before
	public void setUp() throws Exception {
		//从上下文环境获取controller
//		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		//单独指定控制器
		this.mockMvc = MockMvcBuilders.standaloneSetup(context.getBean(IndexController.class)).build();
		
	}
	
	
	
	@Test
	public void testIndex() {
		fail("Not yet implemented");
	}

	@Test
	public void testAjaxProduct() {
		fail("Not yet implemented");
	}

	@Test
	public void testMenu1ProductList() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetProductsByBrandId() {
		fail("Not yet implemented");
	}

	@Test
	public void testProduct() {
		fail("Not yet implemented");
	}

}
