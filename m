Return-Path: <linux-rtc+bounces-6236-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MG2MpWMvWnY+wIAu9opvQ
	(envelope-from <linux-rtc+bounces-6236-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:06:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 304412DF264
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33CF30E40BD
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739003DE430;
	Fri, 20 Mar 2026 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OhXhtwfO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACF3DD534;
	Fri, 20 Mar 2026 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029626; cv=none; b=WBHU2mDGWrsHjSrQeWGkhf0AjR310H0oPRqX3HcmvM65DZzYg117VGXCGwNIEg+oPegTZus6zWfGNAaBony2UOjR9VL6BgnNBjyhn3Slr+Gp8LxKY4uOjgIyPp0u4nPRBAZZWXytwuMNrH2JKjc2N24ff0XGIdIGHwQ46BfCDNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029626; c=relaxed/simple;
	bh=eHPMls9k77SaCdcbx62TBPlkKhNDUB0exULGg4L0imI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzGfx1zikl5oqZvVdoV2CK5QXPJ+ZuvDE7hpj4Nfxr6RUGXt0gOwgaIwSCdpH/6Ir/YdTeydY6/08hhQI7XuQbwZT9JZ5Yr3+9CNmt1G9TJc8N1Pm/IGB0bxrc8Eiq13l825xLxXnP0k2OpD4yREjjaCaPPP9lSmcWRAUigOEEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OhXhtwfO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 528C71A2F20;
	Fri, 20 Mar 2026 18:00:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22137600E0;
	Fri, 20 Mar 2026 18:00:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A0E410450CD0;
	Fri, 20 Mar 2026 19:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774029620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0j3vCFqC7As9ayMr/CMjyps+yruCSN8oat2nQqzmOSQ=;
	b=OhXhtwfOJcaXGcIf5YS35w1RLi2385nDXma8UawWLSXTfEwoS62UFpay32tege5NHfcdau
	9d8S7SLytidrfuEPhb2RcKEOSjeNH4ZFStJP9EXaEsktBz2taVCG4WuhhQIpHXv+iwTD6O
	XNATUVEzlmn7L1ooqdve3+opRxrqaKI4z0EN4JFr47Y2sRnpPejVb/Lg7U1Spp1VbYucFy
	B0a5Lcbxn+6AStZCn/P/M3BIrvxPeh+Ed7nZHT8p8wY3+v3TaC3poR4hX96GqS6CGgOJ2k
	MxQlalww1WxHOzDvexsvwyw9qP58QPpj3wu1n55AEDXEt1NEChLcoKe9OElzvA==
Date: Fri, 20 Mar 2026 19:00:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v1 1/2] rtc: cmos: Enable ACPI alarm if advertised in
 ACPI FADT
Message-ID: <202603201800199ad8b0af@mail.local>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
 <9618535.CDJkKcVGEf@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9618535.CDJkKcVGEf@rafael.j.wysocki>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6236-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 304412DF264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/03/2026 13:11:20+0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> If the ACPI_FADT_FIXED_RTC flag is unset, the platform is declaring that
> it supports the ACPI RTC fixed event which should be used instead of a
> dedicated CMOS RTC IRQ.  However, the driver only enables it when
> is_hpet_enabled() returns true, which is questionable because there is
> no clear connection between enabled HPET and signaling wakeup via the
> ACPI RTC fixed event (for instance, the latter can be expected to work
> on systems that don't include a functional HPET).
> 
> Moreover, since use_hpet_alarm() returns false if use_acpi_alarm is set,
> the ACPI RTC fixed event is effectively used instead of the HPET alarm
> if the latter is functional, but there is no particular reason why it
> could not be used otherwise.
> 
> Accordingly, on x86 systems with ACPI, set use_acpi_alarm if
> ACPI_FADT_FIXED_RTC is unset without looking at whether or not HPET is
> enabled.
> 
> Also, do the ACPI FADT check in use_acpi_alarm_quirks() before the DMI
> BIOS year checks which are more expensive and it's better to skip them
> if ACPI_FADT_FIXED_RTC is set.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-cmos.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -817,6 +817,9 @@ static void rtc_wake_off(struct device *
>  #ifdef CONFIG_X86
>  static void use_acpi_alarm_quirks(void)
>  {
> +	if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
> +		return;
> +
>  	switch (boot_cpu_data.x86_vendor) {
>  	case X86_VENDOR_INTEL:
>  		if (dmi_get_bios_year() < 2015)
> @@ -830,8 +833,6 @@ static void use_acpi_alarm_quirks(void)
>  	default:
>  		return;
>  	}
> -	if (!is_hpet_enabled())
> -		return;
>  
>  	use_acpi_alarm = true;
>  }
> 
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

