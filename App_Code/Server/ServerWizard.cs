using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;

public class ServerWizard
{
    SqlConnection con = new SqlConnection();
    SqlConnection connCompserver = new SqlConnection();
    public ServerWizard()
	{
        con = MyCommonfile.licenseconn();		
	}
    public static Boolean Server_Active_Status(string ServerId)
    {
        Boolean status = true;      
        SqlConnection liceco = new SqlConnection();
        liceco = MyCommonfile.licenseconn();
        if (liceco.State.ToString() != "Open")
        {
            liceco.Open();
        }
        string str = " Select * From ServerMasterTbl Where dbo.ServerMasterTbl.Status='1' and  dbo.ServerMasterTbl.Id='1' ";
        SqlCommand cmd = new SqlCommand(str, liceco);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count == 0)
        {
            status = false;
        }
        liceco.Close();
        return status;
    }

    public static string ServerEncrDecriKEY(string Serverid)
    {
        string key = "";

        SqlConnection liceco = new SqlConnection();
        liceco = MyCommonfile.licenseconn();
        if (liceco.State.ToString() != "Open")
        {
            liceco.Open();
        }
        string str = " SELECT  * From dbo.ServerMasterTbl Where Id='" + Serverid + "' ";
        SqlCommand cmd = new SqlCommand(str, liceco);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        adp.Fill(ds);
        if (ds.Rows.Count > 0)
        {
            key = ds.Rows[0]["Enckey"].ToString();
        }
        liceco.Close();
        return key;
    }
    public static SqlConnection ServerDefaultInstanceConnetionTCP(string CompanyLoginId)
    {
        SqlConnection connCompserver = new SqlConnection();
        SqlConnection liceco = new SqlConnection();
        liceco = MyCommonfile.licenseconn();
        if (liceco.State.ToString() != "Open")
        {
            liceco.Open();
        }
        string str = " SELECT  TOP (1) dbo.PortalMasterTbl.Id AS portlID, dbo.PortalMasterTbl.PortalName, dbo.PricePlanMaster.VersionInfoMasterId,dbo.PricePlanMaster.Producthostclientserver, dbo.ClientMaster.ServerId AS ClientServerid, dbo.ServerMasterTbl.*, dbo.CompanyMaster.ServerId FROM dbo.CompanyMaster INNER JOIN dbo.PricePlanMaster ON dbo.PricePlanMaster.PricePlanId = dbo.CompanyMaster.PricePlanId INNER JOIN dbo.PortalMasterTbl ON dbo.PricePlanMaster.PortalMasterId1 = dbo.PortalMasterTbl.Id INNER JOIN dbo.VersionInfoMaster ON dbo.PricePlanMaster.VersionInfoMasterId = dbo.VersionInfoMaster.VersionInfoId INNER JOIN dbo.ProductMaster ON dbo.VersionInfoMaster.ProductId = dbo.ProductMaster.ProductId INNER JOIN dbo.ClientMaster ON dbo.ProductMaster.ClientMasterId = dbo.ClientMaster.ClientMasterId INNER JOIN dbo.ServerMasterTbl ON dbo.CompanyMaster.ServerId = dbo.ServerMasterTbl.Id  where CompanyLoginId='" + CompanyLoginId + "' ";
        SqlCommand cmd = new SqlCommand(str, liceco);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        adp.Fill(ds);
        if (ds.Rows.Count > 0)
        {
            //string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            //string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            //string sqlserverport = ds.Rows[0]["port"].ToString();
            //string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();
            //string Comp_serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());
            //string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            //string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();
            //string Comp_serversqlinstancename = ds.Rows[0]["DefaultsqlInstance"].ToString();
            //string Comp_serverweburl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();
            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport = ds.Rows[0]["port"].ToString();//30000 
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();//30000   

            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());

            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();//2810
            connCompserver.ConnectionString = @"Data Source =" + ds.Rows[0]["PublicIp"] + "\\" + ds.Rows[0]["SqlInstanceName"] + "; Initial Catalog = " + ds.Rows[0]["DefaultDatabaseName"] + "; User ID=Sa; password=" + PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString()) + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:192.168.6.101,1401; Initial Catalog = C3SATELLITESERVER; User ID=Sa; password=06De1963++; Persist Security Info=true;";
        }
        liceco.Close();
        return connCompserver;
    }
    public static SqlConnection ServerDefaultInstanceConnetionTCP_Serverid(string Serverid)
    {
        SqlConnection connCompserver = new SqlConnection();
        SqlConnection liceco = new SqlConnection();
        liceco = MyCommonfile.licenseconn();
        if (liceco.State.ToString() != "Open")
        {
            liceco.Open();
        }
        string str = " SELECT  * From dbo.ServerMasterTbl Where Id='" + Serverid + "' ";
        SqlCommand cmd = new SqlCommand(str, liceco);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        adp.Fill(ds);
        if (ds.Rows.Count > 0)
        {

            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();
            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport = ds.Rows[0]["port"].ToString();//30000 
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();//30000   

            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());

            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();//2810
            connCompserver.ConnectionString = @"Data Source =" + ds.Rows[0]["PublicIp"] + "\\" + ds.Rows[0]["SqlInstanceName"] + "; Initial Catalog = " + ds.Rows[0]["DefaultDatabaseName"] + "; User ID=Sa; password=" + PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString()) + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:192.168.6.101,1401; Initial Catalog = C3SATELLITESERVER; User ID=Sa; password=06De1963++; Persist Security Info=true;";
           
          
        }
        liceco.Close();
        return connCompserver;
    }

    public static SqlConnection ServerDefaultInstanceConnetionTCPWithPublicIP_Serverid(string Serverid)
    {
        SqlConnection connCompserver = new SqlConnection();
        SqlConnection liceco = new SqlConnection();
        liceco = MyCommonfile.licenseconn();
        if (liceco.State.ToString() != "Open")
        {
            liceco.Open();
        }
        string str = " SELECT  * From dbo.ServerMasterTbl Where Id='" + Serverid + "' ";
        SqlCommand cmd = new SqlCommand(str, liceco);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        adp.Fill(ds);
        if (ds.Rows.Count > 0)
        {

            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();
            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport = ds.Rows[0]["port"].ToString();//30000 
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();//30000   

            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());

            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();//2810
            connCompserver.ConnectionString = @"Data Source =" + ds.Rows[0]["PublicIp"] + "\\" + ds.Rows[0]["SqlInstanceName"] + "; Initial Catalog = " + ds.Rows[0]["DefaultDatabaseName"] + "; User ID=Sa; password=" + PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString()) + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["PublicIp"] + "," + sqlserverport + "; Initial Catalog = " + DefaultDatabaseName + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
            connCompserver.ConnectionString = @"Data Source =TCP:192.168.6.101,1401; Initial Catalog = C3SATELLITESERVER; User ID=Sa; password=06De1963++; Persist Security Info=true;";


        }
        liceco.Close();
        return connCompserver;
    }
    public static SqlConnection ServerDatabaseFromInstanceTCP(string Serverid, string serversqlinstancename,string databasename)
    {
        SqlConnection connCompserver = new SqlConnection();
        string str = "  ";
        DataTable ds = MyCommonfile.selectBZ(" Select * From ServerMasterTbl Where Id='" + Serverid + "'");
        if (ds.Rows.Count > 0)
        {
            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();

            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport = ds.Rows[0]["port"].ToString();//30000           
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();//30000           
            

            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());

            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();//2810
            if (serversqlinstancename == sqlinstancename)
            {
                connCompserver.ConnectionString = @"Data Source=" + ds.Rows[0]["PublicIp"].ToString() + "," + sqlserverport + ";Integrated Security=True";//Initial Catalog=" + serversqldbname + ";                       
                connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlCompport + "; Initial Catalog = " + databasename + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
             
            }
            else
            {
                connCompserver.ConnectionString = @"Data Source =" + ds.Rows[0]["PublicIp"].ToString() + "," + sqlCompport + "; Persist Security Info=true;";
                connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport + "; Initial Catalog = " + databasename + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
               
            }

            connCompserver.ConnectionString = @"Data Source =TCP:192.168.6.101,1401; Initial Catalog =" + databasename + "; User ID=Sa; password=06De1963++; Persist Security Info=true;";          
        }       
        return connCompserver;
    }

    public static SqlConnection ServerDatabaseFromInstancePipe(string Serverid, string serversqlinstancename, string databasename)
    {
        SqlConnection connCompserver = new SqlConnection();
        string str = "  ";
        DataTable ds = MyCommonfile.selectBZ(" Select * From ServerMasterTbl Where Id='" + Serverid + "'");
        if (ds.Rows.Count > 0)
        {
            string ServerName = ds.Rows[0]["ServerName"].ToString();
            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();

            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport30000 = ds.Rows[0]["port"].ToString();//30000           
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();//30000           


            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());

            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport2810 = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();//2810
            if (serversqlinstancename == sqlinstancename)
            {
                connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlCompport2810 + "; Initial Catalog = " + databasename + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
                connCompserver.ConnectionString = @""+ServerName+"\\"+sqlinstancename+";Initial Catalog="+databasename+";Integrated Security=True;";                                
            }
            else
            {
                connCompserver.ConnectionString = @"Data Source =TCP:" + ds.Rows[0]["Ipaddress"] + "," + sqlserverport30000 + "; Initial Catalog = " + databasename + "; User ID=Sa; password=" + serversqlpwd + "; Persist Security Info=true;";
                connCompserver.ConnectionString = @"" + ServerName + "\\" + DefaultsqlInstance + ";Initial Catalog=" + databasename + ";Integrated Security=True;";                
            }
        }
        
        return connCompserver;
    }
    public static SqlConnection ServerTwoInstanceTCPConncection(string Serverid, string serversqlinstancename)
    {
        SqlConnection connCompserver = new SqlConnection();        
        string str = "  ";
        DataTable ds = MyCommonfile.selectBZ(" Select * From ServerMasterTbl Where Id='" + Serverid + "'");        
        if (ds.Rows.Count > 0)
        {
            string ServerName = ds.Rows[0]["ServerName"].ToString();

            string Ipaddress = ds.Rows[0]["Ipaddress"].ToString();
            string lbl_serverurl = ds.Rows[0]["Busiwizsatellitesiteurl"].ToString();
            string sqlservernameip = ds.Rows[0]["PublicIp"].ToString();
            string Comp_serversqlserverip = ds.Rows[0]["sqlurl"].ToString();

            string DefaultsqlInstance = ds.Rows[0]["DefaultsqlInstance"].ToString();
            string sqlserverport = ds.Rows[0]["port"].ToString();
            string DefaultDatabaseName = ds.Rows[0]["DefaultDatabaseName"].ToString();           

            string serversqlpwd = PageMgmt.Decrypted(ds.Rows[0]["Sapassword"].ToString());           


            string sqlinstancename = ds.Rows[0]["Sqlinstancename"].ToString();
            string sqlCompport = ds.Rows[0]["PortforCompanymastersqlistance"].ToString();
            if (serversqlinstancename == sqlinstancename)
            {
                connCompserver.ConnectionString = @"Data Source=" + ds.Rows[0]["Ipaddress"].ToString() + "," +sqlCompport  + ";Integrated Security=True";//Initial Catalog=" + serversqldbname + ";                       
                connCompserver.ConnectionString = @"Data Source=" + ServerName + "\\" + serversqlinstancename + ";Integrated Security=True";                                
            }
            else
            {
                connCompserver.ConnectionString = @"Data Source =" + ds.Rows[0]["Ipaddress"].ToString() + "," + sqlserverport + "; Persist Security Info=true;";
                connCompserver.ConnectionString = @"Data Source=" + ServerName + "\\" + serversqlinstancename + ";Integrated Security=True";
                
            }
            connCompserver.ConnectionString = @"Data Source=TCP:192.168.6.101,1401;Initial Catalog=master;User ID=Sa; password=06De1963++; Persist Security Info=true;";
        }
        return connCompserver;
    }







    private static string Encrypt(string strtxt, string strtoencrypt)
    {
        byte[] bykey = new byte[20];
        byte[] dv = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        try
        {
            bykey = System.Text.Encoding.UTF8.GetBytes(strtoencrypt.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputArray = System.Text.Encoding.UTF8.GetBytes(strtxt);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(bykey, dv), CryptoStreamMode.Write);
            cs.Write(inputArray, 0, inputArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        catch (Exception ex)
        {
            return strtxt;
            //  throw ex;
        }

    }
    public static string Encrypted_key(string strText,string key)
    {

        return Encrypt(strText, key);

    }

    private static string Decrypt(string strText, string strEncrypt)
    {
        byte[] bKey = new byte[20];
        byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        try
        {
            bKey = System.Text.Encoding.UTF8.GetBytes(strEncrypt.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            Byte[] inputByteArray = inputByteArray = Convert.FromBase64String(strText);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(bKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.Encoding encoding = System.Text.Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }
        catch (Exception ex)
        {
            return strText;
            //throw ex;
        }
    }
    public static string Decrypted_key(string str, string key)
    {
        return Decrypt(str, key);
    }
}