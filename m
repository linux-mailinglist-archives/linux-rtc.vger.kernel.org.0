Return-Path: <linux-rtc+bounces-2335-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E37519B111E
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 23:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CF49B237EF
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 21:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB97E216210;
	Fri, 25 Oct 2024 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="jRtFkzuV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758D20D512
	for <linux-rtc@vger.kernel.org>; Fri, 25 Oct 2024 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889963; cv=none; b=gIRsF4EFG3abyLwNGJYb0RpetkjcUY4mMu7gLgQ3deMeumuRs5oIXBPpDkDHXz1Qw4m0muTvkAZwOok52cQ5b7H0mlIRysTN9mdn170hkgHfgjlVtU7y8F/w7OMVl2jOlb+uV8brt+I42pBp3jiaJRH7c8dbddDKBo2Z47VIU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889963; c=relaxed/simple;
	bh=fLX+mEpgQ4zzZy/EPCgRvUGz0s/LXa7/58kNNr/5WZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzajJZWvyGQKMqoVI7/jech25LXg6GjTmb1CiiqEdksAN7tmpPxihKMTCQKWUmB/2XWonL1hcIQlfMk9ZOtnNMlH9qIpSvtS4G54G6GQU1QMZnUGPXIh6s0VNzcqj2fWqoGJMJ1S/4B4WcauQ7GAGI+zxhzFqnxZ5AQiQd3iA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b=jRtFkzuV; arc=none smtp.client-ip=193.222.135.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 8629 invoked from network); 25 Oct 2024 22:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1729889556; bh=fLX+mEpgQ4zzZy/EPCgRvUGz0s/LXa7/58kNNr/5WZ4=;
          h=Subject:To:Cc:From;
          b=jRtFkzuVaxxDn/7j4ER4AVobG9VYOELbGlLlQ5zc624Try79FzBfFAkW24VSdXC9b
           3mjqo4ed/KnvBtDXXK6vOKDybOej6S2ogJ0guAmR5Pndnr17rrr8h8HeV0Ex8ocjuy
           bc2nv8VpHFpXZb0KUudwFOlJ1DBvKlPX8dyYac40=
Received: from unknown (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[37.109.144.160])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <dmitry.torokhov@gmail.com>; 25 Oct 2024 22:52:35 +0200
Message-ID: <abfba253-0a5f-4f4d-9921-014c3baff634@o2.pl>
Date: Fri, 25 Oct 2024 22:52:33 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: cmos: avoid taking rtc_lock for extended period of
 time
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Zxv8QWR21AV4ztC5@google.com>
Content-Language: en-GB
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <Zxv8QWR21AV4ztC5@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: be0cf8a09c982c8f0d7b74f77d99bd4f
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [4aMU]                               

W dniu 25.10.2024 o 22:14, Dmitry Torokhov pisze:
> On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvmem
> takes about 9 msec during which time interrupts are off on the CPU that
> does the read and the thread that performs the read can not be migrated
> or preempted by another higher priority thread (RT or not).
>
> Allow readers and writers be preempted by taking and releasing rtc_lock
> spinlock for each individual byte read or written rather than once per
> read/write request.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

FWIW, there is a similar latency problem in hpet_rtc_interrupt() in arch/x86/kernel/hpet.c as mc146818_get_time() can sleep for up to 10ms. It should be possible to avoid using full
mc146818_get_time() there and implement only what's needed (including aborting early if RTC_UIP is set etc.).

Greetings,

Mateusz


