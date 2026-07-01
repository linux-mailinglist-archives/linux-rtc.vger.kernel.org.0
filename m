Return-Path: <linux-rtc+bounces-6831-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16y8KEUmRWpm7woAu9opvQ
	(envelope-from <linux-rtc+bounces-6831-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:37:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5996EED7F
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:37:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VFzYmXzl;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6831-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6831-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6BD731A1F94
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2163546DE;
	Wed,  1 Jul 2026 14:30:18 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7770D350D7F
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916218; cv=none; b=LFqFq5cIXOvdlahVN9KYEru1eyBlMwcLbUyQQjE96iw0VBxENwNphX1kiCTRZBy+2ve7wnYbhU/8CLJtp+UbatiVj4YUcqg/d5FsgsLOlGotkADWxVG+PhhViYv/nlYeoQF0aqlQsQrNpKf7zAhDrUWLAQxiCBOgilkstSyFdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916218; c=relaxed/simple;
	bh=TPEjDOtOvs78CIkohl1xvcmHiYoAAprmMIWg3FBDWms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoIFawxKzDYZkA0yk5cwhCu8H/bIbTgm1nXcfHw3OFhcjTFs1dHnjiA1Rbr54uqm0OG7WjCI/DVsJOc/MJ9VnUUITBwGcVtyHFP0UIISTuJD9XbZxBkMJQk02P7g2yJTiSSZfkd3BQhgTCQj1D2vdPXs2PN/URrNKTRzTL5RalE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFzYmXzl; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b1710405so3966265e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916215; x=1783521015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=VFzYmXzl9kge2OuATamtFgxAQmrZmWXxNGdnwQsRaxqf6Mp+E0+cs4OIIv3tszDrVZ
         mfiMSRLGDhiKyliaGS+M5G8ItDX2bNALH9Wno3bJw+6bVIFZUlIs5NL3lXBQ/A2zSmJW
         ATDjD88ISmHDo//KfFYHa+OkQQdoTCMp3fczptBkUFu0YAvkXVYtcf1NTzQh5S4UwD89
         yfUlV5jy7FoLuFE7tJBQFFm3vx0Rvp9nAo5RYMr2DS5IPXWtd8Rf9cEOChgpcmDSNpc2
         XhKirRYyHb91ngRU32P/3inDSMRk5h40nStI/2JUKYZ+prhz6gHMud1UMvlk/KyUmfEi
         bTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916215; x=1783521015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VcSlzYOxPLTW5jLVJLClqvrOJsBnz819IiqK2l4msU=;
        b=b00mI46/B1QdwU4jhBNRcy2ao2wGXyBkVxkgYdjxQl+HS1ze5PjIeNCYVlXT3eTQcL
         VQ4JHkRx61imMuE4Z619ogs0Fbf3OD/sXCXpyvSOV6WS3d5+lD2nFiDXZCLVr06syQ+q
         mYlS8WK+OSMQ7p/NLsWpjxl7sUKTwsy08SYP2KyGUSfkijPNsdTu4kEzHtoqvWvB/OhN
         sIuv4zLKrZBlFcA+xRTW49v0aHkAeCtHL2HQN0wrEf82+kjvYqt3NxBj1c4IJc7Dk5m7
         eWPNJC9YmWIacKrdTTl+kI7164Wz+czCDDUTSf244WYLR8togOlAuP2aarlrmzVr33XR
         01YA==
X-Gm-Message-State: AOJu0YzvWrKH5CGI0OIk7BnLogTo0Cou4Zn1YmkqyHfSyu3OxP8P5IEg
	YpB3HBZHNgIKicfK/+zdnptzlPcG6oVuxON2q7mQQRS94LPiOAdIiZOS
X-Gm-Gg: AfdE7cmtDoEJcGz5FssBt8yp5CW16zzB7Ch6tYIA0qOkmUHwPUILRrI3/SkWgzASpVU
	QxGZvyzFOwG9o4tKyuZNs0Q1ASpN4/F0Mv7HlFbEdSFV/rWU2k6E+b+RqeAfKE0Z5JvMTt+d9yB
	wXDwed56Ys1E9FIo32yxH3zv0lr9A3n5T6trzJXL2unm0H36NTQAg5kMDX7kQ7gEumg+KqXRVaa
	jN8jvbvshCcsgGBuAyYKBDG9+3Zps6h9xsVDO7tZdWT3stmDnUgj4RvyrWa7ARRP1QKbqhXAvPO
	r2PALMKzBg5h/NLkTRtz7s/pyL1FIffAamX0ZZZG5ms+zu//j+pDSOhBLK2Wwp/x7+98uVP50kW
	5x3hu5T7kGso2mTC/DhcFNdQ+2APUOHApAykiHNQI8vScTBVIAct8F7lM6h0UXvEHkzkEmqDPtL
	86G2G8tYU8GbxXJmg4ajCBGJmTNaeW0UzVhSm8QkxsePrjCdsrFuA97+RzoUQjTz7qsaF0O+g3j
	Q/3a3Us7xrYAhoXpjnhrtUsqBY=
X-Received: by 2002:a05:600c:8590:b0:493:b646:e90d with SMTP id 5b1f17b1804b1-493c2ba5537mr24039865e9.36.1782916214873;
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/10] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed,  1 Jul 2026 15:29:53 +0100
Message-ID: <20260701142953.2014895-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6831-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E5996EED7F

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs by matching the new
"renesas,r9a09g077-rtc" compatible string.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike the RZ/N1 implementation, the RZ/T2H and RZ/N2H variants lack
the RTCA0SUBU register. However, this register is not accessed when
operating in SCMP mode using the existing rzn1_rtc_ops_scmp
configuration, allowing the current driver infrastructure to be reused
without modification.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2afd8251c868..9469160129df 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


