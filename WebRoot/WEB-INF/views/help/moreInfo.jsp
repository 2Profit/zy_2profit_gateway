<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="../common/common.jsp"%>

    <script type="text/javascript">

        /*第一种形式 第二种形式 更换显示样式*/
        function setTab(name, cursel, n) {
            for (var i = 1; i <= n; i++) {
                var menu = document.getElementById(name + i);
                var con = document.getElementById("con_" + name + "_" + i);
                menu.className = i == cursel ? "t_item active" : "t_item";
                con.style.display = i == cursel ? "block" : "none";
            }
        }
        
        $(function(){
        	var indexId = parseInt('${tabId}');
        	setTab('one',indexId,4);
        })
        
        
    </script>
</head>
<body>

	<%@ include file="../common/head.jsp" %>

    <div data-ui="indexMask" class="J_indexMask mini"></div>

    <div>
        <div class="J_content bgfff">

            <div class="J_aboutMe">
                <div class="a_tab">
                    <div class="t_title">
                        <div id="one1" onclick="setTab('one',1,4)" class="t_item active"><a href="javascript:;">隐私政策</a></div>
                        <div id="one2" onclick="setTab('one',2,4)" class="t_item"><a href="javascript:;">免责条款</a></div>
                        <div id="one3" onclick="setTab('one',3,4)" class="t_item"><a href="javascript:;">社区守则</a></div>
                        <div id="one4" onclick="setTab('one',4,4)" class="t_item"><a href="javascript:;">常见问题</a></div>
                    </div>

                    <div class="t_main">
                        <div id="con_one_1" style="display: block;" class="m_item">

                            <div class="a_textArea">

                                <h3>概述</h3>
                                <p>
                                    隐私政策由XXXX“本公司”与在网站www.2profit.hk(“合作方”)上的已注册登记并已明确接受此等条款和条件的个人或公司共同签署。
