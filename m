Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAB237287B
	for <lists+linux-rtc@lfdr.de>; Tue,  4 May 2021 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhEDKKE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 May 2021 06:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhEDKKD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 May 2021 06:10:03 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3EC061574;
        Tue,  4 May 2021 03:09:08 -0700 (PDT)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
        (envelope-from <martin@viti.kaiser.cx>)
        id 1ldrz8-0005ZI-4O; Tue, 04 May 2021 12:08:58 +0200
Date:   Tue, 4 May 2021 12:08:58 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] rtc: imxdi: add wakeup support
Message-ID: <20210504100858.4i2crnfwchlcopr7@viti.kaiser.cx>
References: <20210430093210.7034-1-martin@kaiser.cx>
 <YI0n/7M3Ke4DAwG2@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI0n/7M3Ke4DAwG2@piout.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

(added Stephen for alarmtimer)

Hi Alexandre and all,

Thus wrote Alexandre Belloni (alexandre.belloni@bootlin.com):

> >  	platform_set_drvdata(pdev, imxdi);

> > +	device_set_wakeup_capable(&pdev->dev, true);

> Maybe it makes sense to simply use device_init_wakeup here.

the explanation for device_init_wakeup

"By default, most devices should leave wakeup disabled. The exceptions
are devices that everyone expects to be wakeup sources: keyboards, power
buttons, ..."

made me think that device_set_wakeup_capable is more appropriate here. I
can change this if you want.

However, if I compile rtc-imxdi as a module and use device_init_wakeup,
the module can't be unloaded any more. The reason is that alarmtimer
(kernel/time/alarmtimer.c) starts using rtc-imxdi as its backing rtc
device and holds a reference to it. It seems that alarmtimer has no way
to relinquish its backing rtc device, regardless of any pending alarms.

What is the right approach here? Are there any rtc drivers that act as a
wakeup source and can still be unloaded if compiled as a module?

> > +
> > +static SIMPLE_DEV_PM_OPS(dryice_pm, dryice_suspend, dryice_resume);
> > +

> I'm wondering, can't you use dev_pm_set_wake_irq to avoid having to
> keep the changes to a minimum?

I did a quick test, this seems to work. I'll change it in v2.

Thanks,
Martin
