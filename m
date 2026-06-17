Return-Path: <linux-rtc+bounces-6683-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uj3jJAlNMmp7yQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6683-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:30:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE369731F
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6683-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6683-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C918300D9F6
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 07:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBB93BED7E;
	Wed, 17 Jun 2026 07:30:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F023BE644
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 07:30:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681415; cv=none; b=njpZyOLGNNr4hhz3Ze8bRxBKYKuYDqRQ4fu8UIl8oUwuo6aPDsc+5dbRELYFX2hwsLMFS4rtBy19drBPRVqp+0GUHpJ6UN5lLFTHa1lmWQERZgaac929bQTGdMXZiSlfBTu0IzjCmPm6MMCYlnhW1fla47Zpb/qHh3prapP8udk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681415; c=relaxed/simple;
	bh=zqRNRewoBpmHTp7Xk3UHetwxFmtfNMdTc5mpQ80sxZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udYanqlnlt+3LEsEePAD0frqPt6IDSi8KSB+Xd1duZTo1EEv/cxGvqNI+HDMSpixwNQlpNyHnMG4zLow0ifbqX3vpLjbYGW1LC6vgvqb+ZkY57hufNlUMOge9iW3dDz/fsx7G0kK1bpBywVbiTTDxIQ3suK3SicuiNZ1u4vW8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.47
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69e4a083687so4035719eaf.3
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681413; x=1782286213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJJv1PNEf0VpJ/XXPLmaxN61dHusNzB2ydX0p6N48v8=;
        b=HXWN7KCg9sxaECxzEt1qv0qGCaExYA3wGYWTr6FAWPHVBkWruS4y76sRz3vn+OdS0H
         ZVTo77GGwj4y1635dQ80pI0QeKe24qumXO6uMM5qFSj5gnvOjDZf3fIFprGiYzW8Dec6
         sUzlWdGVAzJ6UBpw4u75Ndt5nPKCPZpQLbZDc6koXzbUphoVvQjjNYmpdnnd35SSEMxV
         5sF/3Sk6R1Kj2h65VXz4fHUn2iPUK5w9kW3GdsLEX1rrEXz9cTu4kHYX8WoaIswz8ZKx
         DWU6so35dPt4A8AKLhBQg7biXcvSReZ6pUqiNvOOB0Yk6NMaHDlQ1qwnpyLs4+qKpVqT
         ckxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PKenOYDV4cBr03lbtVjRn1mEkGOH7L5hJHwiwv0WscIa50OWNL5y6iBtiBHqUZvXxxdcelaBxNb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTC4DQf120YvsweAhaJuUqTrrKk1u1AMOPbDGpEUZbrJzqbEGF
	h7SmVA2Xx+sO/pPLp6cLsND7D/1d+iyCNYvyj5fVwzS+t5A+VqgugFPBw5pvh+Nv
X-Gm-Gg: Acq92OFXwYV2J+SZaZFU2lcezoQXaUqbaT0vgplxAULxpgJcj8Egi+UW1Ega0WKepgx
	DJrudVQlE/s/9di+HO1P7WZS4ChpIn3e+E0/MHVVo1U5fuITPbiH/mFLVwX+VZA2EGECjcmWgI5
	bXr14T5mCxEU4tC8DZFwBhy+ynC2imXv7ROmXrmpRm9sj99YxIVpHsgsbpoCG6QzCtLK8PXmtUe
	AXyeBGpZJwdM5F8+6QckvlrVcrT32BFkHoOzNxT7evncv9a0J6oJ41rh2ldrITOPVixMRO+b/xZ
	GCb9lPQcUNVBer55scDklCZbnBeJcQRbl7YL5LCaOuaW86laiz/lx1oW0j7sABXHvY+oVcBcHwy
	Uqf8AZ8K4cQZ2nNAXdrJbMAOaDAEL3Zi6kZ1JPW5s7Udldmv8LfFsiCVyMRNBoGHAg6JSJPiMad
	qbKa7+mDc9Y6djupTd9kbexfRhcXSy/4NaH4fyGIvxl8Sg3Q1yww==
X-Received: by 2002:a05:6820:221c:b0:69e:56d1:3ca6 with SMTP id 006d021491bc7-6a0b5e42e9emr1946490eaf.10.1781681413279;
        Wed, 17 Jun 2026 00:30:13 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308f1a2a6sm4023116fac.10.2026.06.17.00.30.13
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:30:13 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69e32df92c1so3208202eaf.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HgBMDFCnx8oQlrZdvgkRI5FHm/mJqROw3uiffYnP3SRxytqLfkbuPO4GwG000DVlFHweVgbhKaaQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2b9a:b0:62f:2d04:db5b with SMTP id
 ada2fe7eead31-7246d42dc41mr1280153137.24.1781680950072; Wed, 17 Jun 2026
 00:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:22:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4OglYcZCFMrrSmgF7E4807IU6wsvfZGr3kR7N8sXGY6lLU3UyPN82lAM
Message-ID: <CAMuHMdXg16frnn88_P_jHRH+HPy00wWfoqNKdOv8teSWNpMEGg@mail.gmail.com>
Subject: Re: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6683-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04FE369731F

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Sorting headers alphabetically helps locating duplicates, and make it
> easier to figure out where to insert new headers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -15,8 +15,8 @@
>  #include <linux/clk.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> -#include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/module.h>

Sorting of special characters w.r.t. alphanumericals is always
a bit fuzzy...

>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/rtc.h>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

