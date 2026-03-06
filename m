Return-Path: <linux-rtc+bounces-6137-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNzgLOy2qml9VgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6137-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 12:13:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB821F7CC
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 12:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3319A3002D23
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 11:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F763803F6;
	Fri,  6 Mar 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ol+MiP5p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6235E956
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795621; cv=none; b=hM5ubELO9vTOIFWpXrtrg1Xq2nGf+qyhWVQd1GUSZTv6gKsUquWu8y+J9Oaof1pJ7a3QRQWKygQjwsJUDEs0//2L4AYRsuTHTCbPZn9S/Pyq8LOLNPnboACP5lFqGs5uDfG5BZeuLYtvOEiFGo0hsIzGjg3jxn2UYxzWijYtDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795621; c=relaxed/simple;
	bh=LIxxnkCVnwmzVwLUuMjpH7s98wmieqmeVyh1MUQKaJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfeW4KwmtQSyD7hKmhZ9uZQHbUWjFhawDIROk2c04cZ4ZdCl2wvP3gniFAbviRRZX5yA8fP3iw8U4NHYhqInANcBh5DhgfnahyDmgHsEv2kuxJq/ctabphd4Iepnd5Ze14b792DWXW30ig93BjHVaGvUtX1hLC0Eivxg94KvnsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ol+MiP5p; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06E6A4E4258A;
	Fri,  6 Mar 2026 11:13:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC0525FF92;
	Fri,  6 Mar 2026 11:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F4BF10369377;
	Fri,  6 Mar 2026 12:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772795611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=pCDWa/n78XXMhf61ch4T8hjleXLcBp1wJMK7/c7pOl4=;
	b=Ol+MiP5pOzc/N49N6/414dKpNQ7PmnF8fGe1Oivksxkuzq/JYtVkaTTH8d1KAA9U1HMHWX
	UBkrC5Ca10HqOytH+6MYYoKpKf08suS6t4whdFGXtosnLIcl6U3Z8HiMXbrTEMte7mxUmi
	zfL1SkLstQilEQGsOFhDpdqTKJVREfX2F+L4i4eY5eoxN4MtVxC0FDCHdhVOQa1aUfxjFb
	mH2Ic6blFC0qsXR89kQEreL5x4w3cP11/ZzfYJUnV2LkMthWiB5vJg5rb5Rs7iwU7lCstG
	nTNSoHIfWNjo2dKyBdqr+HuHSFrkaow27u5OiodfPyvhrN5RyWWYWZVJBaoSEQ==
Date: Fri, 6 Mar 2026 12:13:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Takumi Ando <takumi@spacecubics.com>, linux-rtc@vger.kernel.org,
	michal.simek@amd.com, Yasushi SHOJI <yashi@spacecubics.com>,
	kanta tamura <kanta@spacecubics.com>
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
Message-ID: <202603061113298cbba29d@mail.local>
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: C2EB821F7CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6137-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
> > On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> > CALIB_RD resets to 0, so the current logic works correctly there.
> > However, this assumption does not appear to hold for Versal.
> 
> For Ultrascale+ the calibration register also gives random values after
> reset, perhaps you have noticed this:
> https://adaptivesupport.amd.com/s/article/000036886?language=en_US. Maybe
> the same can occur also on Versal.
> 
> AFAIK there is no way of knowing if the value is correct or not after reset,
> so user space helpers might be needed to maintain the calibration value at a
> desired value.
> 

Userspace is always needed to put the proper calibration, there is no
way for the kernel to know what value to put there. In the support case
above, the crystal will never be exactly 32768Hz and this value will
change over time and also depends on the temperature. The value always
needs to be computed, if your device can do NTP, chrony will provide the
proper offsets. If you don't have a way to measure the deviation, then
userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
doesn't hold the correct value.
There is no need for devmem here.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

