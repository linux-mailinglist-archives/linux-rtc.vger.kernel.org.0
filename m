Return-Path: <linux-rtc+bounces-6618-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDgiJ6+qHmq3IwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6618-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 12:04:31 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028162C19F
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 12:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C1B53003D37
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 10:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB273D3486;
	Tue,  2 Jun 2026 10:04:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B213D3D0E
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394664; cv=none; b=FoQVWrthcAVfI8hEHU//+0CQrIz0w0JOjdRF/b1aw5VzGfJT3ZGIGuT6DaCMUI5cw+Auq96VB4WqfXBCAmct4bhJ0PNu7JtugKopOletWf8oOeTBLNeO4dyXr8K2ui/4JTat3gIbNzKytVz5Pz9Ug2szmtXl00PRkNGJmdDoUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394664; c=relaxed/simple;
	bh=Ea5t9LU0c+E0Np/MRy9NQ+SZbqytR+N/QwChEdmuXPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yjpw6ZOvnkYkjhw7SFJQaHTQo8Wr2tOMmgCvwRedQNZ69mqycO0AssPH7roIT6CgDkqR7kdrtPen6glicHfm2ykjqMoZgqvvC6fvJciugfaC/QIlkaLbnISvFDuwW6XWAu2i61Vk65VIUQ+SnvS3JeGDQCP/aEej9kyM3Q6hiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c3b507a4fbso1366810137.2
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394662; x=1780999462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsi++kCMTnpEzu8NDN4X9CZco+DOpY92AKyIo3iOHqg=;
        b=czP4ZTW1g6RsZJrnTiZc7dFqJ/Un0zYm9eDVjoJvMqJUDmIra/T7ZpwANuLHZQA1RV
         Qv6goq0dz93bQbiYKzsBWW6oEsr9+PeF0oamHDYLz3EjlNwDr+0So+tEshzyVfefZn0J
         5MD/hBxldLfpO+FLu5sGGnhcJBItSOLHHWNtPCBXvKGOBEpriLzq5t1zuFABCAi+h/1E
         /w+xLCe80/1p03KYrKJ28XQjJXxciqxuuHW3DlRSWlHzyL7YDHCiqZr/wRiDWQPl/X22
         HYZlrtecqRWn5ekzup+glSbekVQi6ZDYKTRzwbpZJL4TfNLglT04uAbfbDN2se74g+Wb
         8kyA==
X-Forwarded-Encrypted: i=1; AFNElJ/cp7JVxBFyPdXnjlwGsTMO4QcKFjjkJ2Gkq2rAkA5jq6VwuAnGDHjuqb4YzbTj/bMcQs2mqUMr448=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PVWL5Q6j6llUfRVH1FZy7iOgC9VfMRilCAjESdWsFZup9EP9
	EKvcfWPgcjk0GMRfrZJNSJsHLTcwD9UY8xdhfiYm3XFIZZqX1WqG4wpsyx9+4bDK
X-Gm-Gg: Acq92OE97AGggxPaCGT19lq2RXxC9CGqPJI373cvtHpbkNjbpq7S54y5YC8R43Fagq2
	vhM3eVAhrOjdAl8DbXBAKpi/4B/IYxvPhw0MZSbsfmolbSE/udMJAj+uErw5rtL9pVH/O45LWf7
	8Swz1Z+OpP+pffMHtpNwV032Kz+pR0Aq2iDk2TYvts+oFcoAMdqRIPkQmykw9NhK0m0EHi9L7Ia
	D1htPqB/owxPvXNjyHNqn5o8gAS5uVjTp6VH3XDsbXjXYTFeRI5NOJBYwak7GrO+F6U8XFdfpqn
	PiCKBKFy6fkHqQfyxhmyqLpOBZ8PoDnMB7cJl7CriggN/jkNsGSOTeVNbKiUeLQZMzI0c7DCBgJ
	eQZjbqXCbbBuYCmyJC2gU4CztP39UalxHXFu4tjuKTe15YeK1tDU5GT6UoNAFL79CWQY9JMDoiu
	3fk+bbJvhDF/71wySBj0yA56xGtKmDHz5Aqeh1egPO30OfPFvPIkHFaPr4IU7r05ycmd6eEqk=
