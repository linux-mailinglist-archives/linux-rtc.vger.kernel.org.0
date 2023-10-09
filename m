Return-Path: <linux-rtc+bounces-75-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C217BEDF3
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 00:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53239281851
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 22:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D8C43698;
	Mon,  9 Oct 2023 22:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lycAmvKR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cy6tX36H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822442BF5
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 22:00:16 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15CB9F;
	Mon,  9 Oct 2023 15:00:14 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1696888812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmf/kzB+2aw/kt0IWABgG/NdeS+iXHJx8qCtuTlAbR8=;
	b=lycAmvKRMnB+ZpfWdOSV6rb9MSTwmhBF6tEYVR7ht2LhrRc6P/NUhhw1n2Qk35iPNU0JUP
	neNHtr/1YjYS1jn8CYlpE1D2hlB/kc9bxUZCaHmlKlRt2dVU/uz1MQkNa/369nA1b62Prf
	AzHx7Uxiq4j2MhEmqyfMXSECAJErukcp4+u7lv+9zIizFb2tc3VUL+AtFH1hxA+Q1rt2sZ
	+FBlDNnDqtCo70KJ3WI7L8145qUL2F6dAUPFh3uFdkVhcHLjrx0lh9+Q8F36+Ld3mqcMuA
	Z8i7b/i5MJ+3E+/vuua4kMJfsKALekdJtoH6rDU41++BOE2otjOjKjooNkzK4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1696888812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hmf/kzB+2aw/kt0IWABgG/NdeS+iXHJx8qCtuTlAbR8=;
	b=cy6tX36HTqjQxVe+C9e5sS0YK58Clw+HjT/rvGI6c3c1cT4p8GlFyblgIXi4SNjNV5t3a8
	KTWdcE7sYex30uAg==
To: Biju Das <biju.das.jz@bp.renesas.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] alarmtimer: Fix rebind failure
In-Reply-To: <TYCPR01MB11269C6BF3934F9AAC44F855186CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
 <87il7fq1al.ffs@tglx>
 <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87fs2jpznr.ffs@tglx>
 <TYCPR01MB11269C6BF3934F9AAC44F855186CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Date: Tue, 10 Oct 2023 00:00:12 +0200
Message-ID: <87bkd7pic3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09 2023 at 17:02, Biju Das wrote:
>> On Mon, Oct 09 2023 at 15:30, Biju Das wrote:
>> > You mean we should update[1] (charger-manager driver)as it is the one
>> > using alarmtimer_get_rtcdev()??
>> 
>> # git grep -c alarmtimer_get_rtcdev
>> drivers/power/supply/charger-manager.c:1
>> include/linux/alarmtimer.h:2
>> kernel/time/alarmtimer.c:10
>
> kernel/time/alarmtimer.c has alarmtimer_get_rtcdev()check everywhere,
> that is missing in charger-manager.c. I will add the same, is it ok?

The code does in the init function:

      if (alarmtimer_get_rtcdev()) {
         ....
      }

IOW, charger-manager.c expects that alarm is working when
alarmtimer_get_rtcdev() returns non NULL at init. So ripping the RTC
device out under it is going to result in a disfunctional driver. I'm
not convinced that you can fix this by sprinkling a ton of checks around
the code.

But that's not the worst of it. The alarmtimer infrastructure is
generally not designed for device/module removal. Why?

The posix timer interface is fundamentally expecting that an armed alarm
timer is actually functional. The fact that the class interface does not
have a remove_dev callback is not an oversight and holding a reference
on the module and a reference on the device is intended to ensure that
the device cannot vanish.

The changelog lacks any form of explanation why this is required and how
removal of the registered RTC device is actually possible. Neither does
it provide any analysis why this cannot result in malfunction.

Thanks,

        tglx












