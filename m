Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0037211258C
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2019 09:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfLDImh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Dec 2019 03:42:37 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:32953 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfLDImh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Dec 2019 03:42:37 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 72CCAC0005;
        Wed,  4 Dec 2019 08:42:34 +0000 (UTC)
Date:   Wed, 4 Dec 2019 09:42:33 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     eddie.huang@mediatek.com, sean.wang@mediatek.com,
        a.zummo@towertech.it, matthias.bgg@gmail.com,
        dan.carpenter@oracle.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH v2 -next] rtc: mt6397: drop free_irq of devm_xx allocated
 irq
Message-ID: <20191204084233.GL909634@piout.net>
References: <20191204063444.GF1765@kadam>
 <20191204072826.117432-1-maowenan@huawei.com>
 <20191204084036.GK909634@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204084036.GK909634@piout.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/12/2019 09:40:38+0100, Alexandre Belloni wrote:
> On 04/12/2019 15:28:26+0800, Mao Wenan wrote:
> > rtc->irq is requested by devm_request_threaded_irq,
> > and request_threaded_irq. IRQs requested with this
> > function will be automatically freed on driver detach.
> > This patch remove unused error label as well.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > ---
> >  v2: remove error label as Dan Carpenter suggest.
> >  drivers/rtc/rtc-mt6397.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index 5249fc99fd5f..14f3c4915260 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -287,13 +287,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
> >  	rtc->rtc_dev->ops = &mtk_rtc_ops;
> >  
> >  	ret = rtc_register_device(rtc->rtc_dev);
> > -	if (ret)
> > -		goto out_free_irq;
> > -
> > -	return 0;
> > -
> > -out_free_irq:
> > -	free_irq(rtc->irq, rtc);
> >  	return ret;
> 
> Maybe return rtc_register_device(rtc->rtc_dev); 
> 

By the way, this was already properly submitted here:
https://patchwork.ozlabs.org/patch/1193956/

So I'll apply this one once the merge window ends (it depends on the MFD
pull request, that is why I didn't apply it yet).


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
