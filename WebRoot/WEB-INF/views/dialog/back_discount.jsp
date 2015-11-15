<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../common/jstl.jsp" %>

<html>
<head>
    <title></title>
    <script type="text/javascript">
        $("select").change(function () {
            var prev = $(this).prev();
            if (prev.is("a")) {
                prev.text($(this).find("option:selected").text());
            }
        });
        
       $(function(){
    	   $('#myForm').validator({
	           	isShowMsg : false,
	           	rules : {
	           		szzm : [/^[0-9a-zA-Z]+$/, '{0}只能是数字字母'],
	           		bankCard : [/^\d+[- ]?\d+$/, '{0}只能是数字、-号、空格']
	           	},fields : {
	           		brokerInfoId : {
	           			rule : '开户平台: required, length[~128]',
	           			target : '#t'
	           		},
	           		email : '邮箱: email, length[10~64], required',
	           		mt4Card : 'MT4账号: szzm, required, length[~128]',
	           		bankCard : '银行卡号: bankCard, required, length[~128]',
	           		bankName : '银行名称: chinese, required, length[~128]',
	           		name : '开户姓名: required, length[~128]'
	           	},
	           	valid : function(form){
	           		$(form).ajaxSubmit({
	           			url : '${ctx}/ajax/back_discount/save',
	           			type : 'post',
	           			success : function(result){
	           				if(result.success){
	           					jc.alert('提交申请成功', function(){
	           						window.location.reload();
	           					});
	           				}else{
	           					jc.alert(result.msg);
	           				}
	           			}
	           		});
	           	},
	           	invalid : function(form, errors){
	           		jc.alert(errors);
	           	}
           });
       });
       
       function myBackDiscountSubmit(){
    	   $('#myForm').submit();
       }
       
    </script>
</head>
<body>
    <div class="J_dialog J_dialogBuyIng">
        <div class="plrb20">
            <div class="d_title">
                <div class="t_txt">申请返佣</div>
                <div data-close="true" class="t_close"><a href="javascript:void(0);"><i class="icon">󰂳</i></a></div>
            </div>
			
            <div class="mt20 plr40">
                <div class="lh30"><i class="fz22 icon cRed">󰊼</i>请务必先通过本站开户，再提交返佣申请。提交申请后，我们将在1个工作日以内邮件形式通知结果。</div>
				<form action="" id="myForm">
                <div class="clearfix centerXLine">
                    <div style="width:300px;" class="fl">

                        <div class="J_miniTitle mt20">
                            <div class="m_token"></div>
                            <div class="m_txt">帐号信息</div>
                        </div>

                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>开户平台</div>
                            <div class="t_select w180">
                                <a href="javascript:;">请选择开户平台</a>
                                <select name="brokerInfoId">
                                    <option value="">请选择开户平台</option>
                                    <c:forEach items="${brokerInfos }" var="bi">
                                    	<option value="${bi.id }">${bi.cnName }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>


                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>开户邮箱</div>
                            <div class="t_text w180">
                                <label>
                                    <input placeholder="填写开户邮箱" type="text" name="email"/>
                                </label>
                            </div>
                        </div>


                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>MT4帐号</div>
                            <div class="t_text w180">
                                <label>
                                    <input placeholder="申请返佣帐号" type="text" name="mt4Card"/>
                                </label>
                            </div>
                        </div>

                    </div>
                    <div style="width:300px;" class="fr">
                        <div class="J_miniTitle mt20">
                            <div class="m_token"></div>
                            <div class="m_txt">返佣银行卡信息</div>
                        </div>
                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>银行卡号</div>
                            <div class="t_text w180">
                                <label>
                                    <input placeholder="返佣收款人储蓄卡号" type="text" name="bankCard"/>
                                </label>
                            </div>
                        </div>


                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>开户银行</div>
                            <div class="t_text w180">
                                <label>
                                    <input placeholder="储蓄卡所属银行" type="text" name="bankName"/>
                                </label>
                            </div>
                        </div>


                        <div class="J_toolsBar mt10">
                            <div class="t_label w80"><b class="cRed fz16">* </b>开户姓名</div>
                            <div class="t_text w180">
                                <label>
                                    <input placeholder="储蓄卡开户人姓名" type="text" name="name"/>
                                </label>
                            </div>
                        </div>

                    </div>
                </div>
				</form>
                <div class="d_btnGrounp mt20">
                    <a class="abtn orange" href="javascript:myBackDiscountSubmit();">提交申请</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
