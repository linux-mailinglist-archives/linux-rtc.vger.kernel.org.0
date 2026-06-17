Return-Path: <linux-rtc+bounces-6680-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hbe8OKpKMmrsyAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6680-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:20:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02D697212
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:20:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6680-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6680-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B60FF3003493
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 07:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81CF3B9DAC;
	Wed, 17 Jun 2026 07:20:05 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E63B19C4
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 07:20:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680805; cv=none; b=uaJt8PRb0AQ4J4o7RaOJ5DQjjF7Z9tmxZdiN9RMUYlB0C6ZSK0oH7MgH0mW5eG5699Wmdh4ncDzgh637OW5MNFtYlNml/+6A3UpPb5sbHQxhtAM4wCHOzDDape6rM+5WvDxRdndsl7LxCJAwR+5LFuk2ziRrDpmD4T0YmNrC1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680805; c=relaxed/simple;
	bh=5ly7+TzlKvMHDJG+KCFDA2OkEcHM6CaYu71eIzXrHMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFT3wniuwGsMEbpftKkoRT/3ja5nfeAsEw/HS6NKoT+H0Wm/cnHEa2S4gPvg3XUlWB3JRepYuQffpy32E+UTnMWTVpg8SrcP/zQGt31JrwPaWjkKTmBrhWC+GPD/bHyZTfa/7AxzcFq1oXwEAGQcVYBxDcSVeqVkV8W6qHxfTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso2054301e0c.0
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680804; x=1782285604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztFXz/owcY4eIy+dbZPgHvU1FccqokXXCpyEUGPoPhk=;
        b=lqHppbKi3ZWz7KJkNxCmYr6pnQPzzsPhPcFxFqJjh8hVStm8+Frfl218RrwkO2aPie
         +aSxhd9tH07Qfe0Ii+LEu6FO5/nL70qoYcGpV2XU1B94dFrc2VzVJHj6N3wdaMAf+1kO
         dC7CK0AjjtI4KMlIKG4ai68t9i0YbAs0UeZIOxy8YIutZiFnDUZa4MAgUcMDy1/xYTxe
         OlzTN9TSOopxuUZYVFzk2sYCYPU1FK/or5/UzfSEWMK6SMjVDd52zozMPg8HkZbY0ysJ
         kIxthhnuyEUPap29BV5/6+IigiEwHB4HUHy9FINxHbTh1Xo14OgF7qpa8SwRZTHFRF41
         OfRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dmEeWb0zP2726Cylttvo3/T6yWqieERF2FO8SdYnshZs80MB7xDidtyASN/Eaoau7muK0izlpnCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4iIw9lawlVF/+1Kb29+lFGs66xFV0nBOWRjWQN0sDVh5M6mEy
	MQim1J9aI9XTagFsSdWIHcb2QaQsQ+HyThW/x9BRBfrVksd+cPM/FJQMvC0LoChr
X-Gm-Gg: Acq92OHCWJKRKksM08HUUwHAhqEz6sLcySzZxdytrcEl+d0mKQcsneVRk4mwP6VQ5ip
	GldwBYsPIeyQ+73BLaEE5Tld3aj7ErzkLwrdfEDWKk9jV2AFhLFJBEUik+HYBzFgw0Def6lSeZB
	4g8+QV5jhxNYEGGXZJOut1db7eJVgPJcWI0vbZco3sh/d+D1c6RuOoyFluL+AKTMirt2Jn4s4iU
	r/NU++Jo463xnbVnPMDdl/rQ1lJO5jnFxClnZ4SuBwGoPcE4A0qpioEZzeXyJwV1XINX3YUA6vv
	Mm7M28ZoGSOwtx5yeRFuJDpbziC0CYOAtBlglhMPmrJreMkhpZaoYMQJW5ZkboM9vvWlcdemQTF
	pNeCmOGLChQP3griq5FbAy8kEjCGfjsnewWauJGg3LUXOg0fsWOReOcuKRqzbcJf3kyoVqjZ7Ps
	Qgx9rQyH9NcS7eLCyLyfVYhTxrxS+gUosyGCWd/y0NT5XFQXM3aA==
X-Received: by 2002:a05:6102:3f52:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-7245d42aeaamr1408206137.2.1781680803623;
        Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72481eb4566sm1451882137.0.2026.06.17.00.20.03
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cf48482ddeso1509017137.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XGYByXlEY+ylGdkJyBsBZ0VM1Wf6cdkIneBKpFR1/Wq6yOXMbPhJoPM18TuQch7NUd7+XgmUgpDU=@vger.kernel.org
X-Received: by 2002:a05:6102:3354:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-7246d33724bmr1269131137.24.1781680803055; Wed, 17 Jun 2026
 00:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
X-Gm-Features: AVVi8CeCaocSZWOROZlkzUCWU99bSigpuNR2Z6uNxB9VqjP7r73Epe3QI4x_0y8
Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
Subject: Re: [PATCH 03/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6680-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com,vger.kernel.org,bp.renesas.com,renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF02D697212

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
> closing angle bracket on the second author entry creates an invalid format.
> Correct it to the standard "Name <email>" format.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

