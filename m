Return-Path: <linux-rtc+bounces-432-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFE8194D3
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Dec 2023 00:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91F01C211B2
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Dec 2023 23:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0B23EA94;
	Tue, 19 Dec 2023 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J5ewdvpD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C340BE2;
	Tue, 19 Dec 2023 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6E44C0002;
	Tue, 19 Dec 2023 23:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703030175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgtXNhubx8x50UqA1ExEQbgsqS8VRI11P5KJAMfGmg8=;
	b=J5ewdvpD5K2CSKegu9GaMX1LA6s+omUjBK4P814U0bxD+45Awu8cN0c6BmXSNYFy390I0q
	c2Rb+KLcuuhmbJKOVmHZfbyILdu0LM1KftRzIQlhWWyn5kJZEMGMNiZyqHzaqLiLIfwHGo
	lTnQPkCLT9n2IKEVYqWZ2XZUs5MDkcXvURto8ksJEuaoZZdUR5oe8VWAfE+RFBroZnF7wB
	HEW41mmhVuF3zqs7OqwHsQ/eBBeSFruTDZ2xRG37x/iFvPhJi3PHPHfWS50eBif8YBfyhE
	AOzqHcWCMfOuUFetp0OreZ0HU4Ie1e0wts/08e8YQV763FwDtWmTf6u8HFsFBA==
Date: Wed, 20 Dec 2023 00:56:14 +0100
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
Message-ID: <20231219235614f359e62e@mail.local>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoRpHnzLg+FPTpJ49RdwuUJKEVHkaSzifEH2oKoV=6zA@mail.gmail.com>
 <TYVPR01MB112796ACC50655F7C107420B58681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <202312011520103c5f28dc@mail.local>
 <TYCPR01MB1126992FDD7B1F2DEFEFD8BE68681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <202312011555095065168a@mail.local>
 <TYCPR01MB11269531DC2A3ACF0A78FD8AE8681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20231219234956fd65a895@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219234956fd65a895@mail.local>
X-Spam-Flag: yes
X-Spam-Level: ********************
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: alexandre.belloni@bootlin.com

On 20/12/2023 00:49:57+0100, Alexandre Belloni wrote:
> On 01/12/2023 16:40:25+0000, Biju Das wrote:
> > > RTC_FEATURE_ALARM is what you should clear and you have to fallback to the
> > > irq is not present case.
> > 
> > 
> > Ok,Will update Patch#3 with clearing "RTC_FEATURE_ALARM" as the fallback for the irqhandler error case
> > 
> > On patch#1, I will clear both RTC_FEATURE_ALARM" and "RTC_FEATURE_UPDATE_INTERRUPT",
> > 
> > as with just clearing "RTC_FEATURE_ALARM", I get below error.
> > 
> > root@smarc-rzg2ul:~# date -s "2023-08-06 19:30:00"
> > Sun Aug  6 19:30:00 UTC 2023
> > root@smarc-rzg2ul:~# hwclock -w
> > root@smarc-rzg2ul:~# hwclock -r
> > hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> > root@smarc-rzg2ul:~#
> > 
> >
> 
> I can't believe this is true because the rtc core code will take the
> same path when RTC_FEATURE_ALARM or RTC_FEATURE_UPDATE_INTERRUPT is
> cleared:
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/rtc/interface.c#L574
> 
> RTC_FEATURE_UPDATE_INTERRUPT must be cleared only when RTC_FEATURE_ALARM
> is set.

Are you sure you didn't break this test:

https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-da9063.c#L479

> 
> 
> > Cheers,
> > Biju
> > 
> > > > > > >
> > > > > > > >
> > > > > > > >                 ret = dev_pm_set_wake_irq(&pdev->dev,
> > > irq_alarm);
> > > > > > > >                 if (ret)
> > > > > > >
> > > > > > > The rest LGTM, so with the above fixed/clarified:
> > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > >
> > > > > > > Gr{oetje,eeting}s,
> > > > > > >
> > > > > > >                         Geert
> > > > > > >
> > > > > > > --
> > > > > > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > > > > > geert@linux- m68k.org
> > > > > > >
> > > > > > > In personal conversations with technical people, I call myself a
> > > > > hacker.
> > > > > > > But when I'm talking to journalists I just say "programmer" or
> > > > > > > something like that.
> > > > > > >                                 -- Linus Torvalds
> > > > >
> > > > > --
> > > > > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and
> > > > > Kernel engineering
> > > > >
> > > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin%
> > > 2F&data=05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C72e93f2d3b25447789c608dbf
> > > 285e823%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638370429169364269%7C
> > > Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
> > > LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=zGt9Zsk6AYZ3zwOTU6l0zmN3KF1rGqOTAe3XR
> > > hxPWaA%3D&reserved=0.
> > > > > com%2F&data=05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cb699f48656d34a9
> > > > > 23a640
> > > > > 8dbf28104af%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63837040817
> > > > > 604431
> > > > > 5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> > > > > I6Ik1h
> > > > > aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=E9tDi08sBRoh4tBccQB%2B8az%2
> > > > > BqQ4%2
> > > > > FtQOpFjdPgU8zQXc%3D&reserved=0
> > > 
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> > > engineering
> > > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.
> > > com%2F&data=05%7C01%7Cbiju.das.jz%40bp.renesas.com%7C72e93f2d3b25447789c60
> > > 8dbf285e823%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63837042916952053
> > > 1%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> > > aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=WULSktePlojGqVPbQJ%2BDelJnQEOUIh%
> > > 2BaSJm2Ra4OsRI%3D&reserved=0
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

