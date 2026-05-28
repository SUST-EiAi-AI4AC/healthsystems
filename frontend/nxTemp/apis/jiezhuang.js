import http from '@/nxTemp/config/requestConfig'
import config from "@/nxTemp/config/index.config.js";

/**
 * 根据编码查询界桩信息
 */
export function getBspByCodeApi(code){
	return http.post(`${config.baseUrl}/api/bsp/getByCode`, {code:code});
};


/**
 * 根据编码查询界桩信息
 */
export function getDzjzByCodeApi(code){
	return http.post(`${config.baseUrl}/api/dzjz/getByCode`, {code:code});
};


/**
 * 根据编码查询界桩信息
 */
export function getScjzByCodeApi(code){
	return http.post(`${config.baseUrl}/api/scjz/getByCode`, {code:code});
};