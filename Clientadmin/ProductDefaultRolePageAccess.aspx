<%@ Page Language="C#" MasterPageFile="~/Master/LicenseMaster.master" AutoEventWireup="true"
    CodeFile="ProductDefaultRolePageAccess.aspx.cs" Inherits="UserRolePageAccess" Title="UserRole Page Access" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .open
        {
            display: block;
        }
        .closed
        {
            display: none;
        }
        .mGridcss
        {
            width: 100%;
            background-color: #fff;
            margin: 2px 0 2px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
            font-size: 13px !important;
        }
        .mGridcss a
        {
            font-size: 15px !important;
            color: White;
        }
        .mGridcss a:hover
        {
            font-size: 15px !important;
            color: White;
            text-decoration: underline;
        }
        .mGridcss td
        {
            padding: 0px;
            border: solid 1px #c1c1c1;
            color: #717171;
        }
        .mGridcss th
        {
            padding: 0px 0px;
            color: #fff;
            background-color: #416271;
            border-left: solid 1px #525252;
            font-size: 14px !important;
        }
        .mGridcss .alt
        {
            background: #fcfcfc url(grd_alt.png) repeat-x top;
        }
        .mGridcss .pgr
        {
            background-color: #416271;
        }
        .mGridcss .ftr
        {
            background-color: #416271;
            font-size: 15px !important;
            color: White;
            border: solid 1px #525252;
        }
        .mGridcss .pgr table
        {
            margin: 5px 0;
        }
        .mGridcss .pgr td
        {
            border-width: 0;
            padding: 0 2px;
            border-left: solid 1px #666;
            font-weight: bold;
            color: #fff;
            line-height: 12px;
        }
        .mGridcss .pgr a
        {
            color: Gray;
            text-decoration: none;
        }
        .mGridcss .pgr a:hover
        {
            color: #000;
            text-decoration: none;
        }
        .mGridcss input[type="checkbox"]
        {
            margin-top: 5px !important;
            width: 10px !important;
            float: left !important;
        }
        .btnSubmitn
        {
            width: 250px !important;
            font-size: 12px;
            height: 30px;
            float: left !important;
            text-align: left;
        }
        .btnSubmitn1
        {
            width: 150px !important;
            font-size: 12px;
            height: 30px;
            float: left !important;
            text-align: left;
        }
    </style>

    <script language="javascript" type="text/javascript">

      function SelectAllCheckboxes(spanChk) {

          // Added as ASPX uses SPAN for checkbox
          var oItem = spanChk.children;
          var theBox = (spanChk.type == "checkbox") ?
        spanChk : spanChk.children.item[0];
          xState = theBox.checked;
          elm = theBox.form.elements;

          for (i = 0; i < elm.length; i++)
              if (elm[i].type == "checkbox" &&
              elm[i].id != theBox.id) {
              //elm[i].click();
              if (elm[i].checked != xState)
                  elm[i].click();
              //elm[i].checked=xState;
          }
      }
      function SelectAllCheckboxes1(spanChk) {
          // Added as ASPX uses SPAN for checkbox
          var oItem = spanChk.children;
          var theBox = (spanChk.type == "checkbox") ?
        spanChk : spanChk.children.item[0];
          xState = theBox.checked;
          elm = theBox.form.elements;

          for (i = 0; i < elm.length; i++)
              if (elm[i].type == "checkbox" &&
              elm[i].id != theBox.id) {
              //elm[i].click();
              if (elm[i].checked != xState)
                  elm[i].click();
              //elm[i].checked=xState;
          }

         
      }
     
      }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-left: 1%">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div style="clear: both;">
            </div>
            <fieldset>
                <legend>
                    <asp:Label ID="Label3" runat="server" Text="Manage Website Page Access Rights For Roles / Designations"></asp:Label>
                </legend>
                <div style="clear: both;">
                </div>
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td colspan="2">
                            <label>
                            1 ) Select the product and websites whose page access rights are to be set for designations /roles
                            </label> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                           
                                        <label>                                           
                                            Select Product/Version 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProductname" ErrorMessage="*" InitialValue="0" ValidationGroup="1"></asp:RequiredFieldValidator>
                                            
                                            <asp:DropDownList ID="ddlProductname" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlProductname_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </label> 
                                        <label>
                                            Select Website
                                            <asp:DropDownList ID="DDLWebsiteC" runat="server" Width="200px" AutoPostBack="True" onselectedindexchanged="DDLWebsiteC_SelectedIndexChanged">
                                              </asp:DropDownList>
                                        </label>                                         
                                      
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                               <label> 2)	select th desginations or role for which you wish to set the page access rights						</label>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                              <label>
                                            Select designation
                                                <asp:DropDownList ID="ddlrolemode" runat="server" AutoPostBack="true"  Width="250px" OnSelectedIndexChanged="ddlrolemode_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </label> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label> 3)	Set rights</label>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="2">
                          <label style="width:100%"> 
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            
                                                      <asp:Label ID="lbl_CopyAccess" runat="server" Text="   Would you like to copy rights you already set for other designations/role to this role for which you are trying to create access rights?" Visible="false" ></asp:Label>
                              
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td><br />
                                             <asp:RadioButtonList ID="Rbtn_CopyAccess" runat="server" AutoPostBack="true" 
                                                 BackColor="White" RepeatDirection="Vertical" 
                                                 OnSelectedIndexChanged="Rbtn_CopyAccess_SelectedIndexChanged" Visible="false" 
                                                 CellSpacing="0" BorderStyle="None" CellPadding="0" EnableTheming="True">                                                                                                                     
                                                            <asp:ListItem Value="1" Text="Yes Copy from others designation/roles access rights"></asp:ListItem>                                                            
                                                             <asp:ListItem Value="0" Text=" No  I would like to set the rights by selecting pages"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                        </td>
                                        <td> 
                                               
                                                  <asp:DropDownList ID="DDLCopyFromDesignetion" runat="server" 
                                                    AutoPostBack="true"  Width="250px" 
                                                    OnSelectedIndexChanged="DDLCopyFromDesignetion_SelectedIndexChanged" 
                                                    Visible="false" Height="20px">
                                                         </asp:DropDownList>
                                                          <asp:Label ID="lbl_desig" runat="server" Text=" " Visible="false" ></asp:Label>
                                        </td>
                                    </tr>
                                </table> 
                            </label>                                         
                        
                          
                        </td>
                     </tr>
                            
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="pnldisp" runat="server" Visible="False">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="2">
                                          <asp:Panel ID="pnl_DisplayMode" runat="server" Visible="true">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <label>
                                                            Display Mode
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rdmode" runat="server" AutoPostBack="true" BackColor="White"
                                                            RepeatDirection="Horizontal" OnSelectedIndexChanged="rdDisplay_Mode_SelectedIndexChanged">
                                                           <%-- <asp:ListItem  Value="1" Text="Insert Mode"></asp:ListItem>--%>
                                                            <asp:ListItem Value="2" Text="Insert / Edit Mode" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Value="3" Text="View Mode" ></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                       
                                                    </td>
                                                </tr>
                                            </table>
                                              </asp:Panel>
                                        </td>
                                    </tr>
                                  
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="width: 100%;">
                                            <asp:Panel ID="pnl_PlushMinush" runat="server" Width="100%" Visible="false">
                                                <table width="100%;">
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Panel ID="pnlplus" runat="server" Width="100%">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <label>
                                                                                Set Access rights for full Menu
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                <asp:ImageButton ID="imgmainmanu" runat="server" ImageUrl="images/plus.png" AlternateText="Plush"  OnClick="imgmainmanu_Click" />
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                Set Access rights for full Sub Menu
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                <asp:ImageButton ID="imgsubm" runat="server" ImageUrl="images/plus.png" AlternateText="Plush" OnClick="imgsubm_Click" />
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                Set Access rights for Pagewise
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <label>
                                                                                <asp:ImageButton ID="imgpage" runat="server" ImageUrl="images/plus.png" AlternateText="Plush" OnClick="Img_PageAccessPlush_Click" />
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Panel ID="pnlmain" runat="server" Width="100%" Visible="False">
                                                                <table width="100%;">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>
                                                                                Set Access rights for full Menu
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:GridView ID="grdmain" runat="server" AutoGenerateColumns="False" GridLines="Both"
                                                                                CssClass="mGridcss" PagerStyle-CssClass="pgr" EmptyDataText="No Record Found."
                                                                                AlternatingRowStyle-CssClass="alt" DataKeyNames="MainMenuId" Width="100%" 
                                                                                AllowSorting="True" onsorting="grdmain_Sorting">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Menu Name"  SortExpression="MainMenuName" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblma" runat="server" Text='<%#Bind("MainMenuName") %>'></asp:Label>
                                                                                            <asp:Label ID="lblmainmanu" runat="server" Visible="false" Text='<%#Bind("MainMenuId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInw" runat="server" Text="Complete Menu Level Access Rights"></asp:Label>
                                                                                            <asp:RadioButtonList ID="rlheader" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rlheader_SelectedIndexChanged"
                                                                                                BackColor="White" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0" Text="None"></asp:ListItem>
                                                                                                <asp:ListItem Value="1" Text="Full"></asp:ListItem>
                                                                                                <asp:ListItem Value="2" Text="Limited"></asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" SelectedValue='<%#Bind("AccessRight") %>'
                                                                                                OnSelectedIndexChanged="RadioButtonListgrdmain_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0" Text="None"></asp:ListItem>
                                                                                                <asp:ListItem Value="1" Text="Full"></asp:ListItem>
                                                                                                <asp:ListItem Value="2" Text="Limited"></asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false" >
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblIn" runat="server" Text="Edit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkedit_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxEdit1" runat="server" Checked='<%#Bind("Edit_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDELETE" runat="server" Text="Delete"></asp:Label>
                                                                                            <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkdelete_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDelete1" runat="server" Checked='<%#Bind("Delete_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDownload" runat="server" Text="Download"></asp:Label>
                                                                                            <asp:CheckBox ID="chkDownload" runat="server" AutoPostBack="true" OnCheckedChanged="chkDownload_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDownload1" runat="server" Checked='<%#Bind("Download_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInsert" runat="server" Text="Insert"></asp:Label>
                                                                                            <asp:CheckBox ID="chkInsert" runat="server" AutoPostBack="true" OnCheckedChanged="chkInsert_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxInsert1" runat="server" Checked='<%#Bind("Insert_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblUpdate" runat="server" Text="Update"></asp:Label>
                                                                                            <asp:CheckBox ID="chkUpdate" runat="server" AutoPostBack="true" OnCheckedChanged="chkUpdate_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxUpdate1" runat="server" Checked='<%#Bind("Update_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblView" runat="server" Text="View"></asp:Label>
                                                                                            <asp:CheckBox ID="chkView" runat="server" AutoPostBack="true" OnCheckedChanged="chkView_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxView1" runat="server" Checked='<%#Bind("View_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblGo" runat="server" Text="Go/Submit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkGo" runat="server" AutoPostBack="true" OnCheckedChanged="chkGo_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxGo1" runat="server" Checked='<%#Bind("Go_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Send Mail"  HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblSendMail" runat="server" Text="Send Mail"></asp:Label>
                                                                                            <asp:CheckBox ID="chkSendMail" runat="server" AutoPostBack="true" OnCheckedChanged="chkSendMail_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxSendMail1" runat="server" Checked='<%#Bind("SendMail_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <PagerStyle CssClass="pgr" />
                                                                                <AlternatingRowStyle CssClass="alt" />
                                                                            </asp:GridView>
                                                                              <label>
                                <input id="hdnFileName" runat="server" name="hdnFileName" style="width: 1px" type="hidden" />
                                <input id="hdnsortExp" runat="Server" name="hdnsortExp" style="width: 1px" type="hidden" />
                                <input id="hdnsortDir" runat="Server" name="hdnsortDir" style="width: 1px" type="hidden" />
                            </label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="width: 100%;">
                                                            <asp:Panel ID="pnlsubmanu" runat="server" Width="100%" Visible="false">
                                                                <table width="100%;">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>
                                                                                Set Access rights for full Sub Menu
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>
                                                                                <asp:Label ID="Label4" runat="server" Text="Select Main Menu"></asp:Label>
                                                                            </label>
                                                                            <label>
                                                                                <asp:DropDownList ID="ddlmainfilter" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlmainfilter_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:GridView ID="GV_SubMenu" runat="server" AutoGenerateColumns="False" GridLines="Both"
                                                                                CssClass="mGridcss" PagerStyle-CssClass="pgr" EmptyDataText="No Record Found."
                                                                                AlternatingRowStyle-CssClass="alt" DataKeyNames="SubMenuId" Width="100%" 
                                                                                AllowSorting="True" onsorting="GV_SubMenu_Sorting">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Menu/Sub Menu Name" SortExpression="MainMenuName" 
                                                                                        HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblptypename" runat="server" Text='<%#Bind("MainMenuName") %>'></asp:Label>
                                                                                            <asp:Label ID="lblpid" runat="server" Visible="false" Text='<%#Bind("MainMenuId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Sub Menu Name" HeaderStyle-Width="20%" SortExpression="SubMenuName"
                                                                                        Visible="false" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblsubmanuname" runat="server" Text='<%#Bind("SubMenuName") %>'></asp:Label>
                                                                                            <asp:Label ID="lblsubmanuid" runat="server" Visible="false" Text='<%#Bind("SubMenuId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                     
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="300px">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInw" runat="server" Text="Complete Sub Menu Level Access Rights"></asp:Label>
                                                                                            <asp:RadioButtonList ID="rlheader" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rlheader_SelectedIndexChanged"
                                                                                                BackColor="White" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                                                <asp:ListItem Value="1">Full</asp:ListItem>
                                                                                                <asp:ListItem Value="2">Limited</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" SelectedValue='<%#Bind("AccessRight") %>'
                                                                                                OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                                                <asp:ListItem Value="1">Full</asp:ListItem>
                                                                                                <asp:ListItem Value="2" Selected="True">Limited</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" Width="300px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblIn" runat="server" Text="Edit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkedit_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxEdit1" runat="server" Checked='<%#Bind("Edit_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDELETE" runat="server" Text="Delete"></asp:Label>
                                                                                            <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkdelete_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDelete1" runat="server" Checked='<%#Bind("Delete_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDownload" runat="server" Text="Download"></asp:Label>
                                                                                            <asp:CheckBox ID="chkDownload" runat="server" AutoPostBack="true" OnCheckedChanged="chkDownload_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDownload1" runat="server" Checked='<%#Bind("Download_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInsert" runat="server" Text="Insert"></asp:Label>
                                                                                            <asp:CheckBox ID="chkInsert" runat="server" AutoPostBack="true" OnCheckedChanged="chkInsert_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxInsert1" runat="server" Checked='<%#Bind("Insert_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblUpdate" runat="server" Text="Update"></asp:Label>
                                                                                            <asp:CheckBox ID="chkUpdate" runat="server" AutoPostBack="true" OnCheckedChanged="chkUpdate_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxUpdate1" runat="server" Checked='<%#Bind("Update_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblView" runat="server" Text="View"></asp:Label>
                                                                                            <asp:CheckBox ID="chkView" runat="server" AutoPostBack="true" OnCheckedChanged="chkView_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxView1" runat="server" Checked='<%#Bind("View_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblGo" runat="server" Text="Go/Submit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkGo" runat="server" AutoPostBack="true" OnCheckedChanged="chkGo_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxGo1" runat="server" Checked='<%#Bind("Go_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Send Mail"  HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblSendMail" runat="server" Text="Send Mail"></asp:Label>
                                                                                            <asp:CheckBox ID="chkSendMail" runat="server" AutoPostBack="true" OnCheckedChanged="chkSendMail_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxSendMail1" runat="server" Checked='<%#Bind("SendMail_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <PagerStyle CssClass="pgr" />
                                                                                <AlternatingRowStyle CssClass="alt" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="width: 100%;">
                                                            <asp:Panel ID="pnlpage" runat="server" Width="100%" Visible="false">
                                                                <table width="100%;">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>
                                                                                Set Access rights for Pages
                                                                            </label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <label>
                                                                                <asp:Label ID="Label2" runat="server" Text="Select Menu Category"></asp:Label>
                                                                                 <asp:DropDownList ID="DDLCategoryS" runat="server" AutoPostBack="True"  Width="200px" OnSelectedIndexChanged="FilterCategory_SelectedIndexChanged" >
                                                                                      </asp:DropDownList>
                                                                            </label>                                                                            
                                                                            <label>
                                                                                <asp:Label ID="Label5" runat="server" Text="Select Main Menu"></asp:Label>
                                                                                <asp:DropDownList ID="ddlmailpagefilter" Width="200px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlmailpagefilter_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </label>
                                                                            
                                                                            <label>
                                                                                <asp:Label ID="Label6" runat="server" Text="Select Sub Menu"></asp:Label>
                                                                                    <asp:DropDownList ID="ddlsubpagefilter"  Width="200px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsubpagefilter_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </label>
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:GridView ID="GV_PageAccess" runat="server" AutoGenerateColumns="False" GridLines="Both"
                                                                                CssClass="mGridcss" PagerStyle-CssClass="pgr" EmptyDataText="No Record Found."
                                                                                HeaderStyle-HorizontalAlign="Left" AlternatingRowStyle-CssClass="alt" DataKeyNames="MainMenuId"
                                                                                Width="100%" onsorting="GV_PageAccess_Sorting" AllowSorting="True">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Menu/Sub Menu Name" SortExpression="MainMenuName"
                                                                                         HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblptypename" runat="server" Text='<%#Bind("MainMenuName") %>'></asp:Label>
                                                                                            <asp:Label ID="lblsubmanu" runat="server" Visible="false" Text='<%#Bind("MainMenuId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Sub Menu Name" SortExpression="SubMenuName" Visible="false"
                                                                                        HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblsubmanuname" runat="server" Text='<%#Bind("SubMenuName") %>'></asp:Label>
                                                                                            <asp:Label ID="lblsubmanuid" runat="server" Visible="false" Text='<%#Bind("SubMenuId") %>'></asp:Label>
                                                                                          
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Page Name / Page Title" SortExpression="PageName" 
                                                                                        HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblpagename" runat="server" Text='<%#Bind("PageName") %>'></asp:Label>
                                                                                             ( <asp:Label ID="lblptb" runat="server"  Text='<%#Bind("PageTitle") %>'></asp:Label>)
                                                                                            <asp:Label ID="lblpageid" runat="server" Visible="false" Text='<%#Bind("PageId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Width="270px" HeaderStyle-HorizontalAlign="Left" SortExpression="AccessRight">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInw" runat="server" Text="Selected Page Level Access Rights"></asp:Label>
                                                                                            <asp:RadioButtonList ID="rlheader" runat="server" AutoPostBack="true" BackColor="White"  OnSelectedIndexChanged="rlheader_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                                                <asp:ListItem Value="1">Full</asp:ListItem>
                                                                                                <asp:ListItem Value="2">Limited</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="true" SelectedValue='<%#Bind("AccessRight") %>' OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                                                                <asp:ListItem Value="1">Full</asp:ListItem>
                                                                                                <asp:ListItem Value="2" Selected="True">Limited</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" Width="270px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" SortExpression="Edit_Right" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblIn" runat="server" Text="Edit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkedit" runat="server" AutoPostBack="true" OnCheckedChanged="chkedit_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxEdit1" runat="server" Checked='<%#Bind("Edit_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDELETE" runat="server" Text="Delete"></asp:Label>
                                                                                            <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="true" OnCheckedChanged="chkdelete_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDelete1" runat="server" Checked='<%#Bind("Delete_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblDownload" runat="server" Text="Download"></asp:Label>
                                                                                            <asp:CheckBox ID="chkDownload" runat="server" AutoPostBack="true" OnCheckedChanged="chkDownload_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxDownload1" runat="server" Checked='<%#Bind("Download_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblInsert" runat="server" Text="Insert"></asp:Label>
                                                                                            <asp:CheckBox ID="chkInsert" runat="server" AutoPostBack="true" OnCheckedChanged="chkInsert_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxInsert1" runat="server" Checked='<%#Bind("Insert_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblUpdate" runat="server" Text="Update"></asp:Label>
                                                                                            <asp:CheckBox ID="chkUpdate" runat="server" AutoPostBack="true" OnCheckedChanged="chkUpdate_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxUpdate1" runat="server" Checked='<%#Bind("Update_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblView" runat="server" Text="View"></asp:Label>
                                                                                            <asp:CheckBox ID="chkView" runat="server" AutoPostBack="true" OnCheckedChanged="chkView_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxView1" runat="server" Checked='<%#Bind("View_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="30px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="65px" HeaderStyle-HorizontalAlign="Left" Visible="true">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblGo" runat="server" Text="Go/Submit"></asp:Label>
                                                                                            <asp:CheckBox ID="chkGo" runat="server" AutoPostBack="true" OnCheckedChanged="chkGo_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxGo1" runat="server" Checked='<%#Bind("Go_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="65px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ItemStyle-Width="75px" HeaderText="Send Mail" SortExpression="PageName"
                                                                                     Visible="true"   HeaderStyle-HorizontalAlign="Left">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="lblSendMail" runat="server" Text="Send Mail"></asp:Label>
                                                                                            <asp:CheckBox ID="chkSendMail" runat="server" AutoPostBack="true" OnCheckedChanged="chkSendMail_chachedChanged" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="CheckBoxSendMail1" runat="server" Checked='<%#Bind("SendMail_Right") %>' />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                        <ItemStyle Width="75px" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <PagerStyle CssClass="pgr" />
                                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                                <AlternatingRowStyle CssClass="alt" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <asp:Panel ID="pnl_btnsubmit" runat="server" Width="100%" Visible="false">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnsub" runat="server" Text="Submit" CssClass="btnSubmit" OnClick="btnsub_Click" />                                                                         
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>

                                     <tr>
                            <td>
                              
                               
                            </td>
                            </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>