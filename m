Return-Path: <linux-rtc+bounces-6239-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EuEMoyfvWkM/wIAu9opvQ
	(envelope-from <linux-rtc+bounces-6239-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:27:08 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6B2DFE2E
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B8D73009565
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876F534D917;
	Fri, 20 Mar 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAYjzkRO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6405934C802;
	Fri, 20 Mar 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034825; cv=none; b=ltH181ZZCwbTtEdkTeSZbfp0fIj+JEgjk84at3LteBSEqYB0lVgBQsDP2O4B6r8btrHt4hZ8Z3GnyIGsVx7vENfBxDSUC6BrEOSMUvXc8PeXjdkbKW+hzQtY9OfilID6ybzXmxlpq4OSn99NfjiLnVpAj4+TYC4IY5JAMiMnK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034825; c=relaxed/simple;
	bh=ObjSKVjIg30kfGJIUTqHlDkc2PcSIeC8wgxupXeAeWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3rX39b/EVgWV8pCEoRXh8sLRa7Y28zV3mjWXMr9+8xWzxhWq+KTLwl958Ll/1k6wHiuMq/YypUaOWj4y42olt3NXnuT8n5PJ5twNJrrFEcx4092QGZMsdTeEmIZ5fYerQJgK4LP1FRhmIqN28SDNv46c1ShQJiah677u8vjqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAYjzkRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E93FC4CEF7;
	Fri, 20 Mar 2026 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774034825;
	bh=ObjSKVjIg30kfGJIUTqHlDkc2PcSIeC8wgxupXeAeWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sAYjzkROregNLvgtNuZ5GCwLILI0JWQNXHDjt1fz8awbovZYk677qyX1XqPqLGDN6
	 ts7O7EU/7cNN4nHY5P2zDH3YqPXocU4ALNyASiuIDbaJ3wfBbLs0JodOIAyARW8vkH
	 jXs7D+CQPh8eRq8rO6znt/vuVXv5TDRBYqplIpxeTsGLcCwP7wYSXW39goumVQBK0A
	 gaz1CT4+kfB6jb5rNN8H/DodWXMkaB1WR+bSUQ43oFtHGolsm0O/9dJYvwdOHxUOPs
	 tb48vJjgE/13e0WTuqQLVKQEYOu5rbZ7ZTkr2F+7yvtS75uY/wUGVs8QMsdQBlrv0/
	 6+GruixMVWjeA==
Message-ID: <e1b5efa5-5062-4885-b01e-f3d5c6e1f4d0@kernel.org>
Date: Fri, 20 Mar 2026 14:27:03 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] rtc: cmos: Do not require IRQ if ACPI alarm is
 used
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
 <6168746.MhkbZ0Pkbq@rafael.j.wysocki> <20260320180031928c3da5@mail.local>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260320180031928c3da5@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6239-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 63E6B2DFE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 1:00 PM, Alexandre Belloni wrote:
> On 14/03/2026 13:12:44+0100, Rafael J. Wysocki wrote:
>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>
>> If the ACPI RTC fixed event is used, a dedicated IRQ is not required
>> for the CMOS RTC alarm to work, so allow the driver to use the alarm
>> without a valid IRQ in that case.
>>
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> 
>> ---
>>   drivers/rtc/rtc-cmos.c |   15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -216,6 +216,11 @@ static inline void cmos_write_bank2(unsi
>>   
>>   /*----------------------------------------------------------------*/
>>   
>> +static bool cmos_no_alarm(struct cmos_rtc *cmos)
>> +{
>> +	return !is_valid_irq(cmos->irq) && !cmos_use_acpi_alarm();
>> +}
>> +
>>   static int cmos_read_time(struct device *dev, struct rtc_time *t)
>>   {
>>   	int ret;
>> @@ -287,7 +292,7 @@ static int cmos_read_alarm(struct device
>>   	};
>>   
>>   	/* This not only a rtc_op, but also called directly */
>> -	if (!is_valid_irq(cmos->irq))
>> +	if (cmos_no_alarm(cmos))
>>   		return -ETIMEDOUT;
>>   
>>   	/* Basic alarms only support hour, minute, and seconds fields.
>> @@ -520,7 +525,7 @@ static int cmos_set_alarm(struct device
>>   	int ret;
>>   
>>   	/* This not only a rtc_op, but also called directly */
>> -	if (!is_valid_irq(cmos->irq))
>> +	if (cmos_no_alarm(cmos))
>>   		return -EIO;
>>   
>>   	ret = cmos_validate_alarm(dev, t);
>> @@ -1096,7 +1101,7 @@ cmos_do_probe(struct device *dev, struct
>>   			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
>>   			goto cleanup1;
>>   		}
>> -	} else {
>> +	} else if (!cmos_use_acpi_alarm()) {
>>   		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
>>   	}
>>   
>> @@ -1121,7 +1126,7 @@ cmos_do_probe(struct device *dev, struct
>>   		acpi_rtc_event_setup(dev);
>>   
>>   	dev_info(dev, "%s%s, %d bytes nvram%s\n",
>> -		 !is_valid_irq(rtc_irq) ? "no alarms" :
>> +		 cmos_no_alarm(&cmos_rtc) ? "no alarms" :
>>   		 cmos_rtc.mon_alrm ? "alarms up to one year" :
>>   		 cmos_rtc.day_alrm ? "alarms up to one month" :
>>   		 "alarms up to one day",
>> @@ -1147,7 +1152,7 @@ cleanup0:
>>   static void cmos_do_shutdown(int rtc_irq)
>>   {
>>   	spin_lock_irq(&rtc_lock);
>> -	if (is_valid_irq(rtc_irq))
>> +	if (!cmos_no_alarm(&cmos_rtc))
>>   		cmos_irq_disable(&cmos_rtc, RTC_IRQMASK);
>>   	spin_unlock_irq(&rtc_lock);
>>   }
>>
>>
>>
> 