X-Received: by 2002:a05:6102:4408:b0:650:9173:b131 with SMTP id ada2fe7eead31-6c68cd889femr7083024137.5.1780394661685;
        Tue, 02 Jun 2026 03:04:21 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963abe5bc72sm8866511241.8.2026.06.02.03.04.20
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:04:20 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963849a4611so1750656241.3
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 03:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9k8pQWRFACXMLeP7EMI4EjcRLgpM/BBatMtITb2kC6RfqTiH0OJBk4XOWjIPWVr644A6DfRg2Pg6g=@vger.kernel.org
X-Received: by 2002:a05:6122:4698:b0:573:a6f2:65f with SMTP id
 71dfb90a1353d-59befdf2088mr7420983e0c.6.1780394659762; Tue, 02 Jun 2026
 03:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org> <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
In-Reply-To: <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 12:04:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
X-Gm-Features: AVHnY4Kzspu0wT1kEtg4hVeMMR3A3i7ZjriZGlBqIf1xjLhjzQQegsSVdUezvag
Message-ID: <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4028162C19F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6618-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jean-Michel,

On Tue, 2 Jun 2026 at 10:36, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add an rtc-class driver for the Freescale MCF5441x on-chip "robust" RTC.
> It provides the time/calendar and alarm, and exposes the 2KB
> battery-backed standby RAM through the nvmem framework so userspace can
> preserve data across a main-power loss (the RAM is retained while
> VSTBY_RTC is supplied).
>
> Register and standby-RAM writes go through the RTC_CR[WE] knock
> sequence; the base-2112 year encoding and register map follow the
> MCF54418 reference manual. Based on the out-of-tree Freescale 3.0.x
> rtc-m5441x driver, rewritten for the current RTC and nvmem APIs.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> +/*
> + * The time counters are unstable for an oscillator cycle either side of
> + * the one-second boundary. RTC_SR[INVAL] flags this; reads during the
> + * window return 0xffff and writes are nullified. Spin until it clears.
> + * The window is only a couple of 32kHz cycles (~60us), so bound the
> + * busy-wait tightly: it runs with the lock held and interrupts off.
> + * Caller holds p->lock.
> + */
> +static int m5441x_rtc_wait_valid(struct m5441x_rtc *p)
> +{
> +       unsigned int tries = 10;
> +
> +       while (rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL) {
> +               if (!--tries)
> +                       return -EIO;
> +               udelay(10);
> +       }

Please use read_poll_timeout().

> +
> +       return 0;
> +}

> +static int m5441x_rtc_nvram_read(void *priv, unsigned int offset,
> +                                void *val, size_t bytes)
> +{
> +       struct m5441x_rtc *p = priv;
> +       u8 *buf = val;
> +       size_t done;
> +
> +       /*
> +        * In-kernel nvmem_device_read() forwards offset/bytes verbatim, so
> +        * range-check here rather than trust the caller.
> +        */
> +       if (offset >= M5441X_RTC_SRAM_SIZE ||
> +           bytes > M5441X_RTC_SRAM_SIZE - offset)
> +               return -EINVAL;
> +
> +       /*
> +        * Process the transfer in chunks, releasing the lock between them, so
> +        * a full 2KB access does not keep hard interrupts disabled across
> +        * thousands of slow on-chip MMIO cycles and wreck IRQ latency.
> +        */
> +       for (done = 0; done < bytes; done += M5441X_RTC_SRAM_CHUNK) {
> +               size_t chunk = min_t(size_t, bytes - done, M5441X_RTC_SRAM_CHUNK);

size_t looks like overkill to me.

> +               unsigned long flags;
> +               size_t i;

Likewise

> +
> +               spin_lock_irqsave(&p->lock, flags);

scoped_guard(spinlock, &p->lock)?

> +               for (i = 0; i < chunk; i++)
> +                       buf[done + i] = ioread8(p->base + M5441X_RTC_SRAM_OFFSET +
> +                                               offset + done + i);
> +               spin_unlock_irqrestore(&p->lock, flags);
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

