Return-Path: <linux-rtc+bounces-6238-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKEOCk+fvWkM/wIAu9opvQ
	(envelope-from <linux-rtc+bounces-6238-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:26:07 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E592DFE10
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CCE03005A96
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FBD34CFB0;
	Fri, 20 Mar 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQ93vAmM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15117337BB5;
	Fri, 20 Mar 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034765; cv=none; b=foo6QD9I0tQT6lUjqX+4QpfiiRb7sPgnDqPBrx6XxeAs2JCwnIMROCexAdDN3tIpTdzftgIqAvO5JQjhiUiab62R8tPAsrihUQKwCYXCbxl2cvPisDXvEoWHStr9EyntL5fBDIy9rs8lSLINhnr/oaas31KldOHyMt3zSm6ESGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034765; c=relaxed/simple;
	bh=yJiC1Pk7ovdXcihEau1QX5m3zsXmCUdz8C38wiNB4cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfv/6BCJg8AS29X3Sp2UD+oOmhxuMxMQFSZi29y/O6b5kmMfIL8y9Kt+fOHcWTwLU1KaOgMdVraufasZgud0blMpIL6WiG6cp0Y4lQ0W54FJF7yhwNS9l3NYHQ/fgYXKFmQ56V1w5mnFJbp/EnkXTXwzy4AVGg2seJzZk6DgKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQ93vAmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A77DC4CEF7;
	Fri, 20 Mar 2026 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774034764;
	bh=yJiC1Pk7ovdXcihEau1QX5m3zsXmCUdz8C38wiNB4cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vQ93vAmMt6SS+0QmY3Q6b130RTuWW6iieav4WuMuniNMY3Zyw4AF9/s4UyRwnpXHB
	 E3I5b5U6yb6hLgNO9+DrrdL2TlK+UXqjp+FLn3om2gNJ18BTQlm+8ArVBagvWVLqMX
	 zzyF8DCrBP9pN4Wi9vlD1LV5zi/4ucDdbxKC/asvCK5Su/lM0TnMtFmpntUr4VlAb4
	 5johIFWc1g2Bodet6Ps4BAQwzb/qd6VJOBp3bXTdY5S85XDDuRemPbrY5OYvosckXQ
	 p0HB1ovkew4HhOk/xNijMCUvXS28xepsyFz+0vkjd6ajDERzR7Jq+phxP5AMbnZNzO
	 LxTSVyDL+AJgw==
Message-ID: <229724b9-e128-4c8e-8d7a-36926afb76d2@kernel.org>
Date: Fri, 20 Mar 2026 14:26:03 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] rtc: cmos: Enable ACPI alarm if advertised in ACPI
 FADT
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
 <9618535.CDJkKcVGEf@rafael.j.wysocki>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <9618535.CDJkKcVGEf@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6238-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3E592DFE10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 7:11 AM, Rafael J. Wysocki wrote:
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

This makes sense to me.

Sorry for my delay, I kept on meaning to check a few machines and then 
more things came up and it fell lower.

I did check 3 generations of AMD machines and I don't expect any 
problems from this change.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/rtc/rtc-cmos.c |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -817,6 +817,9 @@ static void rtc_wake_off(struct device *
>   #ifdef CONFIG_X86
>   static void use_acpi_alarm_quirks(void)
>   {
> +	if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
> +		return;
> +
>   	switch (boot_cpu_data.x86_vendor) {
>   	case X86_VENDOR_INTEL:
>   		if (dmi_get_bios_year() < 2015)
> @@ -830,8 +833,6 @@ static void use_acpi_alarm_quirks(void)
>   	default:
>   		return;
>   	}
> -	if (!is_hpet_enabled())
> -		return;
>   
>   	use_acpi_alarm = true;
>   }
> 
> 
> 


