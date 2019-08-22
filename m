Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6380B98F32
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 11:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfHVJUO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 05:20:14 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55365 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfHVJUO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 05:20:14 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A5BF61BF206;
        Thu, 22 Aug 2019 09:20:08 +0000 (UTC)
Date:   Thu, 22 Aug 2019 11:20:08 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Ran Bi <ran.bi@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Message-ID: <20190822092008.GR27031@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
 <20190801110122.26834-3-ran.bi@mediatek.com>
 <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4e8b041-4a35-578e-07a3-2ebc99848ee2@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 11:12:29+0200, Matthias Brugger wrote:
> 
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

If they are compatible, this is the way to go but the file can't be
renamed (and that is fine).


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
