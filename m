Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6241E3729DD
	for <lists+linux-rtc@lfdr.de>; Tue,  4 May 2021 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhEDMNu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 May 2021 08:13:50 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:49303 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhEDMNt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 May 2021 08:13:49 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 65F8D240004;
        Tue,  4 May 2021 12:12:51 +0000 (UTC)
Date:   Tue, 4 May 2021 14:12:50 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] rtc: imxdi: add wakeup support
Message-ID: <YJE6QhePvy7f4LKW@piout.net>
References: <20210430093210.7034-1-martin@kaiser.cx>
 <YI0n/7M3Ke4DAwG2@piout.net>
 <20210504100858.4i2crnfwchlcopr7@viti.kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504100858.4i2crnfwchlcopr7@viti.kaiser.cx>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/05/2021 12:08:58+0200, Martin Kaiser wrote:
> Thus wrote Alexandre Belloni (alexandre.belloni@bootlin.com):
> 
> > >  	platform_set_drvdata(pdev, imxdi);
> 
> > > +	device_set_wakeup_capable(&pdev->dev, true);
> 
> > Maybe it makes sense to simply use device_init_wakeup here.
> 
> the explanation for device_init_wakeup
> 
> "By default, most devices should leave wakeup disabled. The exceptions
> are devices that everyone expects to be wakeup sources: keyboards, power
> buttons, ..."
> 
> made me think that device_set_wakeup_capable is more appropriate here. I
> can change this if you want.
> 

Doesn't everyone expect the RTC to be a wakeup source? :)

> However, if I compile rtc-imxdi as a module and use device_init_wakeup,
> the module can't be unloaded any more. The reason is that alarmtimer
> (kernel/time/alarmtimer.c) starts using rtc-imxdi as its backing rtc
> device and holds a reference to it. It seems that alarmtimer has no way
> to relinquish its backing rtc device, regardless of any pending alarms.
> 
> What is the right approach here? Are there any rtc drivers that act as a
> wakeup source and can still be unloaded if compiled as a module?
> 

Yes, when you don't have alarmtimer ;)
I honestly think the RTC selection needs to be a bit more dynamic but at
the same time, it would not be great to change it at suspend time. I
guess the best way would be to allow module unloading and tracking when
the RTC disappears.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
