Return-Path: <linux-rtc+bounces-6544-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKCqEipEC2qsFAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6544-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 18:54:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8427A5713D9
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 18:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6866F3045DD2
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2026 16:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3F748C3E9;
	Mon, 18 May 2026 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyujC3+N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213648C3EE;
	Mon, 18 May 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122949; cv=none; b=Vruy3qLYo9Qm0dyE+KLwgMKcsuZD7kw+cCTDfdNJOmFDdC4LhbBHeklvC6zSLUUUwIHq6E/rQMSovLDkPufvkvhcDbvuSyQaN65/rO6MrZdYFhxKc0Cxn6vMK6y29hyRYNt2Jkv54StVyQ3ufp65v2fFWm4eZBdLiylrnZDimyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122949; c=relaxed/simple;
	bh=zc4shDdIDKEM495ywc+RfCGBRoKJfYNcgDvXFgNvkgI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tPKYn3N7sBMP4MPff8+grlicZ9M9D6MoCHolYgkYR+xQVCKqcaCWN3EdS5QD43ZdVDaDkidUX5yHroy0Ol6QiXX+XYFx1LIRkldEvPS4AAnmljiAMcUoK+rSBdagC2eDMZOI6h7urvpy3eaYaHSS8q9tgeKHXsgtF/IWRA92grU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyujC3+N; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122949; x=1810658949;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zc4shDdIDKEM495ywc+RfCGBRoKJfYNcgDvXFgNvkgI=;
  b=EyujC3+NT9vTwp0nXB9BF8EcxlP5hLKpuZbm6JIWPVMN3Qryxk19b5jw
   VtwwcCfDUrI6FvZrrjMVFyeO3Jqko1TzPzdNo3m4g+w2bkRHhqJuCe37Z
   eUuaioJTeYmyVv7ulhmmddyee40+EnCr0kdSEWdeEiKfH1abmFuY0WabK
   XMNxFqVGFZKVuve3omMOZeQhOLQXrDO2IvbJ3XBkIAtJMX23N5CPw9/8e
   Xv25T54K8dgmMPsavGo6cXTkF8dD2YPRe2eZHHCCMURJK7lh8KMH/1XBx
   2qlkObVRqbsr1WE4CFlWFzACohmaMwjI8RnD0z5J7VbVGENwVCpX/G4/j
   w==;
X-CSE-ConnectionGUID: XGmqEWT1RkS/YGmAoa7zSA==
X-CSE-MsgGUID: fTfZxxxiQHO6qbPKcR8UeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="82551337"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="82551337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:48:56 -0700
X-CSE-ConnectionGUID: dwsaMYPzSEyZxKjCA3m2vg==
X-CSE-MsgGUID: rl7K7FxNRVOuOKGNYdKQwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239345055"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.101])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:48:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 18 May 2026 19:48:49 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org, 
    Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] rtc: Add rtc_read_next_alarm() to read next expiring
 timer
In-Reply-To: <20260518133853.851027-2-mario.limonciello@amd.com>
Message-ID: <6be68c57-929b-ccf0-84a5-6f40c4c0c330@linux.intel.com>
References: <20260518133853.851027-1-mario.limonciello@amd.com> <20260518133853.851027-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6544-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,linutronix.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8427A5713D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026, Mario Limonciello wrote:

> Add a new function rtc_read_next_alarm() that reads the next expiring
> alarm from the RTC timerqueue. This is different from rtc_read_alarm(),
> which only reads the aie_timer.
> 
> The wakealarm sysfs file programs the rtc->aie_timer, whereas the
> alarmtimer suspend routine programs its own timer into the RTC timerqueue.
> Both timers end up in the RTC's timerqueue, and the first expiring timer
> is what gets armed in the hardware.
> 
> This new function allows code to query which alarm will actually fire
> next, regardless of which subsystem programmed it. This is needed by
> platform code that needs to program secondary timers based on the
> actual next wakeup time.
> 
> Link: https://lore.kernel.org/all/87ed50z0le.ffs@tglx
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/rtc/interface.c | 42 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/rtc.h     |  2 ++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 1906f4884a834..dfcb32e272eb9 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -384,6 +384,48 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  	return err;
>  }
>  
> +/**
> + * rtc_read_next_alarm - read the next expiring alarm
> + * @rtc: RTC device
> + * @alarm: storage for the alarm information
> + *
> + * Read the next expiring alarm from the RTC timerqueue. This returns
> + * the alarm that will actually fire next, which may be different from
> + * rtc_read_alarm() if multiple timers are queued (e.g., alarmtimer
> + * and wakealarm sysfs both active).
> + *
> + * Returns 0 on success, -ENOENT if no alarm is pending, or other error.

Missing :

> + */
> +int rtc_read_next_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
> +{
> +	struct timerqueue_node *next;
> +	int err;
> +
> +	if (!rtc || !alarm)
> +		return -EINVAL;
> +
> +	err = mutex_lock_interruptible(&rtc->ops_lock);
> +	if (err)
> +		return err;
> +
> +	next = timerqueue_getnext(&rtc->timerqueue);
> +	if (!next) {
> +		err = -ENOENT;
> +		goto unlock;
> +	}
> +
> +	memset(alarm, 0, sizeof(struct rtc_wkalrm));
> +	alarm->time = rtc_ktime_to_tm(next->expires);
> +	alarm->enabled = 1;
> +	alarm->pending = 0;

Doesn't the preceeding memset() already clear everything?

> +	err = 0;

Why is this needed?

> +
> +unlock:
> +	mutex_unlock(&rtc->ops_lock);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(rtc_read_next_alarm);
> +
>  int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  {
>  	int err;
> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> index 95da051fb155d..c09fc22819d0c 100644
> --- a/include/linux/rtc.h
> +++ b/include/linux/rtc.h
> @@ -190,6 +190,8 @@ extern int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm);
>  int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm);
>  extern int rtc_read_alarm(struct rtc_device *rtc,
>  			struct rtc_wkalrm *alrm);
> +extern int rtc_read_next_alarm(struct rtc_device *rtc,
> +			       struct rtc_wkalrm *alrm);
>  extern int rtc_set_alarm(struct rtc_device *rtc,
>  				struct rtc_wkalrm *alrm);
>  extern int rtc_initialize_alarm(struct rtc_device *rtc,
> 

-- 
 i.


