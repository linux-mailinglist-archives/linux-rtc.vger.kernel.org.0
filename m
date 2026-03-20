Return-Path: <linux-rtc+bounces-6237-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKOIs2LvWnY+wIAu9opvQ
	(envelope-from <linux-rtc+bounces-6237-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:02:53 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC72DF17B
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33BB0306C447
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 18:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226742FE56F;
	Fri, 20 Mar 2026 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jDF0NZw1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF9314A90;
	Fri, 20 Mar 2026 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029637; cv=none; b=B9rhd2GmA4oTKfRHaCxoG16+WJjZ/ajpNal5678GXQDfOqWHnExG6/uFTPdH5MSmrYhoIyEmcrnuFAX0sUAH+jfqnJ/wAtTcLHieN2E41xS9aPbg66oU02xF9HFaWJKwxj1OoYGjIEAw3VT8TGeYdnk15APmxeBa3sgfc0mNtGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029637; c=relaxed/simple;
	bh=HIVoQlj9KpYJ3C0KRN9+5eD4qih2mvw/55hD5RN9yxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGfnSjzFXN6KZxZo/XsnPtAfdrqHsOL6zcGNfNHhIsSYhWj3SsRChsPOobwBJhyS2mrCqANB06cyEOhOuU/O0ySHG1LXDvt33tH4g5xq7eR07yEafoI8+hGRTsixBZzIThRyAOw2LngBSxJqDlBDY3nm7XvQK7l/x/BqGvKhHK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jDF0NZw1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98E3DC5668E;
	Fri, 20 Mar 2026 18:00:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9CCB600E0;
	Fri, 20 Mar 2026 18:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC17D10450CCC;
	Fri, 20 Mar 2026 19:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774029632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tYOfk6sqQBVrfLLkxN9Cd3/KpR4PdhsCi629D2S8ZXw=;
	b=jDF0NZw1+WG5YzXw1Ridg2T8D35zgk+jjncCFCiigDbxET/oLjlaLnZPp9vkW5rWxF2M7w
	iSHlZSoqKa9GWO5TojJCTziVuVhIOhe54OST51ImQGuZ+Jdvi0HwS1Oixz5Qu/ZPJDpoHJ
	ubXwbPkBVNmwRg2WMvzZY+UBialROnBDxsBtOJ/gNvBoDn0NOHKukfQD8ExkD7UGJbRjbt
	eESHEMvGp91qgYC7+WaT1mXC9N306IJJrTsZPUPF3FaK15DCHSCUyLxAD8H9RBEGqZXfrD
	QC3b6S6gTkap3mOWJJdFeZ8xKnEMAGg3uQz4+KoyvW41/ANeZ1nDiSJ5STvkEQ==
Date: Fri, 20 Mar 2026 19:00:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v1 2/2] rtc: cmos: Do not require IRQ if ACPI alarm is
 used
Message-ID: <20260320180031928c3da5@mail.local>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
 <6168746.MhkbZ0Pkbq@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6168746.MhkbZ0Pkbq@rafael.j.wysocki>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6237-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 01FC72DF17B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/03/2026 13:12:44+0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> If the ACPI RTC fixed event is used, a dedicated IRQ is not required
> for the CMOS RTC alarm to work, so allow the driver to use the alarm
> without a valid IRQ in that case.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-cmos.c |   15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -216,6 +216,11 @@ static inline void cmos_write_bank2(unsi
>  
>  /*----------------------------------------------------------------*/
>  
> +static bool cmos_no_alarm(struct cmos_rtc *cmos)
> +{
> +	return !is_valid_irq(cmos->irq) && !cmos_use_acpi_alarm();
> +}
> +
>  static int cmos_read_time(struct device *dev, struct rtc_time *t)
>  {
>  	int ret;
> @@ -287,7 +292,7 @@ static int cmos_read_alarm(struct device
>  	};
>  
>  	/* This not only a rtc_op, but also called directly */
> -	if (!is_valid_irq(cmos->irq))
> +	if (cmos_no_alarm(cmos))
>  		return -ETIMEDOUT;
>  
>  	/* Basic alarms only support hour, minute, and seconds fields.
> @@ -520,7 +525,7 @@ static int cmos_set_alarm(struct device
>  	int ret;
>  
>  	/* This not only a rtc_op, but also called directly */
> -	if (!is_valid_irq(cmos->irq))
> +	if (cmos_no_alarm(cmos))
>  		return -EIO;
>  
>  	ret = cmos_validate_alarm(dev, t);
> @@ -1096,7 +1101,7 @@ cmos_do_probe(struct device *dev, struct
>  			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
>  			goto cleanup1;
>  		}
> -	} else {
> +	} else if (!cmos_use_acpi_alarm()) {
>  		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
>  	}
>  
> @@ -1121,7 +1126,7 @@ cmos_do_probe(struct device *dev, struct
>  		acpi_rtc_event_setup(dev);
>  
>  	dev_info(dev, "%s%s, %d bytes nvram%s\n",
> -		 !is_valid_irq(rtc_irq) ? "no alarms" :
> +		 cmos_no_alarm(&cmos_rtc) ? "no alarms" :
>  		 cmos_rtc.mon_alrm ? "alarms up to one year" :
>  		 cmos_rtc.day_alrm ? "alarms up to one month" :
>  		 "alarms up to one day",
> @@ -1147,7 +1152,7 @@ cleanup0:
>  static void cmos_do_shutdown(int rtc_irq)
>  {
>  	spin_lock_irq(&rtc_lock);
> -	if (is_valid_irq(rtc_irq))
> +	if (!cmos_no_alarm(&cmos_rtc))
>  		cmos_irq_disable(&cmos_rtc, RTC_IRQMASK);
>  	spin_unlock_irq(&rtc_lock);
>  }
> 
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

