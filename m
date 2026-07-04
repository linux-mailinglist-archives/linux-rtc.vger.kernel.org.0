Return-Path: <linux-rtc+bounces-6896-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i1DtMJaFSWrW2gAAu9opvQ
	(envelope-from <linux-rtc+bounces-6896-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Jul 2026 00:13:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7807088AF
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Jul 2026 00:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="y/BWodPJ";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6896-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6896-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 210513012338
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Jul 2026 22:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C912383985;
	Sat,  4 Jul 2026 22:13:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EB3822BF
	for <linux-rtc@vger.kernel.org>; Sat,  4 Jul 2026 22:13:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783203219; cv=none; b=ayncQQP5tSSX5F8flg+vVdp+KgeJe7PBZ55zMHR7jimDijDmwanrqd01MLTsygf7u+t3MuxAw2vtutFPm6RN9udqDNeGpe+HMDuR8yWzCuVfL8APAYza6z/hOU99HokoqVDBjh91z+SW8GlPqRiu4u423048xU2Dh7RoyMu0UvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783203219; c=relaxed/simple;
	bh=Iut4eLwZNAS6RcQN06Yx858N6CXIbND5xYBWsPoJebs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ28A3PeWmzrOA0Cx1gpjs6egFnkEr5a5FggtEmua5I+MRPsFfKRvmLN0paLU7v5BmvYE23t6foPK7lHGWaMSBTUO9EYSSUOAbB9U+5aNM3XEgVby+Vj/mvzxIA2v7oZEBpnwbGhb0kMPHoJiSmeKBRJX5sI4LtWH04RzAlyoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y/BWodPJ; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2629CC49F79;
	Sat,  4 Jul 2026 22:13:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE05560337;
	Sat,  4 Jul 2026 22:13:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C56911BB91CF;
	Sun,  5 Jul 2026 00:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783203208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VSk99bNQi38fWFcd6rV95Svr9FLCDy5LtrAIjtlV66c=;
	b=y/BWodPJhhMktEJZCT3METSf75vFR1cumI6bWUNXVK3JEt7DJbO3F8nf/AMNyb1b8TBAhk
	rW4IdT83u7re/DB7LAmOtLo16G9dCoN9haa7dyUhI4nxrA1OvGtbb4TWJda4xP3iDB/yIw
	Mi+xJB6RlhE7g5mvnarcYPwpp+ulsLqsTyToj7SDJlec3vKE7MJEYduoXJX/JfmPl/JReN
	ny6FwKOZcjZwm4n/qoIT7/vQ/p3WerKYQyZTaNwvnIbJ1ctVvkYtOa4nD4LJUQ98EmO4Eq
	FAlo2TNIhjRY5/5xA5p5n2HOnFQHIknOGWBMQUdD5OljIOYUo7JopDzHSu0SVA==
Date: Sun, 5 Jul 2026 00:13:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: armada38x: do not advertise update interrupt (UIE)
 support
Message-ID: <20260704221324adb6d962@mail.local>
References: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704210710.658574-1-ioannis.fountzoulas@nokia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6896-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ioannis.fountzoulas@nokia.com,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:url,bootlin.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B7807088AF

On 04/07/2026 17:07:10-0400, Ioannis Fountzoulas wrote:
> Problem:
> chrony enables RTC update interrupts via the RTC_UIE_ON ioctl to track
> RTC drift. On the armada38x driver this request is served by the RTC
> core's native path, which arms a 1 second periodic timer that is
> re-programmed on the alarm and serviced by rtc_timer_do_work().
> If the RTC time is then stepped forward by a large amount while this
> timer is active, its scheduled expiry ends up far in the past compared
> to the freshly read time.
> 
> Why the CPU hangs:
> When rtc_timer_do_work() runs, it expires every timer whose expiry is
> not in the future, advancing periodic timers by one period each pass:
> 	while ((next = timerqueue_getnext(&rtc->timerqueue))) {
> 		if (next->expires > now)
> 			break;
> 		...
> 		timer->node.expires += timer->period;   /* += 1s */
> 		timerqueue_add(&rtc->timerqueue, &timer->node);
> 	}
> With a large forward step (seen when the RTC starts far in the past and
> chrony corrects it after the first NTP sync), the periodic UIE timer is
> overdue by the size of the jump, so this loop must run one iteration per
> elapsed second before it can exit.

This is not correct because the core ensures that UIE is disable before
changing the RTC time and enables it afterwards so the jump doesn't have
any impact on UIE. So what you need to explain is why UIE is not synced
with the RTC time after it has been set. My guess is RES-3124064 is the
culprit.

> It never yields in that time, so the workqueue worker pins the CPU and
> the watchdog reports a soft lockup / RCU stall, after which the
> board reboots:
> 	watchdog: BUG: soft lockup - CPU#1 stuck for 48s! [kworker/1:3:432]
> 	Kernel panic - not syncing: softlockup: hung tasks
> 	Workqueue: events rtc_timer_do_work
> 	 rtc_handle_legacy_irq from rtc_timer_do_work
> 	 rtc_timer_do_work from process_one_work
> 	 process_one_work from worker_thread
> 
> Fix:
> Clear RTC_FEATURE_UPDATE_INTERRUPT at probe time so the driver stops
> advertising native UIE. RTC_UIE_ON is then served by the poll-based UIE
> emulation in rtc-dev (CONFIG_RTC_INTF_DEV_UIE_EMUL), which delivers the
> 1 Hz update notifications chrony needs without ever queuing the runaway
> periodic timer.
> 
> Testing:
> Tested on a Marvell Armada 38x board (ARM Cortex-A9). Before the change,
> stepping the clock forward while UIE was enabled reproduced the soft
> lockup (about 1 in 4 boots). After the change, rtc_timer_do_work() runs
> zero loop iterations and returns immediately, chrony still receives
> update interrupts via emulation, and no lockups occur over repeated
> reboot cycles.
> 
> Signed-off-by: Ioannis Fountzoulas <ioannis.fountzoulas@nokia.com>
> ---
>  drivers/rtc/rtc-armada38x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 245290ae1a8d..da036d819649 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -526,6 +526,14 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
>  	else
>  		clear_bit(RTC_FEATURE_ALARM, rtc->rtc_dev->features);
>  
> +	/*
> +	 * A large forward step of the RTC time makes
> +	 * rtc_timer_do_work() replay one period per elapsed second and can
> +	 * loop long enough to trigger a soft lockup. Do not advertise
> +	 * native UIE; RTC_UIE_ON then uses the poll-based emulation.
> +	 */
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
> +
>  	/* Update RTC-MBUS bridge timing parameters */
>  	rtc->data->update_mbus_timing(rtc);
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

