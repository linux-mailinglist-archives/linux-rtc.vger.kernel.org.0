Return-Path: <linux-rtc+bounces-6661-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KnQcEIkfMGonOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6661-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:51:37 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F6687E81
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:51:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sEsX57p3;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6661-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6661-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2070030FCC1F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C5E40757F;
	Mon, 15 Jun 2026 15:48:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1940758E
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538504; cv=none; b=S7TA5AoHK2PkntNFOsemW1DKhVHkW5v+zoGp8D0qdWfagGgWFRdAGHSLIMcVBNtN1aLR06ZHnm/9GCELxwIbAn27Dnzq07N3ua4YiiDDd4BAF0Rnx1AIj2QrQahIDzw/O0NEN/1R7jitpwQrraE1e7AncJle+/zg2Vn0ZQ31iCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538504; c=relaxed/simple;
	bh=m4MDgDNJGJh6NUsFNjQqW0yFQBUw3oV+QM5zFXmcAFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgpA7W8QtR47lr49nrn+5u6FbJOeoBjoASc5Br1RJ0laDYRmCI30EOG/MDfoyHxhukwsScR6gaNjpTKzFQ7AUvVYGtp4DqrPlFp0Vqwz68WaCrMmxwwZVfA6VQxV27J7dSONz6w/aJoxb9jleSwRLONxuIppWgXrDRJ1tUbrILg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEsX57p3; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeba68948so2621402f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538500; x=1782143300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=sEsX57p3U6qbYGqJ9E/t8LNvHVaYFPySd3BrjbvOdlHbS6KegTJCunI2kmHNoqf+1f
         VES6I+9A5YcOLxQnWalGVyUPbnXhFFCdtejT9SCDCPyYrIwj0XOkk61BOkrJ4Xwm20ir
         G07mTbYKaw1IY0Oi7t1RzXo8nHTAN8xTFvkKrdBPd+Iyg3GLi70QQ9mdO8DSNIB45wZ4
         xwRIbWTtXZ/00I70ZbQl5PGF+VuUi+9V3govbkIIsswprxfV76nJECgXp+4HDIe+Ejj4
         986kFFdeu56hjltso4Rd5x8Bca/bbjTtjnyhTifPz3wCGJjr1i6fKnXYR+8CRbdXKLHL
         GG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538500; x=1782143300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N45xHGzaBC8uEBeOLmM+IjqfOYO20BdZazBFDqO07Kg=;
        b=UW/ERwa/8GyZ5HNFEuMyED+KsLNN2noCM17d5Te79ZeDwDEEg9zoaPiekukW9bNH+M
         4uIhG3bml17y4QIsTG8WLEl8zIb/qlSRQSMtK/wjc/BMv5o320m/Y22wq3DJBhy9FpMd
         0zoqo7jSvmRXIagfHeZ20xh6TzmtNxIdxjRw9DJ+WoObW/LdZjqrYHw0LYn7pnZZwQla
         lC0ypLl6Fgqaovm+KHgDyWX89RDsTFPfihnHFety6p5FIAsjleEeSrOR1U62t1PiXZK+
         rTDSL0FAnywS8y0gB1xJJA5uU4lsPxhSDTlz1bY8OYBFw2uuHygn3sAJQobyIibrYlJ9
         fVHQ==
X-Gm-Message-State: AOJu0YylKCqso33WhRF7E/oi98CtG3IEC5eyEmGPkmHgpN5jLipoEsQJ
	vuvoPOHBPn4eFdz1tltVOVOQ03vqicRg7J8TFksrZGqGROj48VWYmL6y
X-Gm-Gg: Acq92OGrCXyhe/9nrMDUyAB0Real6dNtDucHkLjcYtJvo4FrLEI//1hTkngKD0L3w1h
	0nmnAtly5tp2oWEk9fLRhKhH2kgYUqn1KEM2Z+f0V7HwjBZ/Fl805pRaWgcQJJPEeXjWgKVIssN
	zI+xgEUZCrscQ4En8F4uiWvi1546U+MenYQY+GXIcBxMkowjseOP1jshCjMun1UkblsVwvVj23X
	98Kvio3nBMdXPbDWYMp7sXvV+oqgTEiHi1soRVwEEOO2C+6I16kHZKAqPS4vo/he5BpB10RWyyW
	Dog534M1RaEZrALzWG3maOXeZTzT5QP0JjsesChqwQoQmXdpHN8yW8mrUEDYUyF4ML9xB/HQY07
	RIlpfR9pqi/S95QHPg6sTo6BXT3MWFCF5WZ8OUL52Gbbl67TDVhuF47V4GLUbtIq31BqCn+dHu+
	g5cJ4+QcKWdnV9VnR9I/qofosb5QG7QjeW4yLtsQAAP/VjdLFHoV2GzSrs56VUH9uDrv23nadGZ
	Z+OndO7Nk8ItpVG2Fs2Xgeq/G6aLPE6HyuB
X-Received: by 2002:a05:6000:46dc:b0:460:18cc:dcfe with SMTP id ffacd0b85a97d-4606dbba5dfmr12896535f8f.34.1781538500271;
        Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:19 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Mon, 15 Jun 2026 16:47:55 +0100
Message-ID: <20260615154805.1619693-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6661-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A60F6687E81

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Check for -EPROBE_DEFER from platform_get_irq_byname_optional() and handle
the deferred probe request properly.

Although the "pps" interrupt is optional, an error code of -EPROBE_DEFER
indicates that the interrupt subsystem is not yet ready. Intercept this
specific error condition, assign it to the return value, and jump to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index c4ed43735457..f81d691c8b9a 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -465,6 +465,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
+	if (irq == -EPROBE_DEFER) {
+		ret = irq;
+		goto dis_runtime_pm;
+	}
 	if (irq >= 0)
 		ret = devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
 
-- 
2.54.0


