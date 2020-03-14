Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672BF1858B0
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Mar 2020 03:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgCOCS3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Mar 2020 22:18:29 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:42224 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgCOCS3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Mar 2020 22:18:29 -0400
X-Greylist: delayed 2387 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Mar 2020 22:18:27 EDT
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 27F5B3A3405;
        Sat, 14 Mar 2020 12:26:29 +0000 (UTC)
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C566A240009;
        Sat, 14 Mar 2020 12:24:55 +0000 (UTC)
Date:   Sat, 14 Mar 2020 13:24:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v3 0/4] Add Support for MediaTek MT2712 RTC
Message-ID: <20200314122455.GC4518@piout.net>
References: <20200226051303.22560-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226051303.22560-1-ran.bi@mediatek.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/02/2020 13:12:59+0800, Ran Bi wrote:
> This patchset add support to MT2712 RTC. MT2712 RTC is a SoC based RTC
> with different architecture compared to MT7622 RTC.
> 
> Changes in V3:
> 1. change struct mt2712_rtc
> 2. use 100 as year offset
> 3. change irq handle thread
> 4. remove useless rtc time check
> 5. not modify struct rtc_time in set_time/set_alarm functions
> 6. modify rtc init function
> 7. add power lost flag for get_time/set_time functions
> 8. add .alarm_irq_enable callback
> 9. set rtc->range_min and rtc->range_max to do range checking
> 10. use fixed driver name
> 
> Changes in V2:
> 1. change minimum year from 1968 to 2000
> 2. fix lock usage
> 3. stop to calculate useless day of week
> 4. stop to set default date after init
> 5. change the prefix of functions
> 6. use devm_request_threaded_irq() to replace request_threaded_irq()
> 7. add mt2712 rtc related files into MAINTAINERS
> 
> Ran Bi (4):
>   bindings: rtc: add bindings for MT2712 RTC
>   rtc: add support for the MediaTek MT2712 RTC
>   arm64: dts: add RTC nodes for MT2712
>   MAINTAINERS: add MT2712 RTC files
> 

Applied 1,2 and 4, thanks!


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
