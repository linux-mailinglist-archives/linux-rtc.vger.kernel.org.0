Return-Path: <linux-rtc+bounces-6620-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA0zFN+6HmrZJgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6620-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 13:13:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A3262D34A
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 13:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2715E30699FF
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865D93C3782;
	Tue,  2 Jun 2026 11:08:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483942E36F8
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398508; cv=none; b=aXmtoxS6IhFXPCfncu8bQy2VaFG/7Lq4NyKyvKh1xlxrjcJVz/iL9w4yU/0l4JNJI7cksQKmIRZXQfQ3ty5GEdqX39+ONwF/Zl40HPfqaYc3MlQsUV4zwhBushSGNao32SU94A1SwU/8GyicI+mG+265TI+HknLQcQaICenMCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398508; c=relaxed/simple;
	bh=w4cVZ+GEEmsXcvgIG+638F4NIv19Md0kqYcXlU7oLSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APCMXTWtfcVRVez/LYcN1PvAFSSHbXf07ub3UcTynihSui8QS591JCLvxwbbwuVar3jUfnmepJrVVYpgaubw8zWOmZeQStA/iKWhD92RBJBG5KXvbmIY8d7Qsl0Ulqyy8DkRcVCTJHv49Ifisxrp2mtC2Cc7DtshaQr+PtWviEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59dc1714d44so944616e0c.3
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 04:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398506; x=1781003306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmBJp0H5QWVh7p9vKLYuhNsufNBwSQXXDZceAK3VLwQ=;
        b=AYsFSNB7rgOOlY8QJs3JHd/lJBedew8ilhQpSu00PyPhDIktl+zRUQ0PLK5Q2LDMCA
         Ba6aBloRieSAQ9u96m9pwQsbApwCVF5blg5udEf0hDUleaxBITLaqoSUe6uKCd6vlQAm
         MtQhr09pYApIZFeFqlv6NPAnJb/KwUVPDrG80AbDnDzx8ldXhmXoY3wHFuM6bYmElBV7
         foJEZiYwfAPOt2GLE0tZp3XLgr0kp2yYU/Rzqzl9MQbJ0UTj2SHIhIwh9XQV2rWHKKHI
         H7DGo5AfxSgDQbYmWlcs0w8HW423gi/fGGnjbWz3WCSt7cqvGo5rUHjyg4z5PHEWAOQL
         DS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8i+ZtIX8doz/I1jR4af3UY7xbCdi1j9MuHQX8JcIirLnbe9mPqSuDzQtPkxZzfINPTOENwjYJJFrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+Pur0fQ/HeBTo7VbxT3n8KOPKe3NmA/6F7Ih6J5oqCj/Phkt
	nAZj4kOVkiDex8q1PSotkpi0SewaFVuKwAwhK9rHAt1cOsgmAMW7tVuuxghvYQBbOLY=
X-Gm-Gg: Acq92OEC/NwVTfQg2GXhx09cI41wbObbNJeHtao019ztjmXY/mTErsS2XKNhAjcoE8J
	xIRYyOswVx2Jgmd5NBOrgohdXMXAqA3lZC5stR1v6bkRvx5GTUCAtCJccvikRRTEte2sVDXTRac
	g1Lq3oziShDyFzvQnaDPnNSWI3LYa3zS7hvB/lMBZr2RP2wql3n6aZXaOEMvThu3RaxKBhkZbMu
	CMsY8TT8N2dkUqbnYLhaF8zN2qtYjJd5oQGcyDWXJg8GwRR0cwL1a+950B1AxYsUvPeXYQa8FC9
	ahsdA82y+CbJRT3XKFza1hvhRZhvT5Y2YFeN92r0j3VXZy0Ogwe0LNSxvfwbVIM4YcYFdSINbOm
	Ug1wfYMMhsDj4omYMLRV4+BjLWkFd1Eiwp2Bl3R4m5hui0sxfUwIM0zNYkIq5ESJ7v5H+u3tvMa
	5rS7QFhs/ca67KXca6+kWwom+WiuTI8SqRtddB4/1Vvw+piT32oQa4XWnPMw57NyfBjmgL9vY=
