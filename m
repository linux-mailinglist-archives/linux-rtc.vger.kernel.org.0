Return-Path: <linux-rtc+bounces-386-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0E800E73
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A29A1C208C8
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B774A990;
	Fri,  1 Dec 2023 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LvPjr6Vf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9EF10D8;
	Fri,  1 Dec 2023 07:20:13 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA4141BF206;
	Fri,  1 Dec 2023 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701444012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wM5OHPLsXa1vxZ4TVCD3/a/nwUaLHqi0SxNldNQwSdw=;
	b=LvPjr6VfI/Cikhv4tfSqklE+QrQR3EsdBlW9hPGCOlQ+Tu2udZ7iYvBAatoFuDIxZOvwuN
	WHoW51Jn/v6SOljOTWCtv01eWySpFQvC0UHHRqBsaAiiRQztp3VT2kBZUS/j2AaGu+mLgq
	UhFfnZVpTSIPdttzX/QmoFb0EUuwViYmr/MZmJ4rMhwxkCj6WYcvE/pbmeJt8+YNVXViJ/
	jDIFyHkhYvHerevvuF1lSKLd/SIAEszkiJ7atNE0g8r8ypAYS0uQInEKjMDBXO53cKcsPY
	1jgrY9Ytss1I8kvSrOIPscYroKqXX1TK1imbCQEF4r2nzn+D5OL8tWSfvHoQmg==
Date: Fri, 1 Dec 2023 16:20:10 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Support Opensource <support.opensource@diasemi.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
Message-ID: <202312011520103c5f28dc@mail.local>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 01/12/2023 13:30:05+0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
> > 
> > Hi Biju,
> > 
> > On Fri, Dec 1, 2023 at 12:08 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Replace dev_err()->dev_err_probe() to simpilfy probe().
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/rtc/rtc-da9063.c
> > > +++ b/drivers/rtc/rtc-da9063.c
> > > @@ -488,8 +480,9 @@ static int da9063_rtc_probe(struct platform_device
> > *pdev)
> > >                                                 IRQF_TRIGGER_LOW |
> > IRQF_ONESHOT,
> > >                                                 "ALARM", rtc);
> > >                 if (ret)
> > > -                       dev_err(&pdev->dev, "Failed to request ALARM
> > IRQ %d: %d\n",
> > > -                               irq_alarm, ret);
> > > +                       return dev_err_probe(&pdev->dev, ret,
> > > +                                            "Failed to request ALARM
> > IRQ %d\n",
> > > +                                            irq_alarm);
> > 
> > This changes behavior: before, this was not considered fatal.
> 
> Agreed. Maybe a separate patch?
> 
> if there is no irqhandler on platform with IRQ populated nothing will work,
> RTC won't work as "rtc_update_irq " updated in irq handler.
> I think it is a fatal condition.

This is not true, an RTC can wake up a system without an IRQ.

> 
> Cheers,
> Biju
> 
> > 
> > >
> > >                 ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
> > >                 if (ret)
> > 
> > The rest LGTM, so with the above fixed/clarified:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> > m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker.
> > But when I'm talking to journalists I just say "programmer" or something
> > like that.
> >                                 -- Linus Torvalds

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

