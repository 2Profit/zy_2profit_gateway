<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@ include file="../common/common.jsp"%>

</head>

<%@ include file="../common/nice-validator.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#myForm').validator({
			fields : {
				accountNum : {
					rule : 'required',
					target : '#accountNum'
				},
				amount : {
					rule : 'required;integer[+]',
					target : '#amount'
				},
				payType : {
					rule : 'checked',
					target : '#payType'
				},
				msg : {
					rule : 'length[~512, true]',
					target : '#msg'
				}
			},
			valid : function(form){
				form.submit();
			}
		});
	});

	function mySubmit() {
		$('#myForm').submit();
	}
</script>

<body>

	<%@ include file="../common/head.jsp"%>

	<div class="J_wrap">

		<%@ include file="../common/time.jsp"%>

		<div class="J_content mt20 bgfff bg1 hasShadow">
			<%@ include file="../common/menu.jsp"%>

			<div class="fr c_1000">

				<div class="J_title less">
					<div class="t_txt">在线充值</div>
					<div class="t_tips"></div>
					<div class="t_more"></div>
				</div>
				<div class="plrb20">

					<form action="${ctx }/fund/pay/submit" id="myForm" method="post">
					<div class="J_form hasLine J_reg">
						<table style="width: 100%">
							<tbody>
								<tr>
									<td style="width: 20%;" class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">帐号：</div>
										</div>
									</td>
									<td style="width: 40%;">
										<div class="J_toolsBar">
											<div class="t_select">
                                                <a href="javascript:;">4008111</a>
                                                <select name="accountNum">
                                                    <option value="4008111">4008111</option>
                                                </select>
                                            </div>
											<%-- <div class="t_label cOrange">${loginUser.mobile }</div> --%>
										</div>
									</td>
									<td class="plr20" id="accountNum" style="width: 40%;">
									</td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">存款币种：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_label">
												CNY<input type="hidden" name="curType" value="CNY"/>
											</div>
										</div>
									</td>
									<td class="plr20">
									</td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">
												<span class="fz16 cDeepRed">* </span>存款金额：
											</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_text">
												<label> 
													<input type="text" name="amount" value="" style="width: 100px;">
												</label>
											</div>
										</div>
									</td>
									<td class="plr20" id="amount"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">
												<span class="fz16 cDeepRed">* </span>支付方式：
											</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_check">
                                                <label>
                                                    <input type="radio" name="payType" value="0" checked="checked">支付宝
                                                </label>
                                            </div>
                                            <!-- <div class="ml10 t_check">
                                                <label>
                                                	<input type="radio" name="payType" value="1">微信
                                                </label>
                                            </div> -->
										</div>
									</td>
									<td class="plr20" id="payType"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">姓名：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_label">${loginUser.cnName }</div>
										</div>
									</td>
									<td class="plr20"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">地址：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_label">${loginUser.address }</div>
										</div>
									</td>
									<td class="plr20"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">手机号码：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_label">${loginUser.mobile }</div>
										</div>
									</td>
									<td class="plr20"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">电邮地址：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_label">${loginUser.email }</div>
										</div>
									</td>
									<td class="plr20"></td>
								</tr>
								<tr>
									<td class="tar">
										<div class="J_toolsBar">
											<div class="t_label plr20 fr">备注：</div>
										</div>
									</td>
									<td>
										<div class="J_toolsBar">
											<div class="t_text">
												<label> 
													<input type="text" name="msg">
												</label>
											</div>
										</div>
									</td>
									<td class="plr20" id="msg"></td>
								</tr>
							</tbody>
						</table>
					</div>
					</form>
					
					<div class="J_btnGroup md mt20">
						<a class="abtn orange" href="javascript:mySubmit();">确认支付</a>
					</div>

					<div class="J_miniTitle">
						<div class="m_token"></div>
						<div class="m_txt">注意事项</div>
					</div>

					<div class="lh30">
						<table>
							<tbody>
								<tr>
									<td class="tar">1、</td>
									<td class="c54">本公司提供3家银行的授权帐户(中国工商银行、招商银行及中国建设银行)以方便阁下付款。建议阁下使用此3家银行的帐户进行转帐，以达致即时到账</td>
								</tr>
								<tr>
									<td class="tar">2、</td>
									<td class="c54">建議閣下於銀行辦公時間內進行轉帳，以加快轉帳速度及可選用快速轉帳等功能。有關銀行辦公時間詳情請聯絡相關銀行以作瞭解</td>
								</tr>
								<tr>
									<td class="tar">3、</td>
									<td class="c54">請閣下於網上轉帳成功後到交易平臺查收款項。同時請閣下保留轉帳成功頁面截圖，以方便隨時聯絡24小時線上客服查詢款項到賬情況。</td>
								</tr>
								<tr>
									<td class="tar">4、</td>
									<td class="c54">為保證轉帳過程暢通無阻，請閣下於轉帳前確認已插入U盾並已安裝網銀安全控制項，同時請於轉帳時輸入已確認的存款金額。有關網銀安全控制項安裝詳情請聯絡相關銀行以作瞭解</td>
								</tr>
								<tr>
									<td class="tar">5、</td>
									<td class="c54">本公司並不接受來自第三者的存款</td>
								</tr>
								<tr>
									<td class="tar">6、</td>
									<td class="c54">如閣下需要作大額轉帳，請留意網銀轉帳上限已作提升</td>
								</tr>
								<tr>
									<td class="tar">7、</td>
									<td class="c54">請必須於開戶後十四天內提交證明檔及存取款銀行資料確認通知書，以確保閣下所屬之交易帳戶的資金受到合法、安全的監管。</td>
								</tr>
								<tr>
									<td class="tar">8、</td>
									<td class="c54">本人確認為帳戶持有人及為該資金的最終實益擁有人，並確認存入資金與任何非法活動無關。</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>

			</div>
		</div>
	</div>


	<%@ include file="../common/help.jsp"%>
	<%@ include file="../common/foot.jsp"%>

</body>
</html>
