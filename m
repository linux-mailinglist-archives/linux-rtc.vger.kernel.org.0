Return-Path: <linux-rtc+bounces-6619-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P+VAwq5HmrZJgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6619-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 13:05:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B8A62D1ED
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 13:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D8D0300CEBB
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 11:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82423BCD01;
	Tue,  2 Jun 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="CoXk3Q/y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E5E3A5E71;
	Tue,  2 Jun 2026 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398342; cv=none; b=Pm5XXDLu+L7fbmw/XEKWGAZYsJVnoSS3GaQKq4Fb5e1Fgm9IIAqPMWpFIOMMPMR0j8J41HKMUCE4pEpDm5uB79Go4Fd81RwT44X1OrgAFAhGwwBvZlYsAPu2SgasxEyZjz6x1PIfbbX0CjxrYJYV4JPqjGVlFJpKOXhi5NETKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398342; c=relaxed/simple;
	bh=vwk9+cBRkK2usiaFeQTio8+tkmlQJXS4/f8NZBElt/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/4S6wIdWFYvLUcYRBRBODP6yq0EIzCHmQFPckQb4k/VZ53LYs+NxmkwNl+dHzs1sr4tbDsSwA58vyNFQdW8GYpCvmkD+k+SzsgWCouPxvAGGlqBJ9DsqHhwLeEFCZYPQxJnkOEliIg1ysHYIeOinjcocAMigHc2z5xFpg/kRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=CoXk3Q/y; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id E814E3EC1B;
	Tue,  2 Jun 2026 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780398338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/E8Pxu55h/IOr2rd4xG69ogvihNigV/nQrA0kc5pdx0=;
	b=CoXk3Q/yO9jFPDb6CZQMLoEuJMXmQTSOqCu9c+eBP4TEOLMJMlHD+zYULEN3G/QT5KIetX
	4YIXJ3YCD6u6BFv/5hrwepOX8OLqGFzmN+q3SJWcaMgNi3OCbBdZO8Ua5Xeo3pPdqFSC+7
	0KPJzO+abrR1vmUw+o2myWkv4Z6rmOvmlgvZIMTzXqqW5zDbPRLjeiezBhj/AvWlf5cu+h
	OCzom8AVOfbaBbPTem1nM714BPZ49r06eente2qGfaHB89LXLbC/th1AJ91Aj2Crjtgw2O
	kvxD+GNn1b8AAeaSyq3RM4hCRm4cunNCC3tw3Kzp5aYln2dC0vW/dM94/bjJzw==
Message-ID: <42ab8311-0bd1-4094-aca7-0ca108c3a919@yoseli.org>
Date: Tue, 2 Jun 2026 13:05:37 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
 <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
 <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEyo8HM8CQDFsZ8EhXEuKhK8nnqwiOHEjp/onqKeCqua1A2l8xYQiAgMkVkLpTv/OwbTQj65xYBxt9KgmN5a29Vtai70oqnyTQAYIb1oBUzIdQ5dvG4fXoK+9HAbD4hmsf/N7mUylgL8rE71S1zkCumihYx5YnXC/oN7dIdkZOwwMMaxQBjQrkUA8HSlpOWbeS/FCburg5NO5U1X90Aht6uyJ7YHfvA86HTvlE5pBrrzjZzmRXAovOIwpl49ELwKlpEGkS8UmDUX9/CbHNnUpVY4nys6bl6hhXlj8kxUO2C/FTo6PcdyaozYE1YvYmXfez2X9kl0dek3hhSgcuPyCHuI3E+V9XO3gaFg9sKEu9KDK08SJgE53qV+wjaNWiRrMcreBkF/QzhF5QLLjZRyKWSpHiEERqLupMdXDVn1u/i7CR3fxQCINq254Lc8JNhJ1XXKDXThkpTtTA+Ee5WQ7r9GAWwrf5+RilOYOhVaaKSBkKWKft+8bjsNID7LpWt2/YZx04q/KsKrbMcKqBuaL7oGi6NG3kPg3Y9RSuWfGhbQNutcQF8fznk1/VGvpWXPSMioLmKZ2LQnBcrnSUmEnUNHa8cIG18rzrB3bCJUVOMqiqDehDmEFhsM4jnV1wPeBAOyNCfy3KvCs52QEPWz+7PTN5SH1AciKUFTuPlA1FS2w
