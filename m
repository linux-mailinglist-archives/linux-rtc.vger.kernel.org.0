Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BB9994EB
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387663AbfHVN0M (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:26:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:14642 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387656AbfHVN0M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 09:26:12 -0400
X-UUID: dca9e798c9ad42a29e763754447fd89f-20190822
X-UUID: dca9e798c9ad42a29e763754447fd89f-20190822
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 589225648; Thu, 22 Aug 2019 21:26:05 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n2.mediatek.inc
 (172.21.101.79) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Aug
 2019 21:25:58 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 21:25:57 +0800
Message-ID: <1566480361.12318.50.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
Date:   Thu, 22 Aug 2019 21:26:01 +0800
In-Reply-To: <20190822124628.GS27031@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <20190820201744.GZ3545@piout.net> <1566477254.12318.41.camel@mhfsdcap03>
         <20190822124628.GS27031@piout.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 4A80D6DF06A3D680719A0995A2CA8D7F7359214F695A4E566799154D0A1A2C5E2000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2019-08-22 at 14:46 +0200, Alexandre Belloni wrote:
> On 22/08/2019 20:34:14+0800, Ran Bi wrote:
> > > > +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> > > > +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> > > > +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
> > > 
> > > This should be written when setting the time after power was lost.
> > > 
> > 
> > I suppose we can move this into mt2712_rtc_read_time function's "if
> > (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)" condition
> > which will be added at next patch. We need additional flag to mark this
> > condition or another if condition in mt2712_rtc_set_time fucntion if we
> > put these code in mt2712_rtc_set_time function.
> > 
> 
> It is fine to test both in read_time and in set_time.
> 

Do you mean that we can test powerkey and then set powerkey both in
read_time and in set_time?

