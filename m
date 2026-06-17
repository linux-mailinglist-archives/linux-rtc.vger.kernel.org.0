Return-Path: <linux-rtc+bounces-6682-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CjVEHU9NMmqDyQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6682-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:31:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BB697336
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 09:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6682-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6682-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB52C3009B31
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 07:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DEE3BB120;
	Wed, 17 Jun 2026 07:29:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB713B9618
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 07:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681373; cv=none; b=UR03/Im8At84ftuacUecfZnxzNCgqbBJGJVOe9sti6DCsQwXMSPUYx3tL7HjXx37Qnwhm6HMzJEPF6L6zMQpPO6u9cK5d0H/afmJjxroE8qsIwII+bwox9HRZS+tDd6zFYnTNlHa6Ks0vYg0LtOE9Oy/3Np73FnLQn9okDg9bNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681373; c=relaxed/simple;
	bh=vNek8FjLIl8HvwiOC3xACNGcO3tpvOAaMVKzAmldG6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHunnUDkIKnMiiRebsq76AUaKGcpt0SqpdSVvYBBlSPUFt+fJTmUqoHZlcVJDJ/abnBjIQWkXJvEXXtGT7zrtOfcX8FAo01R67NlB85k/V6k3mBiYvVaKkT+Pj6ty/o7Y96goVTeYs4+SUbxkE44FW8KYMKGjU3xCkTlJDh+pHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso2518887e0c.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681371; x=1782286171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbKfUx0yCKVUC9L3G3BTSWTRHNmPQxEcOIjC4HA7MgQ=;
        b=RC1EKxGpwZzRHhLjIN7058n8WqJ62MXuiOtSMxm1v3B+uwsJLSFYTiIDq2KLWb2a9i
         wXeJAxFNA2kj+O/W8BWuFC6Ixa9cy0voZDfCNV3QPpL6QjVNBbfup8D2FsRheoWhyUto
         rHGOzseldGMOfGvxDDPtBfd/j4276g0JVgNqsvpmGzxAUQyMApcy/HjRmWYkzrjIaRJW
         JrYPv+sgMUa3gm8dzEXUAvne+R/pQTUH6IaODEGV3jKQzyRpl476yh2DiI1Jalw7qpXH
         1oBRMf52nanMQ9jCJ85ICgccpMzw5OYgEIn4niML9NyR7e2G04flh1BQhs/qR3lPPPDO
         MZdA==
X-Forwarded-Encrypted: i=1; AFNElJ+7PqDOWozvm5AT+UbIDoiot9ldD6czPSrKMkiY923u7y2QL9RCSzgcDAsR8tkZgwUMSbrjqW/V198=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNeZKwfGWSwUcTkHiObONDq7/M05y+EjQI2yPz4fb7mVL4yeB
	b5YJlbEQjTGILqiUQKcCSFHZkQ/64OD8RavFKKSETJXLREH55Mw0YtAmuH5go9PG
X-Gm-Gg: AfdE7cmX//Y9Uddi8nzxQNHWB+noMxf0vWjCh4FqqIAvUhJh9DCw/UCND2FS9Lr8N6b
	Ypg24ruUlZy9Mvm6o5Z+ELEbIjmGg5IvFCeLnPkyOsuibMsHfNB7RvMTsu4tmT2GUnJlZgg2xNw
	FqmzKoUMSOxKXNMq4zMY7EFLMq0o/lnRI2p2utdssbMWQqoCYA5P116/sJSZ20YaoS6T3PfSV0H
	TUoJhEO8v+XTzFIsz3Q2eRsIlOOFzSo27WMaWruQH89PSgEI8rZ09Rw6iJGI1LU2bJGbp2z6VSj
	bVVPGv4XR4ewbWFg6LRwLTsLRjaply3VTg9484daoMhTNpzqVCrc41kXFboQprnPuZ705ji8GXy
	oz3VnSVK/bO26NVdjzu4hNoSWZsJJ23eCMRojFnQUFD90a7AOEc8bnIUlfqZOqpUoVVcU+vp2QV
	VCMv7Mshuab5KG0K9X8UpCy1IUZuWy++6MtaAAD5L4jNqzqyrAjw==
X-Received: by 2002:a05:6122:468f:b0:56e:f876:5626 with SMTP id 71dfb90a1353d-5bbc0be3849mr668474e0c.5.1781681371178;
        Wed, 17 Jun 2026 00:29:31 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff94a24sm7683411e0c.2.2026.06.17.00.29.29
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:29:30 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6cfc8f8e127so2153743137.1
        for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 00:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Zszq505K1/qXG8mXh5ZSW1SyNklExY6l/8Aq9XepjTU6smeHskj0vLjH73GVj/IgfJDKKTjiaPZY=@vger.kernel.org
X-Received: by 2002:a05:6102:41ab:b0:6c8:aed:ca95 with SMTP id
 ada2fe7eead31-7246c9ac2d5mr1291045137.13.1781681369628; Wed, 17 Jun 2026
 00:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:29:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXatyCmWsLZuaxsjHmwvaLfuY58dFj3CFDzxWUsnV_SaA@mail.gmail.com>
X-Gm-Features: AVVi8Cec7sdhKO6enoQpO-vFddUl_hmphx3k_Jhb6Ts9DPQNkP2qjefI912kXBY
Message-ID: <CAMuHMdXatyCmWsLZuaxsjHmwvaLfuY58dFj3CFDzxWUsnV_SaA@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6682-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C59BB697336

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> alarm and farest were declared as unsigned long, but
> rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
> unsigned long is 32 bits, the assignment silently truncates the upper
> 32 bits of the timestamp.
>
> Fix by declaring alarm and farest as time64_t and replacing
> time_after() with a direct signed comparison, which is correct for
> time64_t values that will never realistically overflow.
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

