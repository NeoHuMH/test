using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using QBox;
using QBox.Auth;
using QBox.RS;
using QBox.FileOp;
using QBox.RPC;
using System.ComponentModel;
using System.Text;
namespace qiniuDemo.Service
{
    /// <summary>
    /// service 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class Service : IHttpHandler
    {
        private HttpContext context;
        public void ProcessRequest(HttpContext httpContext)
        {
            context = httpContext;
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";
            string response = "";
            string strMethod = (string)context.Request["Method"];
            switch (strMethod)
            { 
                case "UpLoadFile":
                    response = UpLoadFile();
                    break;
            }
            context.Response.Clear();
            context.Response.Write(response);
            context.Response.End();
        }
        public string UpLoadFile()
        {
            #region params
            string bucketName = string.Empty;
            string key = string.Empty;
            string localFile = string.Empty;
            string bigkey = string.Empty;
            string bigFile = string.Empty;
            string DOMAINName = string.Empty;
            Client conn;
            RSService rs;
            #endregion params

            if (context.Request["key"] == null)
            {
                string jback= "({\"errorMessage\":\"参数不正确\"})";
                return jback;
            }
            else
            { key = context.Request["key"]; }

            //key改后缀
            if (key.IndexOf('.') > 0)
            {
                //int a = key.IndexOf('.');
                //string b = key.Substring(a);
                //key.Replace
                key = key.Replace(key.Substring(key.IndexOf('.')), ".mp4");
            }
            //万一能取到全地址
            if (key.IndexOf('\\') > 0)
            {
                key = key.Substring(key.LastIndexOf('\\'));
            }
            //公有秘钥
            Config.ACCESS_KEY = "b4Tb1AzHnH0xHLqAeLBMg9MGAw2IBaDgqo47zuUu";
            //私有秘钥
            Config.SECRET_KEY = "ZVD00fr92pv-0-o8dTk2N7lxxs1g0s54SYCsbhEi";
            bucketName = "sean1194";
            //放置的域名
            DOMAINName = bucketName + ".qiniudn.com";

            //获得签名认证
            conn = new DigestAuthClient();
            // 签名认证完成后，即可使用该认证来新建资源表
            rs = new RSService(conn, bucketName);
            //这句话最好在上传下载之前执行一遍,恐drop了之后会更改
            CallRet callRet = rs.MkBucket();

            string entryUrl = QBox.Util.Base64UrlSafe.Encode(bucketName + ":" + key);
            var authPolicy = new AuthPolicy(bucketName, 3600);
            string a = authPolicy.ReturnBody;
            string upToken = authPolicy.MakeAuthTokenString();
            string ret = "{"
                    + "\"bucketName\":\""
                    + bucketName
                    + "\",\"key\":\""
                    + key
                    + "\",\"DOMAINName\":\""
                    + DOMAINName
                    + "\",\"upToken\":\""
                    + upToken
                    + "\",\"entryUrl\":\""
                    + entryUrl
                    + "\"}";
            return ret;

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}