﻿<%@ Page Language="C#" MasterPageFile="~/temp.master" AutoEventWireup="true" CodeFile="VasOffroadCoo.aspx.cs" Inherits="VasOffroadCoo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>
                <asp:GridView ID="gvVasOffroad" runat="server" EmptyDataText="No Records Found"
                              AllowSorting="True" AutoGenerateColumns="False"
                              CssClass="gridviewStyle" CellSpacing="2"
                              CellPadding="4" ForeColor="#333333" GridLines="Both"
                              Width="630px" AllowPaging="True"
                              EnableSortingAndPagingCallbacks="True"
                              OnPageIndexChanging="gvVasOffroad_PageIndexChanging" OnRowCommand="gvVasOffroad_RowCommand">

                    <RowStyle CssClass="rowStyleGrid"/>
                    <Columns>
                        <asp:TemplateField HeaderText="Offroad ID">
                            <ItemTemplate>
                                <asp:Label ID="lblOffroadID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VehicleNo">
                            <ItemTemplate>
                                <asp:Label ID="lblVehicle_No" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Vechicleno") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistrict" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "District") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date of Off Road">
                            <ItemTemplate>
                                <asp:Label ID="lblDoOffRoad" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "downtime") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reason">
                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Reason") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimated Cost">
                            <ItemTemplate>
                                <asp:Label ID="lblEstimatedCost" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approved Cost">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="txtApprovedCost"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkApprove" runat="server" CommandName="Approve" CommandArgument=" <%# Container.DataItemIndex %>"
                                                Text="Approve">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reject">
                            <ItemTemplate>
                                <asp:LinkButton OnClientClick="PressButton()" ID="lnkReject" runat="server" CommandName="Reject" CommandArgument=" <%# Container.DataItemIndex %>"
                                                Text="Reject">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle CssClass="footerStylegrid"/>
                    <PagerStyle CssClass="pagerStylegrid"/>
                    <SelectedRowStyle CssClass="selectedRowStyle"/>
                    <HeaderStyle CssClass="headerStyle"/>
                </asp:GridView>
            </div>
            <div style="display: block; padding: 5px; width: 300px;" id="dvReason">
                <div style="background-color: Maroon; border-bottom: none;">
                    <asp:Label runat="server" Text="Reason for Rejection" Font-Bold="True"
                               Font-Size="Small" ForeColor="#FFFFCC"/>
                </div>
                <div style="background-color: White">
                    <div style="width: 100%">
                        <div style="float: left; width: 20%;">
                        </div>
                        <div style="float: right; width: 80%">
                            <asp:TextBox runat="server" ID="txtrejectReason" TextMode="MultiLine"/>
                        </div>
                    </div>
                    <div style="width: 100%">
                        <div style="float: left; width: 40%;">
                        </div>
                        <div style="float: right; width: 60%;">
                            <div style="float: left; width: 50%;">
                                <asp:Button runat="server" CssClass="form-submit-button" Text="Submit"
                                            OnClick="btnReason_Click" OnClientClick="return Validation();"/>
                            </div>
                            <div style="float: right; width: 50%;">
                                <asp:Button runat="server" ID="btnCancel" CssClass="form-reset-button" OnClientClick="PressButton2()" Text="Close"/>
                            </div>
                        </div>
                        <div>
                        </div>
                        <div style="display: none">
                            <asp:Button runat="server" ID="btnDoWork" Text="TEMP" OnClick="btnDoWork_Click"/>
                            <asp:Button runat="server" ID="btnPopUp"/>
                        </div>

                    </div>
                </div>
            </div>
            <asp:ModalPopupExtender ID="mpeReasonDetails" runat="server" BackgroundCssClass="modalBackground" DynamicServicePath=""
                                    Enabled="True" PopupControlID="dvReason" TargetControlID="btnPopUp" OkControlID="btnCancel" CancelControlID="btnCancel">
            </asp:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function PressButton() {
            document.getElementById('<%= btnPopUp.ClientID %>').click();
            return true;
        }

        function Reason() {
            var reason = document.getElementById('<%= txtrejectReason.ClientID %>');
            if (!RequiredValidation(reason, "Please provide reason for Rejection"))
                return false;


        }

        function PressButton2() {
            document.getElementById('<%= btnDoWork.ClientID %>').click();
            return true;
        }

        function Validation() {
            var reason = document.getElementById('<%= txtrejectReason.ClientID %>');

            if (!RequiredValidation(reason, "Please enter reason for rejection"))
                return false;
            return true;
        }

    </script>
</asp:Content>