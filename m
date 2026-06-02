Return-Path: <linux-rtc+bounces-6623-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRmWNUQsH2qQiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6623-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:17:24 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D53FB631580
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:17:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mbaPpLC5;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6623-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6623-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA93A3009E12
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93EA3B2D06;
	Tue,  2 Jun 2026 19:17:19 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DD3A6B9D
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:17:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427839; cv=pass; b=i/MH35Khy1k7itQcMMzwqyUqfiW0SlTT7A6bf3+fUPSxND+D5G9+7BC7hEdxkje/Is8X08zxW+SfJCPRvfyS0J7tHgZCG2rJ0rGf2Jc0hVm0tX/TYjXUF2hJQBgT0ubUmlN4hjiEP9+AyyzHedv+vCTg7ng7dhEa8iNlLHjZmug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427839; c=relaxed/simple;
	bh=mSsK1OjXsjkFlenkPIt8hS5iFOCe8M7xFGjamW5t7xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxOMWp/g6YnRIm+5wxMHDO7usrf8Kf5APih1q67rYvqvFUlO4SvgO+UWpwdylXIM1ewcwcIGRf2EnxpZAB/cOQ6pmEJITntGhxDWuBbOcL8KSq9BSXbb8jIwQW1yP+vkPU7+3AWUr8LE5yUgSNQGTxDXRzvEQV/ZQ5Uwbbm/zNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbaPpLC5; arc=pass smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3579684f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780427837; cv=none;
        d=google.com; s=arc-20240605;
        b=ZnRCFoI4JD1I8I7taWRWOxftuPsO+ZAbL7eoUPe+uBjnFr+I2Rdtz58OpLw7SaYDZ8
         QX5T/Ln20my9vqMzWufOCtQ4wlaWxe8Vjw59gl778KeC0uBJzt097zQK3AFZVlfBO7gk
         Mxzv5jtx+EcqZ82OkBf/m1qEyjVKAJb+V3MES74upM1/sy10dogDq+aW0XtodG9jHCnz
         NniWDIw8kH+4ahFsKWTXpbi2ZZxzES5gu8jmeK69hxMAf1WPxFgQEjhPwQb/BmbYQpZT
         fHDBaUd4V+FxVZLvWYsO2tn+rUQP0GmdNexs8PxUHXi+C5AqG3n1CnWaRMgCRpLhFCGc
         c44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        fh=evYbSfEAFaGEH8r5KnRTryRs14zgCohGNnNV0g2I+w0=;
        b=CwHXmDQzrEMh4YToC57FMDmkhYpKf8aLecGNFbCyey5XQ9be3Q6z86l4FafsGxneTA
         NJ4rt439p760RrbvRNecordEsXTq/yqVp0f31iNJ/8Qw7TJXeb59s/oWZ8XxwK30kXWK
         Rcq88KtvlLyOjcdC+gkiOdyukqybJLii2IwiR9P+I0zpYVKHYWHuamwv+33rLrtucd1R
         czkEKydUU4LKdweUfSd4E6Os8DvlG0TMshfQ4/GE+jnEIyfPLCbD6QqcduJWtKeT/7hX
         btyprT2Xj7GO2pqw3EaB2X3fLoOm2ilNVbGttSLZnM0Jr094I7CTqLZVE+kjDTeK4jZN
         WjSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427837; x=1781032637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=mbaPpLC5N/XjPM5qMRUoKJ2aBIuj/qRSOO2bZ1J0eu9awz8nOYP0Oh44NddXzgzPOm
         sF7MjXfbrJxHh5zU39v7uVMzZYZm1wKAJ9ffqqXE/wQwB6QHnbmrTpiex9oTtxy2HTbN
         jaflA7dmNjoQb6qC8glImLF99UT1e5Il1NyRWDsOrLRJjSA6Dr6B3t5+M6/STvlFP9FM
         A4Ke3mfkVv8IK80uufu4vnxIy2NkU3rrPNJmvJJP7dgkQCiIz2egPAg+qjMB9oDKUDc7
         VBwF8E3I39Oqyvr4YYumbWi2diJ9lN7kPifUEh8dgwAUMioPz/Jq/cLURatbnDVx4kdp
         NrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427837; x=1781032637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pql2O34i0Txx0WbzJHzF9j1Y7wGG0LWO3D8LOQNywio=;
        b=jANHqNmNPF+ref+JCnwbDTRUydZ3kxJU0mAmnzfIfVuPIaWI97dogt6DO2UCJ3Sivx
         CAdBqQ9AuxpxaxwtssdphAeQsSz2vWF9kMFqXmOROq4QQ3os7DwisYPwf5TltM90jk2w
         Z/Zw9HSTvLF7sqthAPSpisSIHr7S1AsNsx8dZXvJ27C74oneYbUN1IzxnIGbbG1DFUcl
         xlO+xDU+i/5H5SYW6IoM0Pg9Zqewn9O+6YBrGuK8zkUJeexdQf0xxvBAWmy42ps/TsKZ
         JdjDuMHEa+PvNx7LNni/4QtRpn59lHbeFer77lK3DBKqRBfuA08gd+XKPYHiwhKDUiW+
         WwJg==
