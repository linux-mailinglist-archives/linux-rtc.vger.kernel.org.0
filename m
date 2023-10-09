Return-Path: <linux-rtc+bounces-59-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1B7BE548
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 17:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C6D1C208E9
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 15:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71DA374D3;
	Mon,  9 Oct 2023 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4b1lzjes";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DrR9+n7C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B9347C3
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 15:46:08 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBEFA6;
	Mon,  9 Oct 2023 08:46:02 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1696866360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XH23ZMvqgrmaeRSjhLmgU15jQm5qtsIZN6JJfhQAze0=;
	b=4b1lzjesqSd+9oWwnDHeBz1GobWMhQ5zprubpgC55W1fswn45mIN6K8cR7ev20hWHGtx1D
	+ealOFOeu/GBFVfEI1M5ZxWjvitHYE/f24WMBm1qxP17mLKLwF5eDUaElyFhiKxJpgE536
	KTnotnqIvWfRu4BWqAYPiMyKFxg4epay4Gy3h4cpA9g3IzC1WjGNml+Bew+fMA/A8sqw7c
	Spa1HA3cy5E6ro3rddIQbkCV+bInrIGjotbn3NnTT5iU8MZ27kB6ifAqZCEPEdTIx4NFIB
	I8z8EVKmto/39MI7wFfC07CaYuBget53aD06jZnI13ltseNLRWq3jQHFjrKJSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1696866360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XH23ZMvqgrmaeRSjhLmgU15jQm5qtsIZN6JJfhQAze0=;
	b=DrR9+n7CvmlYXklFRDhT9Do4W7N6vo99qz5PEq6P3PFaAZU727vzOjm8ZbrnYyqbiVsYPt
	6gytuckpAXk54dAA==
To: Biju Das <biju.das.jz@bp.renesas.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Douglas
 Anderson <dianders@chromium.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] alarmtimer: Fix rebind failure
In-Reply-To: <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
 <87il7fq1al.ffs@tglx>
 <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Date: Mon, 09 Oct 2023 17:46:00 +0200
Message-ID: <87fs2jpznr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09 2023 at 15:30, Biju Das wrote:
>> Subject: Re: [PATCH v2] alarmtimer: Fix rebind failure
>> 
>> On Fri, Sep 22 2023 at 09:12, Biju Das wrote:
>> > +static void alarmtimer_rtc_remove_device(struct device *dev) {
>> > +	struct rtc_device *rtc = to_rtc_device(dev);
>> > +
>> > +	if (rtcdev == rtc) {
>> > +		module_put(rtc->owner);
>> > +		if (device_may_wakeup(rtc->dev.parent))
>> > +			device_init_wakeup(&alarmtimer_pdev->dev, false);
>> > +
>> > +		platform_device_unregister(alarmtimer_pdev);
>> > +		put_device(dev);
>> > +		alarmtimer_pdev = NULL;
>> > +		rtcdev = NULL;
>> > +	}
>> 
>> That's broken versus alarmtimer_get_rtcdev() and any user of it.
>
> You mean we should update[1] (charger-manager driver)as it is the one
> using alarmtimer_get_rtcdev()??

# git grep -c alarmtimer_get_rtcdev
drivers/power/supply/charger-manager.c:1
include/linux/alarmtimer.h:2
kernel/time/alarmtimer.c:10

Thanks,

        tglx

