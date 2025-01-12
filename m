Return-Path: <linux-rtc+bounces-2886-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2911A0ACA4
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 00:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C9337A19A1
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 23:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48251C2DB4;
	Sun, 12 Jan 2025 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l9zqgjsu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA91B6D06;
	Sun, 12 Jan 2025 23:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736724372; cv=none; b=rSBkcfctgaSBs81CZ6Va8naHZSLAwNk5yYEESGEN5JIWdknsoETU7sT13xNG5/cSwPina9QmLOGmwOpcq3nEz1la6EmReTT8KTVNnjugNRHuK4+OArV9/4UOXigwanKQWwQYNOStvW5zBnBpmCSVt4G7fDzaLIxiABkTdMgtpW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736724372; c=relaxed/simple;
	bh=YIyihKSlz1Tq0MnM5QkkFfK69inyp55AtBNQLVfo2s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXrx7exv8TzMF8ykbksMCm4bMISdpxyUHgox54eV+iVZFff516wSB1Qc32SsJ5B+huBX8R1zRKStmcB99Et2qHmg48M33j8jjelhwiwN0/gHboCoO2ZDG9TvOx8JoPMqb2HyBulRd8TXyAvAQrh3/PC89TbsSpkY6w8ua0jjEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l9zqgjsu; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2D2A60003;
	Sun, 12 Jan 2025 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736724361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lLYRo3DNIZmMYeBzFzR0NMOOPvi33hx/jJ/CzRJLGA=;
	b=l9zqgjsuBmb9jf71l29XRBtS6p8c0k56i5vZme7WkgCHZH0QuPvSO15JgjayT0oNHdsosL
	z8LgtRFGi7D1ElVo5zc8UBEEdC91rjtbjPG5bSQK3rZy+Xa5S6f5ZRDnfikyRJlRAB7zDA
	0yX3idMIESJupWnxW7lc6Da5Y+sHGPdAAXFVOZ2pVLSAu9PRP7OYNXhnd4guigMW5TCuFr
	Gh6MRQks7LVpDxwzVuyXYKsrD8MwhwCKzgj2DfxahNnF+jYHyvwP0Aclt4PkgB25Wn1pny
	KX7GIvdSi34Gd8TUhkixW4dVW1zrf6eyOa/kjmroIp1wbIXAY4/AB6LDAHoCTw==
Date: Mon, 13 Jan 2025 00:26:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux@treblig.org
Cc: bp@alien8.de, mingo@redhat.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
	linux-rtc@vger.kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Remove hpet_rtc_dropped_irq()
Message-ID: <20250112232600ca0c0fd4@mail.local>
References: <20241215022356.181625-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215022356.181625-1-linux@treblig.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

Dear x86 maintainers,

On 15/12/2024 02:23:56+0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> hpet_rtc_dropped_irq() has been unused since
> commit f52ef24be21a ("rtc/alpha: remove legacy rtc driver")
> 
> Remove it in rtc, and x86 hpet code.
> 

I'm willing t take this patch, can I get an ack?

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  arch/x86/include/asm/hpet.h | 1 -
>  arch/x86/kernel/hpet.c      | 6 ------
>  drivers/rtc/rtc-cmos.c      | 5 -----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
> index ab9f3dd87c80..ab0c78855ecb 100644
> --- a/arch/x86/include/asm/hpet.h
> +++ b/arch/x86/include/asm/hpet.h
> @@ -84,7 +84,6 @@ extern int hpet_set_rtc_irq_bit(unsigned long bit_mask);
>  extern int hpet_set_alarm_time(unsigned char hrs, unsigned char min,
>  			       unsigned char sec);
>  extern int hpet_set_periodic_freq(unsigned long freq);
> -extern int hpet_rtc_dropped_irq(void);
>  extern int hpet_rtc_timer_init(void);
>  extern irqreturn_t hpet_rtc_interrupt(int irq, void *dev_id);
>  extern int hpet_register_irq_handler(rtc_irq_handler handler);
> diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
> index c96ae8fee95e..7e21018a0e04 100644
> --- a/arch/x86/kernel/hpet.c
> +++ b/arch/x86/kernel/hpet.c
> @@ -1392,12 +1392,6 @@ int hpet_set_periodic_freq(unsigned long freq)
>  }
>  EXPORT_SYMBOL_GPL(hpet_set_periodic_freq);
>  
> -int hpet_rtc_dropped_irq(void)
> -{
> -	return is_hpet_enabled();
> -}
> -EXPORT_SYMBOL_GPL(hpet_rtc_dropped_irq);
> -
>  static void hpet_rtc_timer_reinit(void)
>  {
>  	unsigned int delta;
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 78f2ce12c75a..9c8ce7510c56 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -151,11 +151,6 @@ static inline int hpet_set_periodic_freq(unsigned long freq)
>  	return 0;
>  }
>  
> -static inline int hpet_rtc_dropped_irq(void)
> -{
> -	return 0;
> -}
> -
>  static inline int hpet_rtc_timer_init(void)
>  {
>  	return 0;
> -- 
> 2.47.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

