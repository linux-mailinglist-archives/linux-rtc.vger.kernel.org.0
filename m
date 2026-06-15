Return-Path: <linux-rtc+bounces-6671-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzgIA4kgMGrmOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6671-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:55:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F76687F6A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=r1ih7L1+;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6671-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6671-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FD07308486F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCA940B6EE;
	Mon, 15 Jun 2026 15:48:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F826409629
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538515; cv=none; b=HkWyeEgS4BFtVqueVFgZl3qNBGZWZuIeg47nrDUPmJwaCTOlN3O0FK4sBn1S9QVVTupMQ1UEHEZlIjiNPMBMo3P+q1qX5FRCK7gHWD9eEEa7yZd/6uFgwRg9BkUpi/EqXYLXUqcCutIY7QmiliTPzjsWxNQL57J+crtmA4+bce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538515; c=relaxed/simple;
	bh=KjAInLhi0v3E646PjFPpNWMeDadi9UVfbjjl8YmdQKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRXfrc7qnBVewOL5zUeng+WM/v+065YmgC56LFU3XO0x4TZ3d3jPsYzV6098fxuXjOcGWlteVcM/BU7UGHKW8wnnL96ps7lg5gatnaGmlk+SfwimAO0ElcdkgXq8HjZTp9PWGmcG7/T1PIsoaTDb7XpUOo6OrAlvI8o1jVJNhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1ih7L1+; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so18761675e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538512; x=1782143312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=r1ih7L1+GmodUONyenUhHVQMd5IVlMTTHLKcChGYJlFfZYgEOe+j/2dknG3CbWpj/+
         Q3xuYh8w3FUFXXF88cdQ11L8nVutEf+gQN0QMHMrzKQJnmsLdIVsiAkFfYMtx3f5QVxy
         ChRbKCtXsYnh7efJMz0vW/+LY3MPKQsgvM98TeuICuQcItQWl/D0Mu+cLEXXsHlWVehy
         ogfbP5lnIYnUvKRSHzMeAD6Y/lwHvIRPiF0fGeUhlHeeL5ZCKzoV7/HNagISEIbpcKSi
         AN2ZF14tEy2SzhZ3DNeWJu7e1frbA+kb/dsQuE4T44rW5kpwDEEDRgjMRByLQb+bsE5L
         rbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538512; x=1782143312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=gBiBNkTn1pXoRFD8iT4QGXQjpIo9R98ecp7MvNR+/hfTXUiG0HWgTr1dQHC61yrs4W
         be14QpBvrJLFieIedgShkv1RfddlMzDM10aaPY3dMJICebLjAUZXIKEfxpihP8ZM7bLf
         BYbyW8uXICw6CkieMQuDWp++mRQnCpgblVxHYUfej1mmDHKcSRhNYrClwoyLsUb/dC2h
         2vIw7nhZAcgzVWx9C2AI9m6H559Xx7YXW26v2yDhD+GwPfj6NHln9CHEl+7oci4le7HW
         GJxhKwdY7ymYFQ2eczX3hxVTruBjW3tnaNIgj/I8IzgE0toauPD+5IZcwwxlOJXhe2M5
         T6Tw==
X-Gm-Message-State: AOJu0YysTk7LkMFrfEYeZO8gEvtOEEdVtueArblFQms+/4mLR24rx/CN
	wRX7oxHQ6Eb6JfuEwBfRzB5wfrZ6KUyT3Li7P0oB5yhNvd15Bpf7Lj2J
X-Gm-Gg: Acq92OH6kogw8yG6WZCOSS/QoC0t308HpycA8RBU2ANoE51uriynYBYn2Pqm83lBfM8
	GmyIx7b2yc1hhrMg8feXjKeer+UDmLMeSwpNKxlaVeDa0XoldXcoe2BysmH90G/DPshbQzLWduB
	I4UKxJvwvunn3dUS+mjT4HQpvEYSjAMbZq7p0STWLHfjIlXJCZ7GYAAvAV3to/I9j6fAu4n0D1i
	Mx6UqqiTx/fClSO2a16BwsQYtlWYGUz4vnIcYPq7MNd5tOIZQkI3+NFDZnNNClZRIZ0ALSvz7+f
	j13yAvfUSWZ7GOAU29cJlUAXraprzyiGwTJK6lZK7v5/OgptR/BsHRUfxSvd2aLqDR1iGGYOiDz
	yoHB/2Vd7YIFky+iRi0tutQdw7wNz8sDpCeGFNAyacSDJrWCxAzd66qYfDOXf8VeC4ZEdeJ3WCp
	ybWurKp0/8iKOXotM7JYsbJHPLNC7IWZYWsHOlhX4cH4MoHBn4bwInR4KIugmYZ5mVR/NIEU3Zu
	3kVWExeMOQhUBDO4iKfmWJgm/4kC4yAeEBQ
X-Received: by 2002:a05:600c:2d87:b0:490:e18f:d0db with SMTP id 5b1f17b1804b1-49220104dc1mr93190035e9.26.1781538511922;
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 16:48:05 +0100
Message-ID: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6671-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77F76687F6A

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new compatible string "renesas,r9a09g077-rtc" to the OF match table
to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.

These newer SoCs integrate a closely related variant of the RZ/N1 RTC IP.
The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registers,
those registers are not accessed or used when operating under the
rzn1_rtc_ops_scmp configurations, making the current infrastructure
compatible.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 9f9cf9882fc4..dfff8dc8c321 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -597,6 +597,7 @@ static int rzn1_rtc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_rtc_resume);
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


