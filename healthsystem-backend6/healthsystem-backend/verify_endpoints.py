import urllib.request
import urllib.parse
import json

BASE_URL = "http://localhost:8081"

def login():
    url = f"{BASE_URL}/user/login"
    data = json.dumps({
        "userNameOrPhone": "chf",
        "password": "123456"
    }).encode("utf-8")
    req = urllib.request.Request(
        url,
        data=data,
        headers={"Content-Type": "application/json;charset=UTF-8"},
        method="POST"
    )
    try:
        with urllib.request.urlopen(req) as res:
            headers = res.info()
            token = headers.get("Authorization")
            body = json.loads(res.read().decode("utf-8"))
            print(f"[Login Success] Token: {token[:20] if token else None}...")
            return token
    except Exception as e:
        print(f"[Login Failed] Error: {e}")
        return None

def test_api(token, path, method="GET", query_params=None, data_body=None):
    url = f"{BASE_URL}{path}"
    if query_params:
        url += "?" + urllib.parse.urlencode(query_params)
        
    req = urllib.request.Request(
        url,
        headers={"Authorization": token, "Content-Type": "application/json;charset=UTF-8"} if token else {"Content-Type": "application/json;charset=UTF-8"},
        method=method
    )
    if data_body:
        req.data = json.dumps(data_body).encode("utf-8")
        
    try:
        with urllib.request.urlopen(req) as res:
            status = res.status
            body = json.loads(res.read().decode("utf-8"))
            print(f"[API TEST] {method} {path} -> Status: {status}, Code: {body.get('code')}, Msg: {body.get('message')}")
            return body
    except Exception as e:
        print(f"[API TEST FAILED] {method} {path} -> Error: {e}")
        return None

def main():
    token = login()
    if not token:
        return
        
    print("\n--- 1. HTP房树人分析模块 ---")
    list_res = test_api(token, "/htp/list", query_params={"currentPage": 1, "pageSize": 5})
    test_api(token, "/htp/statistics/riskLevel")
    test_api(token, "/htp/statistics/scoreDistribution")
    
    if list_res and "result" in list_res and "data" in list_res["result"] and list_res["result"]["data"]:
        first_record = list_res["result"]["data"][0]
        record_id = first_record["id"]
        user_id = first_record["userId"]
        test_api(token, f"/htp/detail/{record_id}")
        test_api(token, f"/htp/trend/{user_id}")
        
    print("\n--- 2. 量表分析模块 ---")
    scale_types = ["PARS3", "IPAQ", "MAIA2", "CDRISC", "OCEAN", "PSQI", "SCL90"]
    test_api(token, "/scale/types")
    
    for scale in scale_types:
        print(f"\n--- Testing Scale: {scale} ---")
        scale_list = test_api(token, "/scale/list", query_params={"scaleType": scale, "currentPage": 1, "pageSize": 5})
        test_api(token, "/scale/statistics/riskLevel", query_params={"scaleType": scale})
        test_api(token, "/scale/statistics/scoreDistribution", query_params={"scaleType": scale})
        
        if scale_list and "result" in scale_list and "data" in scale_list["result"] and scale_list["result"]["data"]:
            first_record = scale_list["result"]["data"][0]
            record_id = first_record.get("id")
            user_id = first_record.get("userId") or first_record.get("user_id")
            if record_id is not None and user_id is not None:
                test_api(token, f"/scale/detail/{scale}/{record_id}")
                test_api(token, f"/scale/user/latest/{user_id}")
                test_api(token, f"/scale/trend/{scale}/{user_id}")
                test_api(token, f"/scale/analysis/comprehensive/{user_id}")

    print("\n--- 3. AI聊天分析模块 ---")
    chat_list = test_api(token, "/aiChatAnalysis/getSessionList", query_params={"currentPage": 1, "pageSize": 5})
    test_api(token, "/aiChatAnalysis/getEmotionStatistics")
    
    if chat_list and "result" in chat_list and "data" in chat_list["result"] and chat_list["result"]["data"]:
        first_session = chat_list["result"]["data"][0]
        session_id = first_session["id"]
        test_api(token, "/aiChatAnalysis/getSessionMessages", query_params={"sessionId": session_id})

    print("\n--- 4. 日记分析模块 ---")
    diary_list = test_api(token, "/diaryAnalysis/getDiaryList", query_params={"currentPage": 1, "pageSize": 5})
    test_api(token, "/diaryAnalysis/getMoodStatistics")

    print("\n--- 5. 健康报告模块 ---")
    report_list = test_api(token, "/healthReport/getHealthReportList", query_params={"currentPage": 1, "pageSize": 5})
    test_api(token, "/healthReport/getDepressionStatistics")
    
    if report_list and "result" in report_list and "data" in report_list["result"] and report_list["result"]["data"]:
        first_report = report_list["result"]["data"][0]
        user_id = first_report["user_id"]
        test_api(token, "/healthReport/getUserHealthDetail", query_params={"userId": user_id})

if __name__ == "__main__":
    main()
