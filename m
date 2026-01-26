Return-Path: <linux-rtc+bounces-5899-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GB/E/qOd2m9hgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5899-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:57:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB28A677
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1984A303F544
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 15:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D4C341065;
	Mon, 26 Jan 2026 15:56:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D81340A59
	for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442985; cv=none; b=qtoF2mP0Sz64MLuVI+t3fO1MYLdMpPBHe5za6Zq2vlkqvYNvxA8vAZWAj7CCDehCllwUMXSAs4Wwue5h6emGdcxDi0sxlowhZonCUMrxqHqDPAEBFr+FlvZ3KlT+WzcoRwjsSkovZT7rBqDg/rDWmUE/lOHwq99qqq4t29URGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442985; c=relaxed/simple;
	bh=j2Ql7ryMTYd6hLKkTTmh/xjJDWhevGva+bLot43hmIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5uw5ITX+NiDI3+celqXhmCWtOsjRfSjHHVLHKf2O0Bj9PAsBT6RNHOWKS2g7/Wl1iqoCMFTiZAPAByNv5Nfui6SrgMKcjLbI59Kc+JGk+v2QGVBTlTUhOn90U3GSgprEC1HTfnLjSM1dIxqur1jYQz30yLm5F3xokO+D1u8Zfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5662c2937fdso3943335e0c.0
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442983; x=1770047783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW75QeMDV4a8PkPxWmQfsAC+HhpeyRhnFa7BZti7x6E=;
        b=EgOTYthNogYEJuvYS9Qub5Q1CsYO4rfNZVGGaRukrEa/rebeT3rFt0m/sGFzAlOmG+
         nqlR2ftG9vX8VwLzeYCkL+iOkTnB+gbUzZ7BF03RdMaVsgOyAK7pMimXGxVVGKe9ICZc
         KmTSpOUD/k24h4ZkdCRhD41secp6w6dk//yr1B7DsmBxOBQ28rayFvz0Q2Y7vuzrSqRl
         S2eKdqRoSo4Jy3RBgemewNklFWU6KeAus8o7qaxQS4lb5RF1siBDDTEaT0Iz1Aq+pen1
         6mnAylL3+OpB6l8kByizrb+fYY5Qy58O/9ek/rj8+/y5FuvHzaGfYax7YHjbHJRPIBA3
         kgEw==
X-Forwarded-Encrypted: i=1; AJvYcCVuUorEu7kkJh4/N/8MYaMnMwjDi2f0fldDvdk0pHWlMMDMOBKEIrWc4s9Vwv5vFZKCkfC+jFxNP5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YydmGSswLI8KRqxx+K4ohZVaIXh6B24MUDd7E5l4AyGLpeOc1kY
	5F44BsKiAsL/6RUgJJy20vCcYSAogus7l7jo9XQkVkFJCpWNqELwKA8SUXsb3BAZ
X-Gm-Gg: AZuq6aKbu47zTjwemWqO9XyYjg8KPVRIPyFJ0pttdjRVftq4arAlMwiEshBx2moLhY2
	18sMuCu/9Fa6wHwDHezvFr6GxuIIy8eyX1aUZv9xv2Edi/PDgJ13X3/T12eAGU84JSTD96n21eI
	gBJ+VzqJoSkHRtbnutBxLoAidZZS1abPDQcevgKnCmWJhm4bQb89vOa3kFyd6YuLEsxRq2DSGG5
	63krEeb1ITRaCrahaq1wVaur0xLtlQBN5qXobObGWQW/R91WPmTUjybh+crNRLF47qrnBKK8vhn
	WPveFCFpc4O73VgiHTCGX1nHxqDvgVSt7Yu6eDVFWKR1jwHYLJnk76bYOLi5fW+Tlku+JTuxwzk
	hyHPCmI7iCJeB2ha3h1e0g0UGkIiSLR8V9KN4rkBc/trdkhmshWvDBmtlWcszgQRVHHClZW0IjX
	KFEatav07O5+g1U36x88pfLy96NqT/VFlY6bGmZycBhQGlHDu1
X-Received: by 2002:a05:6122:328c:b0:563:70b2:a5aa with SMTP id 71dfb90a1353d-5665d825372mr1356163e0c.8.1769442983201;
        Mon, 26 Jan 2026 07:56:23 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb58645sm1865476e0c.12.2026.01.26.07.56.22
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:56:22 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5f524301a76so3527052137.1
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:56:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdjjCNEjLP/INs0txvoemdscM0rzczBBBXMLXxJVggOjxg6zuPj0t2R+s8McK5oLJXi371ZNBrFrY=@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:5f1:b58d:bede with SMTP id
 ada2fe7eead31-5f57727844cmr1470425137.7.1769442982080; Mon, 26 Jan 2026
 07:56:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:56:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
X-Gm-Features: AZwV_QgJ0TDPdAIJdv1mbLt6nJx-pGX34vWTaFM3iyDnGfxutud9aETDmEzc77I
Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5899-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDEB28A677
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N (r9a09g056) RTC is identical to the RZ/V2H
> (r9a09g057) variant. Add the compatible string for RZ/V2N and
> extend the existing RZ/V2H reset configuration to cover both
> variants.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

