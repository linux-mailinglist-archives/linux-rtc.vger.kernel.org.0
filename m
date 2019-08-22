Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6591599423
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 14:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731126AbfHVMqe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 08:46:34 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43107 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbfHVMqe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 08:46:34 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 01503100003;
        Thu, 22 Aug 2019 12:46:28 +0000 (UTC)
Date:   Thu, 22 Aug 2019 14:46:28 +0200
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
Subject: Re: [PATCH v2 2/4] rtc: Add support for the MediaTek MT2712 RTC
Message-ID: <20190822124628.GS27031@piout.net>
References: <20190801110122.26834-1-ran.bi@mediatek.com>
 <20190801110122.26834-3-ran.bi@mediatek.com>
 <20190820201744.GZ3545@piout.net>
 <1566477254.12318.41.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566477254.12318.41.camel@mhfsdcap03>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2019 20:34:14+0800, Ran Bi wrote:
> > > +	/* RTC need POWERKEY1/2 match, then goto normal work mode */
> > > +	mt2712_writel(rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
> > > +	mt2712_writel(rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
> > 
> > This should be written when setting the time after power was lost.
> > 
> 
> I suppose we can move this into mt2712_rtc_read_time function's "if
> (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY)" condition
> which will be added at next patch. We need additional flag to mark this
> condition or another if condition in mt2712_rtc_set_time fucntion if we
> put these code in mt2712_rtc_set_time function.
> 

It is fine to test both in read_time and in set_time.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
