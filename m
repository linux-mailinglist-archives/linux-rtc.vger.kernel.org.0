Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7D7FCF04
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2019 20:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNT7o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Nov 2019 14:59:44 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60949 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfKNT7n (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Nov 2019 14:59:43 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 910841C0007;
        Thu, 14 Nov 2019 19:59:41 +0000 (UTC)
Date:   Thu, 14 Nov 2019 20:59:41 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: tps65910: allow using RTC without alarm interrupt
Message-ID: <20191114195941.GL3572@piout.net>
References: <20191109154652.7419-1-andrej.skvortzov@gmail.com>
 <20191111171915.GA3572@piout.net>
 <20191113230805.GH13629@skv.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113230805.GH13629@skv.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/11/2019 02:08:05+0300, Andrey Skvortsov wrote:
> > >  static int tps65910_rtc_probe(struct platform_device *pdev)
> > >  {
> > >  	struct tps65910 *tps65910 = NULL;
> > > @@ -415,13 +422,17 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
> > >  		tps65910_rtc_interrupt, IRQF_TRIGGER_LOW,
> > >  		dev_name(&pdev->dev), &pdev->dev);
> > >  	if (ret < 0) {
> > > -		dev_err(&pdev->dev, "IRQ is not free.\n");
> > > -		return ret;
> > > +		dev_err(&pdev->dev, "request IRQ:%d failed, err = %d\n",
> > > +			 irq, ret);
> > 
> > Do we actually need an error message here?
> 
> You are right. This is definitely not an error anymore.
> What about
> dev_warn(&pdev->dev, "unable to request IRQ, alarms disabled\n");
> like some other drivers do?
> 

Yes, or that can be left out completely as userspace will be able to
know whether alarms are supported without this message.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
