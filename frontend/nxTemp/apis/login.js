import http from '@/nxTemp/config/requestConfig'
import config from "@/nxTemp/config/index.config.js";

/**
 * 登录
 * @param uuid uuid
 * @param cipher 密文
 */
export function loginApi(uname, upw){
	return http.post(`${config.baseUrl}/user/login`, {userNameOrPhone: uname, password: upw});
};

/**
 * 登出
 * @param uuid uuid
 * @param cipher 密文
 */
export function logoutApi(token){
	return http.post(`${config.baseUrl}/api/logout`, { token: token });
};

// 获取公鑰
export function getPubKeyApi(uuid) {
	return http.get(`${config.baseUrl}/api/get-pub-key`, { uuid: uuid });
};

/**
 * 用户注册
 * @param data 注册信息，包含 phone, userName, password, inviteCode 等字段
 */
export function registerApi(data) {
	return http.post(`${config.baseUrl}/user/register`, data);
};

/**
 * 验证邀请码
 * @param inviteCode 邀请码
 */
export function checkInviteCodeApi(inviteCode) {
	return http.post(`${config.baseUrl}/user/checkInviteCode?inviteCode=${encodeURIComponent(inviteCode)}`, {});
};
