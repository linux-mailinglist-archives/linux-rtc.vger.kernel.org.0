Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DDD456C1E
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Nov 2021 10:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhKSJKV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Nov 2021 04:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhKSJKT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Nov 2021 04:10:19 -0500
Received: from forward501j.mail.yandex.net (forward501j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91F5C061574;
        Fri, 19 Nov 2021 01:07:17 -0800 (PST)
Received: from iva1-9aa5fe580da0.qloud-c.yandex.net (iva1-9aa5fe580da0.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7683:0:640:9aa5:fe58])
        by forward501j.mail.yandex.net (Yandex) with ESMTP id C769F6237F2;
        Fri, 19 Nov 2021 12:07:12 +0300 (MSK)
Received: from iva3-dd2bb2ff2b5f.qloud-c.yandex.net (iva3-dd2bb2ff2b5f.qloud-c.yandex.net [2a02:6b8:c0c:7611:0:640:dd2b:b2ff])
        by iva1-9aa5fe580da0.qloud-c.yandex.net (mxback/Yandex) with ESMTP id PrJgnaMmVo-7CDOOQ8H;
        Fri, 19 Nov 2021 12:07:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1637312832;
        bh=XxEZV2qVotbKLWdn70cg99o5JL/j2ooQ5W7xIhnZArE=;
        h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
        b=lRc09FrUGwzLPA3xUAhAm1W9VxaLH3TZW8xkFxIEmpG2geL+XXc/JLY7+n1sBTSDb
         paKe6U7mo0UVaF1jbpaIiiqkvwl2EcFUe7vKzZqZvpXLGqW+G/4J5zhgQIXGx5vXMQ
         MdkNQOuOPevvQQSC29fO6OsQ96zBeB1X0IcHFgKk=
Authentication-Results: iva1-9aa5fe580da0.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva3-dd2bb2ff2b5f.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id HvVo4PkPsF-7BxWXMaB;
        Fri, 19 Nov 2021 12:07:11 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Date:   Fri, 19 Nov 2021 12:07:10 +0300
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rtc: da9063: add as wakeup source
Message-ID: <20211119120710.13eb1173@redslave.neermore.group>
In-Reply-To: <YZYd7kNanfxY3tJq@piout.net>
References: <20211118084008.30327-1-nikita.shubin@maquefel.me>
        <YZYd7kNanfxY3tJq@piout.net>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre,

Sorry for the rush - I should have to think more before sending this
patch ...

On Thu, 18 Nov 2021 10:33:34 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
> 
> On 18/11/2021 11:40:08+0300, Nikita Shubin wrote:
> > in case if threaded irq registered successfully - add da9063
> > as a wakeup source if "wakeup-source" node present in device tree,
> > set as wakeup capable otherwise.
> > 
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> > ---
> >  drivers/rtc/rtc-da9063.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> > index d4b72a9fa2ba..1aceb5ba6992 100644
> > --- a/drivers/rtc/rtc-da9063.c
> > +++ b/drivers/rtc/rtc-da9063.c
> > @@ -490,7 +490,15 @@ static int da9063_rtc_probe(struct
> > platform_device *pdev) da9063_alarm_event,
> >  					IRQF_TRIGGER_LOW |
> > IRQF_ONESHOT, "ALARM", rtc);
> > -	if (ret)
> > +	if (!ret) {
> > +		if (device_property_present(&pdev->dev,
> > "wakeup-source")) {
> > +			device_init_wakeup(&pdev->dev, true);  
> 
> If wakeup-source is present, then this should be done regardless of
> the registration of the interrupt handler. Note that wakeup-source and
> interrupt are supposed to be mutually exclusive.
> 

We still able to wakeup either ALARM IRQ is present or not.

Actually the only thing is needed in this particular case is the ability
to set "wakealarm" via sysfs - so we can wakeup from
POWER-DOWN/DELIVERY/RTC modes, namely shutdown, regardless of CONFIG_PM.

Setting dev->power.can_wakeup to true is enough for that.

On the other hand device_init_wakeup also sets can_wakeup.

May be it's enough to use device_init_wakeup in case if ALARM IRQ is
present or "wakeup-source" is set ?

I see some construction in drivers/rtc like :

```
rtc/rtc-pcf2127.c:673:  if (alarm_irq > 0 ||
device_property_read_bool(dev, "wakeup-source")) {
rtc/rtc-ab-eoz9.c:552:  if (client->irq > 0 ||
device_property_read_bool(dev, "wakeup-source")) {
```




> > +			dev_info(&pdev->dev, "registered as wakeup
> > source.\n");  
> 
> This is too verbose please avoid adding new strings
> 
> > +		} else {
> > +			device_set_wakeup_capable(&pdev->dev,
> > true);  
> 
> I think this is misusing the wakeup-source property for configuration
> that should be left to userspace.
> 
> > +			dev_info(&pdev->dev, "marked as wakeup
> > capable.\n");  
> 
> Ditto
> 
> > +		}
> > +	} else  
> 
> unbalanced brackets
> 
> 
> >  		dev_err(&pdev->dev, "Failed to request ALARM IRQ
> > %d: %d\n", irq_alarm, ret);
> >  
> > -- 
> > 2.31.1
> >   
> 

