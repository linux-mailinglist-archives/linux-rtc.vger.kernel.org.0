Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E859D9A7AB
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 08:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404587AbfHWGfn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 02:35:43 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36095 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404002AbfHWGfn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 02:35:43 -0400
X-UUID: 7ab191db2f1c49c793ecc1f23032c2d2-20190823
X-UUID: 7ab191db2f1c49c793ecc1f23032c2d2-20190823
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1157516820; Fri, 23 Aug 2019 14:35:34 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 23 Aug
 2019 14:35:32 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 23 Aug 2019 14:35:26 +0800
Message-ID: <1566542131.12318.52.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/4] bindings: rtc: add bindings for MT2712 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        "Flora Fu" <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Date:   Fri, 23 Aug 2019 14:35:31 +0800
In-Reply-To: <84bd8752-f437-781f-9f08-cedfca6cc06a@gmail.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-2-ran.bi@mediatek.com>
         <84bd8752-f437-781f-9f08-cedfca6cc06a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


Hi,

> > +Required properties:
> > +- compatible	    : Should be "mediatek,mt2712-rtc" : for MT2712 SoC
> > +- reg 		    : Specifies base physical address and size of the registers;
> > +- interrupts	    : Should contain the interrupt for RTC alarm;
> 
> No clocks for the RTC? What about CLK_TOP_RTC_SEL from the clk driver?
> 
> Regards,
> Matthias
> 

I suppose that we don't need clock control for mt2712 RTC. RTC clock is directly
come from 32K crystal and there is no control register to switch the clock. In mt2712,
CLK_TOP_RTC_SEL is prepared for other module even it called CLK_TOP_RTC_SEL.

Regards,
Ran

> > +
> > +Example:
> > +
> > +rtc: rtc@10011000 {
> > +	compatible = "mediatek,mt2712-rtc";
> > +	reg = <0 0x10011000 0 0x1000>;
> > +	interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_LOW>;
> > +};
> > 



