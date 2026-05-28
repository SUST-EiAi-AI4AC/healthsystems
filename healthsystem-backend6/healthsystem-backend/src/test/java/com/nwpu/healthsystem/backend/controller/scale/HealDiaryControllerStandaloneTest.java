package com.nwpu.healthsystem.backend.controller.scale;

import com.nwpu.healthsystem.backend.service.scale.HealDiaryService;
import com.nwpu.healthsystem.backend.utils.Response;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Collections;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

class HealDiaryControllerStandaloneTest {
    private MockMvc mockMvc;
    private HealDiaryService service;

    @BeforeEach
    void setup() {
        service = Mockito.mock(HealDiaryService.class);
        HealDiaryController controller = new HealDiaryController();
        try {
            java.lang.reflect.Field f = HealDiaryController.class.getDeclaredField("healDiaryService");
            f.setAccessible(true);
            f.set(controller, service);
        } catch (Exception ignored) {}
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    void testListEndpointExists() throws Exception {
        Mockito.when(service.listDiaries()).thenReturn(Response.success(Collections.emptyList()));
        mockMvc.perform(get("/heal-diary/list"))
                .andExpect(status().isOk());
    }

    @Test
    void testSaveEndpointExists() throws Exception {
        Mockito.when(service.saveDiary(Mockito.anyMap())).thenReturn(Response.success("ok", 1L));
        mockMvc.perform(post("/heal-diary/save")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"content\":\"x\",\"moodScore\":5}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.code").value(200));
    }
}
