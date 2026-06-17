Return-Path: <linux-rtc+bounces-6681-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fJPsCtZLMmo4yQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6681-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:25:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DCA69729B
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6681-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6681-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D84253087BC7
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 07:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB643BC68D;
	Wed, 17 Jun 2026 07:24:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415A3BB12E
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 07:24:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681056; cv=none; b=D1HC6vdxmEGLzYtOgBjTfPwdYDF7RFuImINpaOI3yfNqOZUxflbfkuz2vLynvyHbAFEUdfujE6ofGrlWvasppXaEBe80pJq8yPYEacNDeZ910K80fTRTCE6V0htP/ANyRrnIsvVS6ZHE0+ixxD2hTej4NdrIq4+1ovmVhbEiwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681056; c=relaxed/simple;
	bh=uR7TIRBR3yg8tAIyxRV/d8RKl0ocy3CufGlcD3SG8n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEylD7q1eItxFgLGx8Z7k+rmPRr0eNQd66gCKjh7qJbj9JggZuSez8YiS3dK0yi4PZDZGJ5fND/UThjND8wXAWTL5qczXD5ganv57RyUx9WyTyp323BDplwEiA+Y3ev608a4ecPEjyvkWoVLYiHrKOR4MMN+wiHSbMwM4GXcUHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ab0377d0b2so1787820e0c.3
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681054; x=1782285854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahs58FQh15JfUVstnf1wGngv+BPi4LTDqfDVl/aFn10=;
        b=r2QRXeavmnw8Hp+itoHmO76ultpCP/lL3jvDW0La3YRi4P3vmoh1TUypvhCN2eCCZs
         SV9IBGnH2Pc71Gxi70Ro87r82d1QSwC9bSbDAQYrBKddnWXaOycAuiMtjUIu5F8/1z8E
         2KR5N2kh3Dp8A6SemblAOZE7J9fH2HtclYv3xi4z7BD/OxQRWQAnPEpEsowHqPTBxdwr
         tXdWYPB40jLTlc3w4mA0hYIYZGlKC9/taxjvfHFRIvX8rVv2Y/QvJE39LUhthCp7XI0y
         I/9t5yj4SNfaE3FQgTYInyqQiK/Eeeu50fo+HKfySJ8M7cViBrxosNxodXWIyNsCk4XZ
         OWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LkPcWKWPny83gZoOpYZmwFNw5fuXJLc4TUbbSJniDb4Ju+XUHa7kBUrl6kB1pMBTI6PyCC/nnK2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU2fgqcW6K/xLdPm//xSFvg2O1rLBodII1OmjGkANOcmJDgTYm
	2Vz8/FBqxiMwnDCroN8y5YW6SXDPVEdjPBHn2Pgw69t+lro8CG/nXzK5ec+0kwWj
X-Gm-Gg: Acq92OGw29mCrjplPZ162OGs/t2YldY1QM3MAIluYXUYbDzT38op9P/TNlS7yvIFdNI
	kD350sX7CzChB+A/KXWdqSauJUCQxQgKwvPLq17lPRm28XeFpan+rSl/6wANugiywxs3GaFC+np
	91o+nGr4aWz2hdNCsQyZoTKGKZcUJQCi60Y7AqFvzI8N7RKZpjUapl55RPr+iQg5TT2n5kXvPFE
	Qdyn6+i8GQ3hNVfO7ceuD2EQzeuasgE3GSAGe7DFHUIWduF88q7vWvTEv98QOS8kfRdOOaWRc93
	fkppet+PeAobpoDcgXbBpKftx3jZeopTckrtsTmj7hP+sZD5Jf4+UbTlhDY1AkbeMK+pWcyC9o/
	2h0WH2PeHjY9XJIeaviKyAl6Esr5KKtWoVTbfVl2ELc2iTLTJedIRoSKmbQzD7p0h2dbp+d/v4B
	SXKprYgo9QNy+6/8TiRNrf7k1X2VhM40PfD4ADllw8wk7RkacsHQ==
X-Received: by 2002:a05:6122:e1a3:b0:5a2:5669:d6d0 with SMTP id 71dfb90a1353d-5bbbe7030bamr1239358e0c.9.1781681054015;
        Wed, 17 Jun 2026 00:24:14 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff95f5bsm8487151e0c.4.2026.06.17.00.24.12
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:24:13 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so1170034241.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Y4cSU6WQ9S8QCNEKmb3Z7u4fEsUgnHcUEeSD+yUcOpVwSCLeKeGmA7TXMkzqy9mxjtwfzG7hwmq4=@vger.kernel.org
X-Received: by 2002:a05:6102:548c:b0:6ca:32f1:f06a with SMTP id
 ada2fe7eead31-7246c88cf25mr1325601137.15.1781681052567; Wed, 17 Jun 2026
 00:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:24:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
X-Gm-Features: AVVi8Cct3Yj3PdPpYaOL4UBKNGskw3sUCzooWr22FhgciKRmjYjt1bOLgA7r9iE
Message-ID: <CAMuHMdW769Sk4FMJWNyCK5jzc5oVZL_4L5wt0w5uyL93wrYF9Q@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6681-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5DCA69729B

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
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

