Return-Path: <linux-rtc+bounces-6736-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vao5N3n5O2qLhAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6736-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 17:36:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14E6BFB3B
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 17:36:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=KRmRG+ki;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6736-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6736-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8C09301318E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 15:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E943B38A9;
	Wed, 24 Jun 2026 15:31:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E44D306775
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 15:31:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315091; cv=none; b=jBUFSG2x4wHIN4EiT8k9ZQeCljKOdt5PhHpbnhwLFaZgsYPaE15cASEYj0pXdl378zl2PZchCpz8tg+s0kTH/7VU/cVZlvMEpBvHm8cq5+diACnL3WPCQui+07jMwnvVqWbWyPXRV48fYm8fuSVFOpnwARPDvipODK1jDX8BpCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315091; c=relaxed/simple;
	bh=eW4k1pHqCpwpwM6gJNc84+hMnN4l2AHPh7s8jn+3aoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzRa6dlfUpQg5Ka5LevWrFTdTfHD5IB/ZRQrSfs39bdYnNURZ2j1cTwYVrLzZANZf4CuIFpjtBbcyPA0wSVALKpk98tbwzaAuab8wYDETYqlft5Sxvc85ral9zFVGEBIVhYDXs6wIeG66APigZHm5oY5Cme8zMIz/ViETM7ORPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KRmRG+ki; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB56C4E407BD
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 15:31:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94144601C5;
	Wed, 24 Jun 2026 15:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA883106C8382;
	Wed, 24 Jun 2026 17:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782315085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zsZ+QNghO95DV5PBXvkCYl8L9YJ7ykhtAVrAXUbsUBc=;
	b=KRmRG+kiaWBztDPyEI86236Z+X/IYUMPxzHhRWetsAhxVkpXF3GwbexuaD60/Ce6irKiE1
	dfBXQePieoEN4+lL/7I5S6iwa71GOuS+1U0HBDtZ9oXl3P/J5INSfCeqCL3L6avCagVEWB
	oejh5jqNpIQz5pX6xtimUof405Sp7PbAHw9zG+6NFZNRvdiPpyE1+Gq/PNkWTwkxrpC3em
	mcaC6PpQh+ou+xzNP2TkLMsBO8U62bHt9vYoo639U73RHwcfNmffl4MwCJmF9LKV0tzGBk
	CNXps58lA6NBRzGyHxpxcghzJ/ht+YKT/8V8hOBV/Q4GqljJWgtr/swGLpCOiA==
Date: Wed, 24 Jun 2026 17:31:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Elad Nachman <enachman@marvell.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: rtc: handle OTF clock changes
Message-ID: <20260624153123af6b28e3@mail.local>
References: <20260624123103.3523728-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624123103.3523728-1-enachman@marvell.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6736-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enachman@marvell.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,marvell.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC14E6BFB3B

On 24/06/2026 15:31:03+0300, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> When processing expired RTC events and rearming them, use now
> instead of expiry to prevent endless loops.
> Issue seen with Armada 385 SOC.

The loop is not endless, it may be long however. How do you reproduce
this? Or maybe the question is what is enabling PIE on your system?

Your patch breaks existing code because it will expect to get one event
per elapsed period while your patch will cause events to be skipped.

> 
> Fixes commit 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events")
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---
>  drivers/rtc/interface.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 96626f8068f9..c32ef95a07d4 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -126,6 +126,7 @@ EXPORT_SYMBOL_GPL(rtc_read_time);
>  int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>  {
>  	int err, uie;
> +	struct rtc_time new_tm;
>  
>  	err = rtc_valid_tm(tm);
>  	if (err != 0)
> @@ -159,6 +160,17 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>  	else
>  		err = -EINVAL;
>  
> +	if (rtc && rtc->ops && rtc->ops->read_time) {
> +		if (!rtc->ops->read_time(rtc->dev.parent, &new_tm)) {
> +			pr_debug("new rtc time secs %d mins %d hours %d mday %d mon %d year %d way %d yday %d dst %d\n",
> +					new_tm.tm_sec, new_tm.tm_min,
> +					new_tm.tm_hour, new_tm.tm_mday,
> +					new_tm.tm_mon, new_tm.tm_year,
> +					new_tm.tm_wday, new_tm.tm_yday,
> +					new_tm.tm_isdst);
> +		}
> +	}
> +


This is unrelated to the patch.

>  	pm_stay_awake(rtc->dev.parent);
>  	mutex_unlock(&rtc->ops_lock);
>  	/* A timer might have just expired */
> @@ -999,7 +1011,7 @@ void rtc_timer_do_work(struct work_struct *work)
>  		trace_rtc_timer_fired(timer);
>  		/* Re-add/fwd periodic timers */
>  		if (ktime_to_ns(timer->period)) {
> -			timer->node.expires = ktime_add(timer->node.expires,
> +			timer->node.expires = ktime_add(now,
>  							timer->period);
>  			timer->enabled = 1;
>  			timerqueue_add(&rtc->timerqueue, &timer->node);
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

