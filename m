Return-Path: <linux-rtc+bounces-388-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31618800EDC
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 16:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D901C20961
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073444B5C9;
	Fri,  1 Dec 2023 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dEWmARe/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ECE19E;
	Fri,  1 Dec 2023 07:55:12 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA9EA240002;
	Fri,  1 Dec 2023 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701446111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/JiElhpvxO5Zz75JHOlPlXFOjvQRYEYqqDZwksk2oQ=;
	b=dEWmARe/EmdXKdz6Ne4R/N9IsvTHBjBaGKGqbdrErjjw2mHcr8ExhgF/czFWObnr4AyYDn
	8St+NwIcVYBWz+9GMmdicgSF7CHNTrE1AMEsw1No50vr7SJ0av9lWNWeV66gj37Iv9fG0B
	6OLp5Hw8PL8Lr4FZx1E5oEdPz68TriOm7ALNprPVkHidyUMTj/d1NXlQQcGzlNeAXRLbmW
	IHZub6lp1U+FEcs8HhjZDK8eUP9FVWZRyu7xFu+Pdw6GfyyexougsuQfh6ey2wB3zYaf+n
	AnviNV10oSnjzqZpbZtVTEmbfh19AG6ZJFkXZ/hVjEwLKlPMUHoGY7icuGokuw==
Date: Fri, 1 Dec 2023 16:55:09 +0100
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
Message-ID: <202312011555095065168a@mail.local>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <202312011520103c5f28dc@mail.local>
 <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 01/12/2023 15:43:27+0000, Biju Das wrote:
> Hi Alexandre Belloni,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
> > 
> > On 01/12/2023 13:30:05+0000, Biju Das wrote:
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Subject: Re: [PATCH 3/6] rtc: da9063: Use dev_err_probe()
> > > >
> > > > Hi Biju,
> > > >
> > > > On Fri, Dec 1, 2023 at 12:08 PM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Replace dev_err()->dev_err_probe() to simpilfy probe().
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/rtc/rtc-da9063.c
> > > > > +++ b/drivers/rtc/rtc-da9063.c
> > > > > @@ -488,8 +480,9 @@ static int da9063_rtc_probe(struct
> > > > > platform_device
> > > > *pdev)
> > > > >                                                 IRQF_TRIGGER_LOW |
> > > > IRQF_ONESHOT,
> > > > >                                                 "ALARM", rtc);
> > > > >                 if (ret)
> > > > > -                       dev_err(&pdev->dev, "Failed to request ALARM
> > > > IRQ %d: %d\n",
> > > > > -                               irq_alarm, ret);
> > > > > +                       return dev_err_probe(&pdev->dev, ret,
> > > > > +                                            "Failed to request
> > > > > + ALARM
> > > > IRQ %d\n",
> > > > > +                                            irq_alarm);
> > > >
> > > > This changes behavior: before, this was not considered fatal.
> > >
> > > Agreed. Maybe a separate patch?
> > >
> > > if there is no irqhandler on platform with IRQ populated nothing will
> > > work, RTC won't work as "rtc_update_irq " updated in irq handler.
> > > I think it is a fatal condition.
> > 
> > This is not true, an RTC can wake up a system without an IRQ.
> 
> Agreed, I will restore the behaviour for this case.
> It may not be fatal. But basic "hwclock -r" from userspace won't
> work as " RTC_FEATURE_UPDATE_INTERRUPT" set and there is no irqhandler.
> 

RTC_FEATURE_ALARM is what you should clear and you have to fallback to
the irq is not present case.

> Cheers,
> Biju
> 
> 
> 
> Cheers,
> Biju
> 
> > 
> > >
> > > Cheers,
> > > Biju
> > >
> > > >
> > > > >
> > > > >                 ret = dev_pm_set_wake_irq(&pdev->dev, irq_alarm);
> > > > >                 if (ret)
> > > >
> > > > The rest LGTM, so with the above fixed/clarified:
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Gr{oetje,eeting}s,
> > > >
> > > >                         Geert
> > > >
> > > > --
> > > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > > geert@linux- m68k.org
> > > >
> > > > In personal conversations with technical people, I call myself a
> > hacker.
> > > > But when I'm talking to journalists I just say "programmer" or
> > > > something like that.
> > > >                                 -- Linus Torvalds
> > 
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> > engineering
> > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.
> > com%2F&data=05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cb699f48656d34a923a640
> > 8dbf28104af%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63837040817604431
> > 5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> > aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=E9tDi08sBRoh4tBccQB%2B8az%2BqQ4%2
> > FtQOpFjdPgU8zQXc%3D&reserved=0

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

