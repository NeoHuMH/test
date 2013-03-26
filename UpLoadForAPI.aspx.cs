using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace qiniuDemo
{
    public partial class UpLoadForAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InitialiseParams()
        { 
           ////公有秘钥
           // string strAkey = "b4Tb1AzHnH0xHLqAeLBMg9MGAw2IBaDgqo47zuUu";
           // //私有秘钥
           // string strSkey = "ZVD00fr92pv-0-o8dTk2N7lxxs1g0s54SYCsbhEi";
           // //url
           // string url = "http://iovip.qbox.me/put-auth/";
           // //param
           // string param = array('a' => 'test');
           // List<

        }

        protected void generate_access_token(string access_key, string secret_key, string url, string param)
        { 
               //string uri = URI.parse(url);
               // access = uri.path
               // query_string = uri.query
               // access += '?' + query_string if !query_string.nil? && !query_string.empty?
               // access += "\n";
               // if params.is_a?(Hash)
               //     total_param = params.map { |key, value| %Q(#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s).gsub('+', '%20')}) }
               //     access += total_param.join("&")
               // end
               // hmac = HMAC::SHA1.new(secret_key)
               // hmac.update(access)
               // encoded_digest = urlsafe_base64_encode(hmac.digest)
               // %Q(#{access_key}:#{encoded_digest})
        }
    
    }
}