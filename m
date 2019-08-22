Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D057699291
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 13:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732003AbfHVLuU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 07:50:20 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58326 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731963AbfHVLuU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 07:50:20 -0400
X-UUID: 71a13bff9db64a2fa70989b6ffec4cbb-20190822
X-UUID: 71a13bff9db64a2fa70989b6ffec4cbb-20190822
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1308780366; Thu, 22 Aug 2019 19:50:14 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Aug
 2019 19:50:08 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 19:50:06 +0800
Message-ID: <1566474611.12318.9.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Mark Rutland" <mark.rutland@arm.com>,
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
Date:   Thu, 22 Aug 2019 19:50:11 +0800
In-Reply-To: <20190822092008.GR27031@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
         <20190822092008.GR27031@piout.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2019-08-22 at 11:20 +0200, Alexandre Belloni wrote:
> On 22/08/2019 11:12:29+0200, Matthias Brugger wrote:
> > 
> > 
> > On 01/08/2019 13:01, Ran Bi wrote:
> > > This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
> > > had different architecture compared with MT7622 RTC.
> > > 
> > > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > > ---
> > >  drivers/rtc/Kconfig      |  10 +
> > >  drivers/rtc/Makefile     |   1 +
> > >  drivers/rtc/rtc-mt2712.c | 444 +++++++++++++++++++++++++++++++++++++++
> > 
> > Can't we just adjust rtc-mt7622.c (and rename it) to unify the source for both
> > devices. What is the difference that we need to write a driver of our own?
> > 
> 
> If they are compatible, this is the way to go but the file can't be
> renamed (and that is fine).
> 
> 

They are not compatible. Both registers and operating methods are
different.

Best Regards,
Ran