X-Received: by 2002:a05:6122:2a49:b0:5a2:5669:d6d7 with SMTP id 71dfb90a1353d-5a25669dbf8mr3375600e0c.9.1780398506336;
        Tue, 02 Jun 2026 04:08:26 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d9271a90sm10495670e0c.9.2026.06.02.04.08.23
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:08:24 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96387977596so2052848241.1
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 04:08:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BQ8/oODE1SRY3IP6xWfYrCQDJqnyYCk32m48md3xbCm3B+ijEc/3V/At+EhbEFteNOO9xvc418rw=@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:62f:4387:fcb4 with SMTP id
 ada2fe7eead31-6c67138855amr5868354137.0.1780398503695; Tue, 02 Jun 2026
 04:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org>
 <20260602-jmh-upstream-coldfire-rtc-v1-1-1e129a177d2f@yoseli.org>
 <CAMuHMdX=njpXOQu=LZCba0PjHRKbcbpCDMHjat-e+atMtNmSRQ@mail.gmail.com> <42ab8311-0bd1-4094-aca7-0ca108c3a919@yoseli.org>
In-Reply-To: <42ab8311-0bd1-4094-aca7-0ca108c3a919@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNiUGnjRkhwVGpgHcjTSzoLsFmaPR_TfROsFhDbYqUUw@mail.gmail.com>
X-Gm-Features: AVHnY4JVCja7EHQPoaeG9BcOIzzhjoN-O0H6mzbdbiubMmzzjv1Hj931kn5hpzs
Message-ID: <CAMuHMdUNiUGnjRkhwVGpgHcjTSzoLsFmaPR_TfROsFhDbYqUUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m5441x: add MCF5441x on-chip RTC driver
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 05A3262D34A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_FROM(0.00)[bounces-6620-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,yoseli.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Jean-Michel,

On Tue, 2 Jun 2026 at 13:05, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Le 02/06/2026 =C3=A0 12:04, Geert Uytterhoeven a =C3=A9crit :
> > On Tue, 2 Jun 2026 at 10:36, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> >> Add an rtc-class driver for the Freescale MCF5441x on-chip "robust" RT=
C.
> >> It provides the time/calendar and alarm, and exposes the 2KB
> >> battery-backed standby RAM through the nvmem framework so userspace ca=
n
> >> preserve data across a main-power loss (the RAM is retained while
> >> VSTBY_RTC is supplied).
> >>
> >> Register and standby-RAM writes go through the RTC_CR[WE] knock
> >> sequence; the base-2112 year encoding and register map follow the
> >> MCF54418 reference manual. Based on the out-of-tree Freescale 3.0.x
> >> rtc-m5441x driver, rewritten for the current RTC and nvmem APIs.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> >> +/*
> >> + * The time counters are unstable for an oscillator cycle either side=
 of
> >> + * the one-second boundary. RTC_SR[INVAL] flags this; reads during th=
e
> >> + * window return 0xffff and writes are nullified. Spin until it clear=
s.
> >> + * The window is only a couple of 32kHz cycles (~60us), so bound the
> >> + * busy-wait tightly: it runs with the lock held and interrupts off.
> >> + * Caller holds p->lock.
> >> + */
> >> +static int m5441x_rtc_wait_valid(struct m5441x_rtc *p)
> >> +{
> >> +       unsigned int tries =3D 10;
> >> +
> >> +       while (rtc_rd(p, M5441X_RTC_SR) & M5441X_RTC_SR_INVAL) {
> >> +               if (!--tries)
> >> +                       return -EIO;
> >> +               udelay(10);
> >> +       }
> >
> > Please use read_poll_timeout().
>
> As wait_valid() is called after spin_lock_irqsave() is called, I suppose
> I should use read_poll_timeout_atomic() ? Because read_poll_timeout()
> sleeps ?

Sorry, I copy and pasted the wrong function name, so you're right.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

