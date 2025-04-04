Return-Path: <linux-rtc+bounces-3771-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA6A7B7AB
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 08:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E573B480E
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 06:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B9617A2EF;
	Fri,  4 Apr 2025 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JXTGGt/A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KYoXsi/J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB03B2E62B3;
	Fri,  4 Apr 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743747398; cv=none; b=JELmtMFPrCBJiLHuy4qoqWjDrpcsh7wuNGwbBZTyVOehB7/AdSBLU6/+BsqnJHUfOTQwqoeWLY/1MQv0eFC1fYGXrErVWQhzpr6rJ9RIJm/82Vipaamtws6RY3jz40PY/tCTMl5/tAmDS0mSVmTM9MFyiilw+Dpi0epN+z2ssRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743747398; c=relaxed/simple;
	bh=FSC45CH9kZ6jyRdaczYa359on3/LgDjGUYpiNSWuqzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiYlO66FJSLJQ25uT/G/nwIn88PoGCpHDCJkbF2Rb21jMAkUExuGFk+eTAcWGwRMlau+XykD57pThP8Y7mc2xUxi4fbVR2LWJi2TJ2hXxVDD0UJvdaFnNQ/hV91g3VV+lbFFRKHiEujh9Zy8C/nwlJZROffG644Ap4rmWqpgLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JXTGGt/A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KYoXsi/J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 4 Apr 2025 08:16:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743747394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f4d2GP1neMFeV/511iAeJ7s35t/7pb8Ppd1YrdAQVDU=;
	b=JXTGGt/A5Vqxn3o4i/eviNUX0j87m5vSY/kbMdkQm0XCh9wixkaRS+gIL5w6GwM0Ofh7pk
	2SFkpFGrWtdwao0VPK3WuLraZsqCsGduFJEFqs0I+/lPJ5eY4ZLSXr9UGBr/ZJ6yW4QY3X
	ScKWbT1/hUepSkdqkFAeK10mSr1xeh4YtCInYaSd0jqejRI+i6OnPJXATUepn9Juk709Hs
	/9y/wy0ynESRQRuGoAA7kXZgph8hfJMAU5Bk+vbFdQ9EzYTD1opYxK01lscEDEChY4zpCg
	bss97+o+42U9RE14Pbmg6maOiCfKDwq1vKCVmpGy7IVVV4O8yGirysNON8oHvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743747394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f4d2GP1neMFeV/511iAeJ7s35t/7pb8Ppd1YrdAQVDU=;
	b=KYoXsi/JwIc+jcZN5QTpSUlwi6kYeuJEIm6KlS8pcVMPaqcOZV+sBmwHumasyaiNPtspsk
	djGaFE5sQ94fcdCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
Message-ID: <20250404061632.Ftb8UoHV@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
 <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de>
 <87r029uh3j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r029uh3j.ffs@tglx>

On 2025-04-03 22:26:24 [+0200], Thomas Gleixner wrote:
> > it is just
> > | WARNING: CPU: 0 PID: 1007 at kernel/time/timekeeping.c:1858 timekeeping_suspend+0x3b/0x330
> 
> Which kernel version is that? I don't see a warning in timekeeping_suspend()

I added a WARN_ON(1) to the top of timekeeping_suspend() to compare my
call chain with Borislav's.

> Thanks,
> 
>         tglx

Sebastian

