import http from '@/nxTemp/config/requestConfig'
import config from "@/nxTemp/config/index.config.js";

/**
 * 测试
 */
export function testApi(){
	return http.get(`${config.baseUrl}/api/bsp/getList`, {});
};