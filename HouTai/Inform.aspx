<%@ Page Title="" Language="C#" MasterPageFile="~/HouTai/ManageMasterPage.master" AutoEventWireup="true" CodeFile="Inform.aspx.cs" Inherits="HouTai_Inform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="css/apps/inform.css" />
    <!--***** INFORM *****-->
    <div class="row" id="inform-cont">
        <div class="inform-box">
            <aside class="sm-side">
                <div class="inbox-body">
                    <a href="#myModal" data-toggle="modal" title="Compose" class="btn btn-compose">编写 </a>
                    <!-- Modal -->
                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                    <h4 class="modal-title">回馈</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" class="form-horizontal">
                                        <div class="row form-group">
                                            <label class="col-lg-2 control-label">收&nbsp;件&nbsp;人&nbsp;:</label>
                                            <div class="col-lg-10">
                                                <input type="text" placeholder="" id="inputEmail1" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-lg-2 control-label">主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题&nbsp;:</label>
                                            <div class="col-lg-10">
                                                <input type="text" placeholder="" id="inputPassword1" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-lg-2 control-label">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容&nbsp;:</label>
                                            <div class="col-lg-10">
                                                <textarea rows="10" cols="30" class="form-control" id="" name=""></textarea>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="offset-lg-2 col-lg-10">
                                                <span class="btn green fileinput-button">
                                                    <i class="fa fa-plus fa fa-white"></i>
                                                    <span>添加附件</span>
                                                    <input type="file" name="files[]" multiple="">
                                                </span>
                                                <button class="btn btn-send ml-3" type="submit">发送</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                </div>
                <ul class="inbox-nav inbox-divider">
                    <li class="active">
                        <a href="#"><i class="fa fa-inbox"></i>收件箱<span class="label label-danger pull-right">2</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-envelope-o"></i>发送反馈</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bookmark-o"></i>草稿箱</a>
                    </li>
                    <li>
                        <a href="#"><i class=" fa fa-external-link"></i>已发送<span class="label label-info pull-right">30</span></a>
                    </li>
                    <li>
                        <a href="#"><i class=" fa fa-trash-o"></i>垃圾站</a>
                    </li>
                </ul>
            </aside>
            <aside class="lg-side">
                <div class="inbox-body">
                    <div class="mail-option">
                        <div class="btn-group hidden-phone">
                            <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">
                                <input type="checkbox" class="mail-checkbox mail-group-checkbox">
                                全选
                            </a>
                        </div>
                        <div class="btn-group">
                            <a data-original-title="Refresh" data-placement="top" data-toggle="dropdown" href="#" class="btn mini tooltips">
                                <i class=" fa fa-refresh"></i>
                            </a>
                        </div>
                        <div class="btn-group hidden-phone">
                            <a data-toggle="dropdown" href="#" class="btn mini blue" aria-expanded="false">标记为
                                     <i class="fa fa-angle-down "></i>
                            </a>
                            <ul class="dropdown-menu drop-inbox">
                                <li><a href="#"><i class="fa fa-pencil"></i>标记为已读</a></li>
                                <li><a href="#"><i class="fa fa-ban"></i>标记为未读</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <a data-toggle="dropdown" href="#" class="btn mini blue">移动到
                                         <i class="fa fa-angle-down "></i>
                            </a>
                            <ul class="dropdown-menu drop-inbox">
                                <li><a href="#"><i class="fa fa-pencil"></i>草稿箱</a></li>
                                <li><a href="#"><i class="fa fa-ban"></i>垃圾站</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-trash-o"></i>彻底删除</a></li>
                            </ul>
                        </div>
                        <ul class="unstyled inbox-pagination">
                            <li><span>1/4页 共 303篇</span></li>
                            <li>
                                <a class="np-btn" href="#"><i class="fa fa-angle-left  pagination-left"></i></a>
                            </li>
                            <li>
                                <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a>
                            </li>
                        </ul>
                    </div>
                    <table class="table table-inbox table-hover">
                        <tbody>
                            <tr class="unread">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message  dont-show">admin</td>
                                <td class="view-message ">权哥好帅</td>
                                <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message  text-right">9:27 AM</td>
                            </tr>
                            <tr class="unread">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin3 </td>
                                <td class="view-message">管理员好</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 18</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin2</td>
                                <td class="view-message">给你点个赞 </td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 18</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin4</td>
                                <td class="view-message">广东工贸职业技术学院</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">April 01</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin7 <span class="label label-danger pull-right">urgent</span></td>
                                <td class="view-message">16软件3班 </td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">May 23</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin9 </td>
                                <td class="view-message">计算机与信息管理学院</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">March 14</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin8</td>
                                <td class="view-message">怎样，网站出现BUG啦！！！</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">Feb 19</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin1<span class="label label-success pull-right">megazine</span></td>
                                <td class="view-message view-message">好棒的网站，赞赞赞！！！</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 04</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin3</td>
                                <td class="view-message view-message">计算机与信息管理学院</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">June 13</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin6 <span class="label label-info pull-right">family</span></td>
                                <td class="view-message view-message">hello wrold</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 24</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin8</td>
                                <td class="view-message">管理员，什么时候有定位功能啊</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 09</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="dont-show">admin5</td>
                                <td class="view-message">给你点个赞</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">May 14</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin7</td>
                                <td class="view-message">期待历史纪录功能！！！ </td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">February 25</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="dont-show">admin3</td>
                                <td class="view-message view-message">广东工贸职业技术学院</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">March 14</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin1</td>
                                <td class="view-message">16软件3班</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">April 07</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin4</td>
                                <td class="view-message">聊天室能自己组建群就好了</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">August 10</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin7</td>
                                <td class="view-message view-message">每次改头像都要自己裁剪，好烦啊！！！</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">April 14</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin9</td>
                                <td class="view-message">什么时候出移动端的</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">June 16</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox">
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                                <td class="view-message dont-show">admin1</td>
                                <td class="view-message">期待视频课程能2倍数播放</td>
                                <td class="view-message inbox-small-cells"></td>
                                <td class="view-message text-right">August 10</td>
                            </tr>
                            <tr class="">
                                <td class="inbox-small-cells">
                                    <input type="checkbox" class="mail-checkbox" />
                                </td>
                                <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                <td class="view-message dont-show">admin5</td>
                                <td class="view-message view-message">我想自己改网站风格，能自定义就好了</td>
                                <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                <td class="view-message text-right">feb 14</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </aside>
        </div>
    </div>
</asp:Content>

