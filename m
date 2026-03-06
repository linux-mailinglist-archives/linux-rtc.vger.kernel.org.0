Return-Path: <linux-rtc+bounces-6138-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECIBOwXLqmlWXAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6138-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 13:39:33 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C15220CA3
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 13:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FDCF3046BC8
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 12:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65963224AF7;
	Fri,  6 Mar 2026 12:35:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C949F257845
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800543; cv=none; b=iRWJ4a8JZ6ZweWIu/adWShm+4yEF0Rry+5so5hcKERS+R7h66woB536b+LzWnXtskilTGU+ndsmSW7FfpYpjvRwyKcbmF3nG67deDXtN29w0PMaGo40X7qiawFPS5ym0fPllTcSysRVCHxUb5g/S9wynoKzunbmY9DVKMxWL4tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800543; c=relaxed/simple;
	bh=t+zhrRtHdxJ0egPar6qDHLUgu1o7nIbY/t2grbrBnTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjm24uzbnDzHs7dv75ztGJxxUJrw6SHKPoF6QnR3QfcHYIDdtfykS1h/Z4wZOwKJsyIp0ajUBShTz9NBHBQMUNJwzWTBfz2M18pPTljrbJZd/w9RsD4OMbcRDaJf5qRvcqIfvQLWpxjVGhBDv97PvkogN6yMcrjPA8tiBe6uWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so2068320241.1
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2026 04:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800541; x=1773405341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96m0o8Clxl4fOeYKH2P2MIwu6gx/EjFZuUHZ+Kn4U/g=;
        b=GJRcK84iPdTGPhg2GY4nPqAbIG8lTYkMYuCWLMgNFAWu4ZvztBZ25AAGR6STT01wu9
         U1PB8ZAUBNIQiGoNGySFL19cvDjaWYwFmaHGLmn6YOpsPMrAQIEjP6qzGzRpAGjXUN7w
         h7nolqWA1kz+9JPHH4T5CrGILo59TUmcW4p8Pl8AiY3QSf3Qk1WF3qB5fN495tHlenvH
         cQeOjrUELzClem2mm+axPyhBzV66SC6NosScofTLMbSBuWwGUGMrPVoIrqDgQezXTCRO
         5RJgEght8/DQVYdKGcbDbYeHjNEHIdGi2YhBy9FePShdEB8QqNAvkKonlXgaRkhKsXWC
         Z1ew==
X-Forwarded-Encrypted: i=1; AJvYcCU62+hE6pMlVjdfTOckUtnEiC1PSkd09zl51N2m/0DOW176n2pk/j+bXc0+tLwv1Usg9iWUCcKLF5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcT6z8IzB4GakNVMqFkex6jneMTa2OfQDenZpmqp5e2UtJ1tT
	4Df4yA0Cc3BU9Y6gpOQljuvmcZ7oQ4HlwdYoD5hDpVXjINZ09uu+04S4QbyPO7JCOxY=
X-Gm-Gg: ATEYQzwgVfDvEe0JcSojpWv/NOoHweq82R1v/YtNXz/nPtEJ9xmulYughD6VOr9MZs9
	9X7R/BGbpCW3OY+SivxvVQlt3r81I8N+i2jK3k/zNtU3SgI0elG37+4u1RA67WtD0gwDUHF3Ozq
	Wgm0pM/tX4AA1jhTi4DnHE6z0HPo32A+OFsJctinnUx2eSRXRlSUBw+7Cv9kFwlp6DyfLTag16u
	vkDwfjnQLxu9h55ltpuVu1UVZzvixAPsSBJ5qnt/71xil/W8YnNWZJNHPlxfhUbh6JTPalNiexz
	y3YuGj8GLf2itYe1qv6X/bY1fSUY0u16Ki5cT5PwsQBcT/HNej3LP0XSZdyvim9yCunfBprfoz/
	qh3QMvKs5thP6iNaYUrY2upDMeh4g38ZLa8i7WCzlVKO4s2iMqL9xjH5ygwKu128kmJeiKPLuNe
	2HYao7+gslM35N3RKhBgnC5RI3dG0ukV81refS/XxxPHx2zw4odMSo8Eix3emNXzXX7Rgd+JU=
X-Received: by 2002:a05:6102:b10:b0:5f5:503e:c76d with SMTP id ada2fe7eead31-5ffe5ee685amr571057137.4.1772800540783;
        Fri, 06 Mar 2026 04:35:40 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b57031fsm1193903241.13.2026.03.06.04.35.40
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:35:40 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dddb3c3f0so2422656241.2
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2026 04:35:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeEEwSphvYCwHYYh5HGhHM/AO3dItQPRKU56bBXZ7FrDNiLIYRLNIkPrkLDktBBPs9eFphLfLVAGQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2908:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-5ffe632e0d7mr598649137.35.1772800540255; Fri, 06 Mar 2026
 04:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com>
 <20260125192706.27099-2-ovidiu.panait.rb@renesas.com> <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:35:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
X-Gm-Features: AaiRm526yeK4Pkoal5L7g4NriLGd-kQ5uifyBQ0CVN8Qd9yNZfzNgOUcuHaBmPw
Message-ID: <CAMuHMdXyo3hYbWYzdYUUzk=OQJzKn4Q4DdxXZi_0C2zH_goK3w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E6C15220CA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-6138-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 16:27, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
> <ovidiu.panait.rb@renesas.com> wrote:
> > The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> > bit position. Move the RSPI 0/1/2 module clock entries to their correct
> > position to restore the array sort order.
> >
> > Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.21.

Promoting to renesas-clk-fixes for v7.0, as I have other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