本公司忠诚地为用户所提供的个人资料，作出保密的监控。除了得到法例批淮，本公司绝对不会把任何非公开性的资料给予任何个别人士。
                                </p>


                                <h3>有关用户个人信息的收集</h3>
                                <p>原则上，您无需告诉我们您的任何个人信息(例如您的姓名、身份信息、地址、电话号码或电子邮箱地址等)，除非您自愿向我们提供这些信息(例如通过邮件形式或者在填写报名表或联系表时提供)。当您在注册至盈网账户，订阅简讯服务或者希望使用我们网站提供的附加服务时，我们会要求您提供相关个人信息。除非另有说明，在符合相关法律法规的前提下或者遵照该隐私政策所规定，我们会利用收集到的信息来提供、维护、保护和改进网站及服务以为您带来更好的用户体验。当您在注册至盈网账户、订阅简讯服务或者希望使用我们网站提供的附加服务时，我们会收集</p>


                                <h3>有关用户信息的使用和传输</h3>
                                <p>我们只会将您提供给我们的信息用于本网站的合法商业目的。我们不向任何第三方提供您的信息。在特殊情况下，本公司有法律义务向第三方提供您的信息，例如，为了配合政府监督部门和执法机构，履行法庭命令或法庭请求，本公司会提供相关信息作为证据或证明以维护本公司的权利和财产。</p>

                                <h3>有关Cookies</h3>
                                <p>Cookies是在用户硬碟上的一个追踪设备，能追踪及储存客户使用网上服务的有关资料。本公司可能会在客户的电脑设定上存取本公司的Cookies，以协助本公司了解哪些广告和推销吸引客户浏览本公司的网站。本公司及其分支部门可能会于相关的产品和服务使用Cookies来追踪客户在本公司网站的浏览，收集得来和共用的资料是不具姓名及无法被个別辨识的。</p>

                                <h3>免费服务免责</h3>
                                <p>本网站向用户免费提供和赠送的，或提供有偿网络服务时附赠的各种产品和服务，因产品或者服务的瑕疵引起的任何损失，本网站不承担任何法律责任。</p>

                                <h3>有关安全技术</h3>
                                <p>用户参加本网站策划举办的活动时获得的奖品，如出现任何质量问题，由奖品生产者承担产品质量责任。在寄送奖品的过程中，奖品毁损、灭失，由物流运输企业承担损害赔偿责任。上述情形，本网站不承担连带责任。</p>

                                <h3>维护免责</h3>
                                <p>本公司将尽力保护客户所提供的资料。并将不断提高保密技术来保障客户的资料于传送往本公司途中免受他人拦截及盜取。本公司致力确保网站是安全及符合业界标准，并且使用其他资料保障工具，例如：防火墙、认证系統和操控机制来控制未获授权的系統进入和存取资料。</p>

                            </div>

                        </div>
                        <div id="con_one_2" class="m_item">

                            <div class="a_textArea">

                                <h3>内容免责</h3>
                                <p>至盈网用户（含注册用户和网站访客）在站内发布的內容等仅代表其个人观点，网站发布的财经信息内容仅供参考，以上内容仅限于用户间的交流、学习讨论、经验分享，不具有任何形式的投资咨询信息性质，不构成对任何金融产品的购买邀请，不构成财务、税务、投资建议、投资咨询意见或其他意见，不应成为其他用户做出任何投资或其他决定的唯一依据。用户因参考本网站内容造成损失的，本网站不承担任何法律责任。</p>

                                <h3>版权免责</h3>
                                <p>用户保证发表、上传或以任何方式上载到本网站的作品，应是其独立创作，不抄袭他人作品，不侵害他人的著作权，不存在任何版权纠纷，没有违反著作权法、出版法及其它有关法律法规的规定，并且作品不含有法律法规禁止的内容。如出现知识产权纠纷或其他纠纷，由用户自行承担相应法律责任，本网站不承担任何责任。</p>

                                <h3>账户丢失、泄露免责</h3>
                                <p>用户自行承担注册账号及密码的保管责任，并就其账号及密码项下之一切活动负全部责任。用户应注意网络安全防护，定期更改密码、设置密码安全保护问题，防止账号密码泄露，保证个人信息安全。因用户账户丢失或泄露给用户造成的损失，本网站不承担任何责任。</p>


                                <h3>链接免责</h3>
                                <p>本网站对用户通过本网站与其它网站的链接获得的一切信息资料的真实性、准确性、完整性不承担任何责任。因相关链接内容不在本网站控制范围内，本网站对用户利用其他网站信息资料后遭受的任何损失不承担任何赔偿责任。</p>


                                <h3>免费服务免责</h3>
                                <p>本网站向用户免费提供和赠送的，或提供有偿网络服务时附赠的各种产品和服务，因产品或者服务的瑕疵引起的任何损失，本网站不承担任何法律责任。</p>


                                <h3>奖品免责</h3>
                                <p>用户参加本网站策划举办的活动时获得的奖品，如出现任何质量问题，由奖品生产者承担产品质量责任。在寄送奖品的过程中，奖品毁损、灭失，由物流运输企业承担损害赔偿责任。上述情形，本网站不承担连带责任。</p>


                                <h3>维护免责</h3>
                                <p>本网站需要定期或不定期地对网站进行停机维护，因此类情况而造成的正常服务中断，请用户予以理解。本网站行使修改或中断网络服务的权利，不需对用户或第三方负责。</p>


                                <h3>技术故障免责</h3>
                                <p>因下列情形导致网络服务中断、终止，本网站不承担法律责任：</p>
                                <p>（1）因互联网接入单位、网站平台支持单位、短信发送商、移动运营商等电信单位的线路故障、通讯故障等造成的信息传递异常；</p>
                                <p>（2）因地震、台风、战争、罢工、瘟疫、爆发性和流行性传染病或其他重大疫情、火灾造成的及其他各方不能预见并且对其发生后果不能避免的	     不可抗力造成的网络服务异常；</p>
                                <p>（3）因黑客攻击、网络病毒、政府管制出现的网络服务异常。</p>


                                <h3>用户言论及行为</h3>
                                <p>用户不得利用至盈网提供的网络服务上传、展示或传播任何虚假的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；不得在至盈网散布传播虚假不实、误导性消息；不得发表诋毁、诽谤至盈网及至盈网合作伙伴的言论；不得利用至盈网平台制作、上传、发布、传播、转载任何含有法律、行政法规禁止的内容。本网站对用户发表在本网站的言论及用户的违法行为不承担任何法律责任。用户的言论及行为对本网站造成损失的，本网站将追究相关责任人的法律责任。</p>


                                <h3>广告免责</h3>
                                <p>本网站对用户通过本网站发布的广告、链接购买或取得的任何产品、服务出现的问题，不承担任何法律责任。</p>


                                <h3>银行服务</h3>
                                <p>用户可自由选择网上银行或其他第三方交易平台购买本网站提供的相关产品和服务。用户通过上述支付渠道购买本网站产品和服务时，由于错误操作、恶意操作、交易平台的服务缺陷、不可抗力等原因受到的一切损失，本网站不承担任何法律责任。</p>


                                <h3>法律法规规定的其他免责事由。</h3>

                            </div>

                        </div>
                        <div id="con_one_3" class="m_item">


                            <div class="a_textArea">
                                <h3>总则</h3>
                                <p>1.1用户在使用本网站及社区(下简称”网站”或”社区”)的服务之前，应当仔细阅读本协议，并同意遵守本协议及所有社区规则后方可成为社区用户，一旦用户注册成功，则用户与本论坛之间自动形成协议关系，用户应当受本协议及所有社区守则的约束。用户在使用相关的服务或产品时，应当同意接受相关协议后方能使用。</p>
                                <p>1.2社区的宗旨是让投资用户在此可以相互学习、分享、互动，所提供的信息並不构成任何投资建议或推荐，投资完全取决于您的个人独立思考和决策，本网站并不会对投资的盈利亏损承担任何责任。</p>
                                <p>1.3本网站根据《全国人大常委会关于维护互联网安全的决定》、《互联网信息服务管理办法》、《互联网用户账号名称管理规定》等现行法律法规来制定社区各类违规现象及相应处罚准则</p>
                                <p>1.4本网站的社区规则可随时更新，用户在使用本社区与相关的产品及服务时应当及时关注，用户同意本网站不承担通知义务。本网站的通知、公告、声明或其它类似内容是本协议及社区规则的一部分。</p>

                                <h3>有关社区的管理</h3>

                                <p>1 使用不文明不健康用语(侮辱、歧视、猥亵类等词句)进行人身攻击、地域攻击、民族歧视等，经发现立即限制展示或删除，并视情节严重程度对发布该内容的用户予以警告、禁言或停用账号处理。</p>
                                <p>2. 发布触及现行法律法规，危害用户和本网站安全及合法权益的信息，一旦发现立即停止展示或删除，并视情节严重程度对发布该信息的用户予以警告、禁言或停用账号处理。</p>
                                <p>3. 发布垃圾信息破坏网络环境的，如反复发布与主题无关的评论、垃圾广告等，对其他用户造成干扰且被投诉的，并视情节严重程度予以警告、禁言或停用账号处理。</p>
                                <p>4. 乱发广告信息，如销售广告、咨询广告等，一经发现立即删除，禁言或停用账号处理。</p>
                                <p>5. 胡乱发布淫秽、色情、暴力、迷信和犯罪等信息的，经发现加以清除，并视情节严重程度对该信息发布用户予以禁言、或停用账号处理。</p>
                                <p>6. 侵犯他人合法权益(名誉权、肖像权、知识产权等)的行为，以及传播病毒代码、黑客程序等妨害第三方权益的文件和信息，并被投诉的，一经发现将对该用户予以禁言、停用账户处理。</p>
                                <p>7. 用户头像、昵称以及个人简介涉及敏感时政、反动等内容，限期修改;逾期未改，将视情节严重程度予以禁言或停用账户处理。</p>
                                <p>8. 用户账号头像、昵称、简介及言论侵犯他人(包括自然人和法人)名誉权、肖像权、隐私权、知识产权、商业机密等合法权益，且被当事方举报投诉的，视情节严重程度予以限制展示、删除、警告、禁言或者停用账户处理。</p>
                                <p>9. 反复发表相同评论内容，经发现立即删除，并视情节严重程度对发布该内容用户予以禁言、停用账户处理。</p>
                                <p>10. 发布QQ号、QQ群、微信公众号、微信群号、微信二维码，以及未经本网站允许的第三方活动信息、推广信息、销售信息等营销信息，一经发现将对该用户予以禁言、停用账户处理。</p>
                                <p>本守则自修订之日起施行。对违反本社区规则的账户予以规定的警告、禁言、停用账户处理。禁言是本社区的主要处罚机制，被禁言的用户无法评论、转发、评赞、修改个人信息，只能浏览网页，禁言期后可恢复正常。禁言处罚视情节严重程度可分为禁言时间为1天、禁言时间为7天、禁言时间为15天或永久性禁言。</p>


                                <h3>有关知识产权与版权</h3>

                                <p>1、用户在本网站发布的原创内容（包括但不限于文章、图片及评论），其著作权均归用户本人所有。用户可自行授权第三方以任何形式使用、传播，无需得到本网站同意。</p>
                                <p>2、用户在本网站发布内容时即默认授予本网站免费的、不可撤销的、非独家使用许可权。为促进内容传播、分享及观点交流，本网站有权将该内容用于各种形态的产品和服务上，包括但不限于网站、应用软件、广告宣传或其他互联网产品。</p>
                                <p>3、若第三方出于非商业目的将用户发布在本网站上的内容进行转载，应当在显著位置注明原作者姓名（或原作者的“至盈账号”昵称），附载文章原始链接，及注明“发布于至盈”，且不得擅自修改文章内容。</p>
                                <p>若第三方出于商业目的进行转载的，或需要对文章进行修改的，应联系用户进行单独授权，并按用户要求使用该内容。</p>
                                <p>4、至盈有权但无义务对用户发布在本网站上的内容进行审核，有权根据相关法律法规及本网站社区守则对已核实的侵权内容进行处理，并不排除对该侵权账号的处理。</p>
                                <p>用户在本网站上传、发布相关内容，应当确保本人为著作权所有人或已取得原作者的授权，且该内容不会侵犯任何第三方的合法权益。若第三方提出著作权异议的，本网站有权根据实际情况删除相关内容，且有权追究用户的法律责任。</p>
                                <p>5、任何第三方侵犯了至盈用户相关权利，经用户授权，至盈有权代表用户对该第三方提出警告、投诉、诉讼、进行上诉，或谈判和解，且在至盈认为必要的情况下，用户也应参与共同维权。</p>

                            </div>
                        </div>


                        <div id="con_one_4" class="m_item">

                            <div class="a_textArea">

                                <h3>什么是2profit至盈网?</h3>
                                <p>2profit旨在为用户提供一个有关投资产品的搜索引擎，除了确保阁下能够选择合适的经纪商、产品及服务外，更为用户提供最新及高水平的交易资讯。2profit正努力为您打造一个100%公平公正、省力省时并能轻松赚钱的专业投资平台。</p>

                                <h3>如何挑选经纪商?</h3>
                                <p>先挑选感兴趣的产品，比如黃金，再选择所需了解的各项资料，如入金要求、槓桿比例及优惠等，最后系统会自动找出相应的选择。当你选择好合适的经纪商后，按下「申请」，就可马上进行开户。</p>
                                <h3>搜索合适的经纪商需时多久?</h3>
                                <p>只要轻松点撃几个按钮，最快10秒钟就可以得到相关的信息。</p>

                                <h3>使用2profit的搜索服务，收费如何?</h3>
                                <p>2profit所提供的经纪商搜索服务，费用全免!此外，我们提供的一系列的信息简单易明，绝对满足你对金融服务的需求</p>

                                <h3>联络我们</h3>
                                <p>电话: xxxxxxxx</p>
                                <p>电邮: xxxx@2profit.hk</p>
                                <p>地址:广州市天河区中山大道西238号勤天大厦1005室</p>

                                <h3>免费提供多元化信息</h3>
                                <p>立即关注我们的微信号，以获得更多投资信息</p>
                                <div>
                                    <img src="${ctx }/static/images/gw_code.jpg" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<div class="J_follow mt20">
		<div class="f_txt">
			<div class="t_center">
				为何选择<span>至盈网</span>？
			</div>
		</div>
		<div class="f_pic">
			<img src="${ctx }/static/images/follow.png">
		</div>

	</div>

    <%@ include file="../common/help.jsp" %>
	<%@ include file="../common/foot.jsp" %>

</body>
</html>