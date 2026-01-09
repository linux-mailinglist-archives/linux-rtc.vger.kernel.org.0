Return-Path: <linux-rtc+bounces-5722-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A42D0B8EA
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 18:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C955301A306
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 17:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ED2365A07;
	Fri,  9 Jan 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeazqGNL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSgb6EGe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC283659F9
	for <linux-rtc@vger.kernel.org>; Fri,  9 Jan 2026 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978881; cv=none; b=Mpgqdtcv08145SMCSnSej3GEzxryn/2NkGVF/RufMI02zVIruWWiYYhPfUkQKfmO6/K2Bbvv1VvNNi5jGGnNco0jf/DHviCqo016bXf2rkvSrvjaWXRxyCb1lhfPfW42uQiXynJ54SbyLsjYtF1uA1BQGHrSOs+bp5xfwFqM2+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978881; c=relaxed/simple;
	bh=F7zcGk8nCH165bG+Lq3YX1vuc4Qm0989LRhZOuxR4Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diI8/NK0jyLhe5HLktmrd9Kr70xMGeRsUONAA1j0gCabAZjNVdFqzHJI4FuZkFn2TkhrQ0G6YXzOv7JjuB3UAgCKjVg6PSwTXvlbVhkRLbhW127JDLsENZQ4YHcd2/ZE/5GZi8mqkuYw71A0W98otPbizYHUZDdt8TUfeR76PjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeazqGNL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSgb6EGe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767978878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
	b=AeazqGNLs6R9hsYax8J58O6snCHIdtbsEJk1z0dRPN475Xe1WGO5ZUHkINc8KhEaLBK+GW
	TDBBTRf86svvG2oqDSYgJeBd7jZNiKFwXp8VfHcOH/s3jbk+UCrZChaqWNH+Hr92yvuCpe
	SCu7SptAfa3McqUjlMhzI9DIFue76iw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-5nQ7EYupO164f5jTA2vuYg-1; Fri, 09 Jan 2026 12:14:37 -0500
X-MC-Unique: 5nQ7EYupO164f5jTA2vuYg-1
X-Mimecast-MFC-AGG-ID: 5nQ7EYupO164f5jTA2vuYg_1767978876
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb0ae16a63so515578385a.3
        for <linux-rtc@vger.kernel.org>; Fri, 09 Jan 2026 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767978876; x=1768583676; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=MSgb6EGeh8JT3IbLKfH4m6CAu+Js0nnr3SoBBcPnaQU8c1LnlqRh1dGBm9UK3849GL
         2F7fHF6f+YV5RlJvlmFgwUQN2M+IU2WfowHmtq1jXIXe8uuq9sEdgcYeVofDRiGmqM3U
         SrvQ204jUXmCTbbJxynwSK4pTs947d9OH2xnBOqvA1dOz19pG2opZc2dPapF3Okos/lE
         LrXpNVOnOFrkUlSgyTrFHN/Zbm/Jg2uNz1iyOVmaEOuorO2ViVR2J3IeGdOVbAHu9chp
         OwBqDmZ3LcTj/kYzGtSXQ0PDWqpHXJMTnce1o0WPxR4UY+C2dncvyGK61g1s3Ceb5Qgt
         UM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978876; x=1768583676;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=YEtQgErjihk/V7eMXMqjl7NmUydXBLy39IMUl18tSyEoeWdkr7A/b0BgrGuRck1QbK
         V4WHUR6DjvQ//m9GMrbEQA9fMnJKJ7R+hlOl4dZ1hB1ikllIYpbLa8l0jFt35Vi/kxoN
         lrpH+NaQyamOHZ4JOD4e7IFPMg5lvMYtvpgK0OEXx3uCFNG401xMv6vrba3Dsa9Qghyw
         F1CjzPHvo+2uWrTwvdQ0mEu3JNIIK6bFIf2ccXjhaFEvFQG6GqPF37IsMzqB6i579IUd
         FZFdvDN3jpsqepHVAwnA1Na6virLIBehG5ibN4+U4C4ApiPzfEVZtZYy54DF3e4jncTh
         yzXA==
X-Forwarded-Encrypted: i=1; AJvYcCWIih8xColkTalKc5xn5nyHrbgZRFvmZ1xGagFc0BaZbHbgV2S6SSxArTlW59Lmr7xzjT9dhRTKtNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13x8ihofC6vLYgZLQkP8pS/BF7eB/lmgIJey0FU2BGpa2ipO+
	8GpI8Xw74n/BNoWJuvwtxVZYKXDGFkg36VjYYd7egSh1jy/V8GUWaNurkmW76c4r+grRBObU0T+
	U3zOHGLnwayN5145DTKHQZ8UOSRGuhc4zhqJ4Y8WW14S6mA39WClEPvtO8K8FmQ==
X-Gm-Gg: AY/fxX4EBpAmeeV0COk64qd1OFj6y1OfT3eHV6+lB1yhHlOP1ZVaLwe36GpKXK6UqZR
	b8CKuWFYKTF8OaS6FkGWw8JqCVzTKY0KRPBJZFp76LotPFR3WwiX7Ou6gKBta0LKHz89qmO7JrB
	B8THRM1eASZ8uif6EK6AR80WHy4HWL3RZVlP672mROQg+F9NEHx/IKPOAZ1sVbBXBdhQ1eZa1B4
	yU7fwb52DHdRnm0Gr5gSxbKHWbrg1vQyJiCElvCLpc5adRa94wXFiY9+lJ4+mVlJ8U3qJ3q/AG+
	fAPJy96QX1eP2REXwdIA9eSn096eDOfBxX0parRVt+YsOz/pE2o6/gNLAyQQLXZ9DUxjOcRKQx8
	5qfVvFFATS45PbayBoFUXYBS3BDuVIrw+7DUmBylL7rWw
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217151985a.79.1767978876350;
        Fri, 09 Jan 2026 09:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHotayWWfWtWeRCvw1eejr8Fm0argOz9TlIuQkrGTqEF91Uo7p3dq/qiwtr88DHNoO1lgXL4w==
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217146085a.79.1767978875890;
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726041fsm82384206d6.45.2026.01.09.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Date: Fri, 9 Jan 2026 12:14:33 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/13] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aWE3eWL_8U33TcsT@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 11:41:13AM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers.
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.

I didn't CC everyone on patch 1 to this series that copes pic32.h from
the MIPS ASM directory to linux/platform_data/pic32.h. It's available at
the following location if you want to see it:

https://lore.kernel.org/linux-mips/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com/T/#m1e0e50adfe2ea4bf430025660fada7b1468d0fbf

Patch 12 of this series is where I remove the asm variant of pic32.h.

Brian


