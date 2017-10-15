package spittr.web;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.servlet.view.InternalResourceView;

import spittr.Spittle;
import spittr.data.SpittleRepository;

import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

public class HomeControllerTest {
	@Test
	public void testHomePage() throws Exception{
		HomeController controller = new HomeController();
		MockMvc mockMvc = standaloneSetup(controller).build();
		mockMvc.perform(get("/")).andExpect(view().name("home"));
		//assertEquals("home",controller.home());
	}
	@Test
	public void shouldShowRecentSpittles() throws Exception{
		List<Spittle> expectedSpittles = createSpittleList(20);
		SpittleRepository mockRepository =Mockito.mock(SpittleRepository.class);
		Mockito.when(mockRepository.findSpittles(Long.MAX_VALUE, 20))
			   .thenReturn(expectedSpittles);
		SpittleController controller = new SpittleController(mockRepository);
		MockMvc mockMvc = standaloneSetup(controller)
						  .setSingleView(new InternalResourceView("/WEB-INF/views/spittles.jsp"))
						  .build();
		mockMvc.perform(get("/spittles"))
				.andExpect(view().name("spittles"))
				.andExpect(model().attributeExists("spittleList"));
	}
	@Test
	public void testSpittle() throws Exception{
		Spittle expectedSpittle = new Spittle("Hello", new Date());
		SpittleRepository mockRepository = Mockito.mock(SpittleRepository.class);
		Mockito.when(mockRepository.findOne(12345L)).thenReturn(expectedSpittle);
		
		SpittleController controller = new SpittleController(mockRepository);
		MockMvc mockMvc = standaloneSetup(controller).build();
		mockMvc.perform(get("/spittles/12345"))
		.andExpect(view().name("spittle"))
		.andExpect(model().attributeExists("spittle"))
		.andExpect(model().attribute("spittle", expectedSpittle));
	}
	
	private List<Spittle> createSpittleList(int count){
		List<Spittle> spittles = new ArrayList<>();
		for(int i = 0; i < count; i++) {
			spittles.add(new Spittle("Spittles "+i, new Date()));
		}
		return spittles;
	}
}
