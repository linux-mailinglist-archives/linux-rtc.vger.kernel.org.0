Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3C245986D
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Nov 2021 00:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhKVXd1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Nov 2021 18:33:27 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39967 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhKVXd0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Nov 2021 18:33:26 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EC831E000B;
        Mon, 22 Nov 2021 23:30:16 +0000 (UTC)
Date:   Tue, 23 Nov 2021 00:30:16 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rtc: da9063: add as wakeup source
Message-ID: <YZwoCBKy+OJl8T1u@piout.net>
References: <20211118084008.30327-1-nikita.shubin@maquefel.me>
 <YZYd7kNanfxY3tJq@piout.net>
 <20211119120710.13eb1173@redslave.neermore.group>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119120710.13eb1173@redslave.neermore.group>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/11/2021 12:07:10+0300, Nikita Shubin wrote:
> Hello Alexandre,
> 
> Sorry for the rush - I should have to think more before sending this
> patch ...
> 
> On Thu, 18 Nov 2021 10:33:34 +0100
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > Hello,
> > 
> > On 18/11/2021 11:40:08+0300, Nikita Shubin wrote:
> > > in case if threaded irq registered successfully - add da9063
> > > as a wakeup source if "wakeup-source" node present in device tree,
> > > set as wakeup capable otherwise.
> > > 
> > > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> > > ---
> > >  drivers/rtc/rtc-da9063.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> > > index d4b72a9fa2ba..1aceb5ba6992 100644
> > > --- a/drivers/rtc/rtc-da9063.c
> > > +++ b/drivers/rtc/rtc-da9063.c
> > > @@ -490,7 +490,15 @@ static int da9063_rtc_probe(struct
> > > platform_device *pdev) da9063_alarm_event,
> > >  					IRQF_TRIGGER_LOW |
> > > IRQF_ONESHOT, "ALARM", rtc);
> > > -	if (ret)
> > > +	if (!ret) {
> > > +		if (device_property_present(&pdev->dev,
> > > "wakeup-source")) {
> > > +			device_init_wakeup(&pdev->dev, true);  
> > 
> > If wakeup-source is present, then this should be done regardless of
> > the registration of the interrupt handler. Note that wakeup-source and
> > interrupt are supposed to be mutually exclusive.
> > 
> 
> We still able to wakeup either ALARM IRQ is present or not.
> 
> Actually the only thing is needed in this particular case is the ability
> to set "wakealarm" via sysfs - so we can wakeup from
> POWER-DOWN/DELIVERY/RTC modes, namely shutdown, regardless of CONFIG_PM.
> 
> Setting dev->power.can_wakeup to true is enough for that.
> 
> On the other hand device_init_wakeup also sets can_wakeup.
> 
> May be it's enough to use device_init_wakeup in case if ALARM IRQ is
> present or "wakeup-source" is set ?
> 
> I see some construction in drivers/rtc like :
> 
> ```
> rtc/rtc-pcf2127.c:673:  if (alarm_irq > 0 ||
> device_property_read_bool(dev, "wakeup-source")) {
> rtc/rtc-ab-eoz9.c:552:  if (client->irq > 0 ||
> device_property_read_bool(dev, "wakeup-source")) {
> ```
> 

Yes, this is what I meant, call device_init_wakeup when an irq has been
successfully requested or wakeup-source is present.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