X-Rspamd-Queue-Id: A4B8A62D1ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6619-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[yoseli.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Geert,

Le 02/06/2026 à 12:04, Geert Uytterhoeven a écrit :
> Hi Jean-Michel,
> 
> On Tue, 2 Jun 2026 at 10:36, Jean-Michel Hautbois
> <jeanmichel.hautbois@yoseli.org> wrote:
>> Add an rtc-class driver for the Freescale MCF5441x on-chip "robust" RTC.
>> It provides the time/calendar and alarm, and exposes the 2KB
>> battery-backed standby RAM through the nvmem framework so userspace can
>> preserve data across a main-power loss (the RAM is retained while
>> VSTBY_RTC is supplied).
>>
>> Register and standby-RAM writes go through the RTC_CR[WE] knock
>> sequence; the base-2112 year encoding and register map follow the
>> MCF54418 reference manual. Based on the out-of-tree Freescale 3.0.x
>> rtc-m5441x driver, rewritten for the current RTC and nvmem APIs.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Thanks for your patch!
> 
>> +/*
>> + * The time counters are unstable for an oscillator cycle either side of
>> + * the one-second boundary. RTC_SR[INVAL] flags this; reads during the
>> + * window return 0xffff and writes are nullified. Spin until it clears.
>> + * The window is only a couple of 32kHz cycles (~60us), so bound the
>> + * busy-wait tightly: it runs with the lock held and interrupts off.
>> + * Caller holds p->lock.
>> + */
>> +static int m5441x_rtc_wait_valid(struct m5441x_rtc *p)
>> +{
>> +       unsigned int tries = 10;
>> +
>> +       while (rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL) {
>> +               if (!--tries)
>> +                       return -EIO;
>> +               udelay(10);
>> +       }
> 
> Please use read_poll_timeout().

As wait_valid() is called after spin_lock_irqsave() is called, I suppose 
I should use read_poll_timeout_atomic() ? Because read_poll_timeout() 
sleeps ?

> 
>> +
>> +       return 0;
>> +}
> 
>> +static int m5441x_rtc_nvram_read(void *priv, unsigned int offset,
>> +                                void *val, size_t bytes)
>> +{
>> +       struct m5441x_rtc *p = priv;
>> +       u8 *buf = val;
>> +       size_t done;
>> +
>> +       /*
>> +        * In-kernel nvmem_device_read() forwards offset/bytes verbatim, so
>> +        * range-check here rather than trust the caller.
>> +        */
>> +       if (offset >= M5441X_RTC_SRAM_SIZE ||
>> +           bytes > M5441X_RTC_SRAM_SIZE - offset)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * Process the transfer in chunks, releasing the lock between them, so
>> +        * a full 2KB access does not keep hard interrupts disabled across
>> +        * thousands of slow on-chip MMIO cycles and wreck IRQ latency.
>> +        */
>> +       for (done = 0; done < bytes; done += M5441X_RTC_SRAM_CHUNK) {
>> +               size_t chunk = min_t(size_t, bytes - done, M5441X_RTC_SRAM_CHUNK);
> 
> size_t looks like overkill to me.
> 
>> +               unsigned long flags;
>> +               size_t i;
> 
> Likewise
> 

Done.

>> +
>> +               spin_lock_irqsave(&p->lock, flags);
> 
> scoped_guard(spinlock, &p->lock)?

Sure, thanks !

> 
>> +               for (i = 0; i < chunk; i++)
>> +                       buf[done + i] = ioread8(p->base + M5441X_RTC_SRAM_OFFSET +
>> +                                               offset + done + i);
>> +               spin_unlock_irqrestore(&p->lock, flags);
>> +       }
>> +
>> +       return 0;
>> +}
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


