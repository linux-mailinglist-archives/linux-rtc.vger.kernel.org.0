Return-Path: <linux-rtc+bounces-57-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6257BE401
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 17:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA22C281A02
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 15:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9600B358B8;
	Mon,  9 Oct 2023 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JU3tQGuQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vB+2vuvf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B051358A6
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 15:10:47 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC9B9;
	Mon,  9 Oct 2023 08:10:44 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1696864243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0IIT5e387FjfUBxcrj9ow3NJK2NrhYCI/REalyWvrvU=;
	b=JU3tQGuQGNPH+u+QkYonsh0RE2l47ZVH2KZwsvViIveWdK1hXXUip+VLVFmTQQymRipLU7
	JcyuFWLI7jpwOEA+KCB0UJdwPKu0pCspdWZ44P/QGp7MDdUhBBvXU9uNqRYA+66FFD/z/Y
	jMLQwW7hbJQB1R72kd42EasOpQgLHYxW1p0oDWd/NX8hsELrnXiRfQi0d/t2nN4+RxqzrL
	E+SMhk5Wrr3K8PcqBzFHimSJM/ScwtTcxlSD99vDPGdj0JQDnP9gYY4LdF9DwzBk6HNN7T
	t1aZIihsx3N7OTrbAY4pSIcUHud35+QjnN0zlaXfbqNUCAhhoeLjDQlACSmdoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1696864243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0IIT5e387FjfUBxcrj9ow3NJK2NrhYCI/REalyWvrvU=;
	b=vB+2vuvfv6z4lWTnbvOgqapNbgiowWnM1SdEataFOKk80RFSog1XPjfoXQiPo3vT0XX4Nv
	wjCSxrWps0dOd1Bw==
To: Biju Das <biju.das.jz@bp.renesas.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das
 <biju.das.au@gmail.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] alarmtimer: Fix rebind failure
In-Reply-To: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
Date: Mon, 09 Oct 2023 17:10:42 +0200
Message-ID: <87il7fq1al.ffs@tglx>
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

On Fri, Sep 22 2023 at 09:12, Biju Das wrote:
> +static void alarmtimer_rtc_remove_device(struct device *dev)
> +{
> +	struct rtc_device *rtc = to_rtc_device(dev);
> +
> +	if (rtcdev == rtc) {
> +		module_put(rtc->owner);
> +		if (device_may_wakeup(rtc->dev.parent))
> +			device_init_wakeup(&alarmtimer_pdev->dev, false);
> +
> +		platform_device_unregister(alarmtimer_pdev);
> +		put_device(dev);
> +		alarmtimer_pdev = NULL;
> +		rtcdev = NULL;
> +	}

That's broken versus alarmtimer_get_rtcdev() and any user of it.

Thanks,

        tglx





