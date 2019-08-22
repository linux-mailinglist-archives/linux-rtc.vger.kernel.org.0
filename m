Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC14B9927D
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 13:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfHVLr5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 07:47:57 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:29466 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727310AbfHVLr5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 07:47:57 -0400
X-UUID: b1ba783c964143cabbdbb3840f5fdad6-20190822
X-UUID: b1ba783c964143cabbdbb3840f5fdad6-20190822
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 790826270; Thu, 22 Aug 2019 19:47:52 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n2.mediatek.inc
 (172.21.101.79) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Aug
 2019 19:47:46 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 22 Aug 2019 19:47:44 +0800
Message-ID: <1566474469.12318.7.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
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
Date:   Thu, 22 Aug 2019 19:47:49 +0800
In-Reply-To: <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
         <20190801110122.26834-3-ran.bi@mediatek.com>
         <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 07BEDA87CE6DE420B3D64B7B18F56819C1B1580EC0478AB37A2E93247614A2FB2000:8
X-MTK:  N
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2019-08-22 at 11:12 +0200, Matthias Brugger wrote:
> 
> On 01/08/2019 13:01, Ran Bi wrote:
> > This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
> > had different architecture compared with MT7622 RTC.
> > 
> > Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> > ---
> >  drivers/rtc/Kconfig      |  10 +
> >  drivers/rtc/Makefile     |   1 +
> >  drivers/rtc/rtc-mt2712.c | 444 +++++++++++++++++++++++++++++++++++++++
> 
> Can't we just adjust rtc-mt7622.c (and rename it) to unify the source for both
> devices. What is the difference that we need to write a driver of our own?
> 
> Regards,
> Matthias

We cannot merge rtc-mt7622.c and rtc-mt2712.c together. These two rtc
hardwares have totally different design. Registers naming, registers
offset and operating method are different.