X-Forwarded-Encrypted: i=1; AFNElJ9llCoKNYA4P103T4zsd7EPDczAnDAuA+DWVtavTSph3DSIQLssYAktUFWdiyCAykmf/y9Os+FlTnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw41p+srxBEFBJKqN64qKtofsgP1Wtq53mAropT3JY/bT5o6Ig2
	k4aUsHBlvIEoyN5dAExOYtdh1nng6gv8jqOZfJd0ViY5Gi1cVn6p+q5Tpk7Oas8wcYxYL31otvd
	2R/SEzaqm2zEMCEQ1+nF7aBqNf016OyY8UQ4aAxQ=
X-Gm-Gg: Acq92OEvtH+VA94wOaHs/KcSKhhQUIuKXzFo9kT9kDiQyfn/0VQ95/Jj/naX8T37Yft
	Q48vItE9Wzd6Ei5IXEcdeZ/8kMRyvehlgu1B/m29MwHJZWnLPe1q56tmOFvVV47tBpTMN6G3Bsg
	yNnPgpfvgdJwhiCLwe5MaLZxfPOi+AaMD2ecDRluHs8CKHwbz1fNMqExd9D6hSZF4i813jOVqvF
	VVf4uIhi/AL4p1qqzcRkcAUEsthPYZGGPoKKxRl3LENVReSdtUh7J8ErQ4Hngvp05Poc31R3wNh
	kKpMxzDb7+etUfRh5ifDxm7833Yo5rft6aTNjzC/eg6ILahuel/aUo4G8A8Jyj5F3urvmi87N8S
	ohkkqJ9m9ym46wPHl4/O2kmoZ/IMhC1Trhgw=
X-Received: by 2002:a05:6000:cc9:b0:45e:da9b:97d6 with SMTP id
 ffacd0b85a97d-4601f6412c2mr703236f8f.27.1780427836776; Tue, 02 Jun 2026
 12:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
In-Reply-To: <7f6fe294-582d-4668-aa77-ad9ab47cce2e@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Jun 2026 20:16:50 +0100
X-Gm-Features: AVHnY4LjxLZyfS_o0rliq9dZXkh2VKw4i42Fz-8_my21m69fFg09PCpHY9lT9Do
Message-ID: <CA+V-a8vjM4wY-braP9tORROxuWqDg06Mhpdowj1A07sedh0oeA@mail.gmail.com>
Subject: Re: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition
 in alarm setup error path
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6623-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D53FB631580

Hi Claudiu,

Thank you for the review.

On Tue, Jun 2, 2026 at 9:31=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 5/6/26 19:49, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rtca3_set_alarm(), the setup_failed path attempts to disable the
> > Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
> > However, the polling condition passed to readb_poll_timeout_atomic()
> > uses an incorrect expression:
> >
> >      !(tmp & ~RTCA3_RCR1_PIE)
> >
> > As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
> > condition effectively waits for all non-PIE bits to become zero, which
> > is unrelated to the intended operation and is unlikely to ever be true.
> > This causes the poll to time out unnecessarily.
> >
> > Fix the condition to check for the PIE bit itself being cleared:
> >
> >      !(tmp & RTCA3_RCR1_PIE)
> >
> > This correctly waits until PIE is deasserted after being cleared.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
>
> I think it also deserves a Fixes tag?
>
Ok, I will add (and also CC to stable).

Cheers,
Prabhakar

