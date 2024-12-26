Return-Path: <linux-rtc+bounces-2775-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C69FCC89
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Dec 2024 18:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 666CE1882FA1
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Dec 2024 17:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A40913DB9F;
	Thu, 26 Dec 2024 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="datw33aG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FA13B780
	for <linux-rtc@vger.kernel.org>; Thu, 26 Dec 2024 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735235713; cv=none; b=E8UxQ+50fnzcdZX/IBAS14y4NTX9zsoOKv734nZcfd8nLqeCvwNWS/jUypfntKJfrKxtaR8bxhKsl4+WrWo1fSiFoHOWTHWzKFRRbaMhG9of9gXKW+G28/GPtx3H5GJeeOMmerxFtPXULQeDLQ/CsuGUWA4Lyh5Hp0T+q5jeFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735235713; c=relaxed/simple;
	bh=+QqVgKQ5ytGKIdeLFnkhcF1lukk7spDT5dvTw39KYxg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ehpx30OkWVF7bVUfPB3pWwtBdP+9yRT404ijeEnLUNppvxBSO2TPRdnMsKDZMrWXMlyqPE8mlyUGp7X4yCii3NnSk86PraqRL63Yt2Tk1bPt641AfcL8+PfjvOn/1OFFAjU9GKH2q57OfHSyqELPSDzp6ieexGz6Iq0J/0gvzx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=datw33aG; arc=none smtp.client-ip=193.222.135.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 7401 invoked from network); 26 Dec 2024 18:48:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1735235307; bh=+QqVgKQ5ytGKIdeLFnkhcF1lukk7spDT5dvTw39KYxg=;
          h=From:Subject:To:Cc;
          b=datw33aG92aEjZ7My+dT7iMHcUJ4jg/Zk9O4eDG8BfE8M5uspesm7v4mlrjCGMp03
           QLq/gqGbbPDeohByLu5HAbPhvbXxPEbhYibGOBS/i5y7gO2G7ViYrGiXKmqOqHQyTK
           YcLPkp08voGTmOZVYPK0Tct5a4Ldh7iU2W8ek/lJtvZtXB+XQlYDVPw5Wt+lQLIrXy
           wtzfVoIr2KxYvNhlcmx9s/n9hIhCBMY/Sj1VUOIjJVFteDJe1zd23Vu3NDmJUIcj3H
           or65yWsYIVnLiESqef+fA2CBVKPwNrGTyT7ujyeyM/EEULj4BD0XOaabL5KcmvR0ZW
           YP69M0+R/cFsw==
Received: from apn-78-30-73-185.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[78.30.73.185])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <chris.bainbridge@gmail.com>; 26 Dec 2024 18:48:27 +0100
Message-ID: <463fbc29-b41f-4d2d-a869-108114000cdb@o2.pl>
Date: Thu, 26 Dec 2024 18:48:25 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: BUG: Invalid wait context at: mc146818_avoid_UIP tick_freeze
To: Chris Bainbridge <chris.bainbridge@gmail.com>, linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, alexandre.belloni@bootlin.com,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com>
Content-Language: en-GB
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 07a382bdc21da3b83d4606e65fc10ad4
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [oZMk]                               

W dniu 1.12.2024 o 18:05, Chris Bainbridge pisze:
> This splat happens on suspend/resume on a HP laptop. It doesn't appear
> to be a recent regression, as a bisect only leads to 560af5dc839e
> ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING.") - so
> most likely the issue has been around for a while, but a recent kernel
> build with lockdep enabled will now show it.

Hello,

Thank you for this bug report.

The cause is that timekeeping_suspend takes a raw spinlock called "tick_freeze_lock". With this lock taken, this function indirectly calls mc146818_avoid_UIP, which takes a normal spinlockcalled
"rtc_lock".

It is not permissible to take a normal spinlock while holding a raw spinlock due to issues on PREEMPT_RT kernels:

https://docs.kernel.org/locking/locktypes.html#raw-spinlock-t-on-rt

From what I can see, this has been so for a very long time. I was able to trigger the bug on Linux 6.1.0 with CONFIG_PROVE_RAW_LOCK_NESTING enabled.

A solution to the problem would be to turn the rtc_lock into a raw spinlock. This requires that the critical section (during which the lock is held) is small. Reading full time from the RTC requires
in one critical section over 10 CMOS_READ invocations, writing full time - around 15 CMOS_READ/CMOS_WRITE invocations. This cannot really be broken down AFAIK - I hope that the critical section would
be small enough.

The rtc_lock is used on 7 architectures (mips, sparc64, powerpc, alpha, x86, arm, m68k/atari), so this will require a bit of work. I'll try and see what I'll be able to do.

Greetings & merry Christmas,

Mateusz


