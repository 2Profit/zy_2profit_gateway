/// <reference path="jquery-1.8.3.min.js" />
/// <reference path="common.js" />
$(function () {
    $("select").change(function () {
        var $a = $(this).prev();
        if ($a.is("a")) {
            $a.html($(this).find('option:selected').text());

        }
    });
});


jc.uiExtend("header", {
    init: function () {
        this.$item = this.$element.find(".n_item");
        this.$item.hover(function () {
            $(this).addClass("active")
        }, function () {
            $(this).removeClass("active");
        });


    }

});

jc.uiExtend("newsList", {
    init: function () {
        this.$element.on("click", ".t_txt a", function () {
            var $item = $(this).parents(".n_item");
            $item.addClass("current").siblings().removeClass("current");


        });
    }

});


jc.uiExtend("silder", {
    timer: null,
    iNow: 0,
    iMax: 0,
    animate: function (oInfo) {
        var iT = oInfo.scrollTop;
        var offsetTop = this.$element.offset().top;
        var offsetHeight = 400
        var iPre = (iT - offsetTop + 60) / offsetHeight;



        if (iPre >= -1 && iPre <= 1) {
            if (this.aItem) {
                this.aItem.each(function (i, obj) {
                    $(obj).css("backgroundPosition", "50% " + -parseInt(iPre * (offsetHeight / 2)) + "px");
                });


            }
        }
    },
    scroll: function (oInfo) {
        /* 暂不开放 */
        //this.animate(oInfo);
    },
    next: function () {
        if (this.iNow == this.iMax - 1) {
            this.iNow = 0;
        }
        else {
            this.iNow++;
        }
        this.jump(this.iNow);

    },
    prev: function () {
        if (this.iNow == 0) {
            this.iNow = this.iMax - 1;
        }
        else {
            this.iNow--;
        }
        this.jump(this.iNow);

    },
    jump: function (eq, fast) {
        this.iNow = eq;

        if (!fast) {
            this.aItem.eq(eq).stop().animate({ opacity: 1 }, "slow", function () {
                $(this).addClass("active");
            }).siblings().stop().animate({ opacity: 0 }, "slow", function () {
                $(this).removeClass("active");
            });
        }
        else {
            this.aItem.eq(eq).stop().css({ opacity: 1, filter: "alpha(opacity=100)" }).addClass("active").siblings().stop().css({ opacity: 0, filter: "alpha(opacity=0)" }).removeClass("active");
        }

        this.aDot.eq(eq).addClass("active").siblings().removeClass("active");

    },
    autoPlay: function (bool) {
        var _this = this;
        if (bool) {
            clearInterval(this.timer);
            this.timer = setInterval(function () {
                if (_this.iNow == _this.iMax - 1) {
                    _this.iNow = 0;
                }
                else {
                    _this.iNow++
                }
                _this.jump(_this.iNow);
            }, 6000);
        }
        else {
            clearInterval(this.timer);
        }

    },
    init: function (oInfo) {

        var _this = this;

        /* 暂不开放 */
        //this.animate(oInfo);

        this.oMain = this.$element.find(".s_main");
        this.aItem = this.oMain.children();

        this.oStep = this.$element.find(".s_step").children();

        this.oController = this.$element.find(".s_controller");


        this.aItem.each(function (i, obj) {
            var oA = $("<a>").attr("href", "javascript:;").mousemove(function () {
                _this.jump($(this).index(), true);
            });
            _this.oController.append(oA);
        });

        this.aDot = this.oController.children();

        this.iMax = this.aItem.length;
        this.jump(0);
        if (this.iMax == 1) return;


        this.oStep.eq(0).click(function () {
            _this.prev();
        });

        this.oStep.eq(1).click(function () {
            _this.next();
        });


        this.$element.hover(function () {
            _this.autoPlay(false);
            _this.oStep.eq(0).stop().animate({ left: 20 }, "fast");
            _this.oStep.eq(1).stop().animate({ right: 20 }, "fast");
        }, function () {
            _this.oStep.eq(0).stop().animate({ left: -60 }, "fast");
            _this.oStep.eq(1).stop().animate({ right: -60 }, "fast");
            _this.autoPlay(true);
        });


        this.autoPlay(true);
    }


});