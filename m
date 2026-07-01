Return-Path: <linux-rtc+bounces-6825-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqKfEuQmRWqQ7woAu9opvQ
	(envelope-from <linux-rtc+bounces-6825-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:40:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C26EEDFA
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:40:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nNyZf8pS;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6825-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6825-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA823176609
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F80348C7F;
	Wed,  1 Jul 2026 14:30:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D8343887
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916211; cv=none; b=CNcbvqLvDoyYDiO/WGuwXZqnkHUlyyHpQLQKaI0ul5ME3Q9LCGblWsRrvPAB5zyTwWgdZEF0zxfAtmw+MGH17M9O0y7itHuSdwCEEhclL5fLSEkPXXQnEl1D0gcIyQXafmxIFy1OeIG//qgthTcNbh5SXq/DHoD2z/CR0Yax+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916211; c=relaxed/simple;
	bh=y1gUHIbNe+9KjDfOQGhoTyPNzefKQCJgWUCJO0B26ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6iU8oivfyN18M7JmNhHK+ISyZT6fvAPJNB75/yd9NSBeT0LdcIP+p7NgRoV2C8h3Bgt5GhG7s9sieicz153HYcx3HfKGcrL65JP1wkVeCovUgSB+Q+ExKDnLEO1Q/g4WgEtDSQFSjQMzWLMAL+lUV+L3O+EzDKmgaiIGRMumho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNyZf8pS; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so5840135e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916209; x=1783521009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLLnf3TBQD8569ASiK4m9KPGvM1NQaFDK7d0hj0Yj2k=;
        b=nNyZf8pSAsVY9B7uZEnlvH1+SJDUTk10qRKHU8Mx64dxR/eu9tLasvhuwkzcDWmsK7
         RrMNn0r7DvBmvoDkUpJz3KdEqME+Rld1GLlxUk7IXykiYrEoSgr/HKH52yxw7QMl00lV
         n6Lrwzz8FfIr+GdaXN11xiDSt3RYMs8ljwjvvhziMLQvOHdKFynWtVZcskC2SnxYvc1T
         CQ9zmWmYeSAONWmcawFeGjjoR0msc0grunnh2QRbPX8oUfzsrUgC7sGrtaz2U3Itt0Er
         s26mRrmZbdRZyOmB7mlv+oG8BPPfF5i47F4z9Cpj8Dd/ps1Zs8G+I0SUh+eYtdFXtSS7
         zFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916209; x=1783521009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLLnf3TBQD8569ASiK4m9KPGvM1NQaFDK7d0hj0Yj2k=;
        b=pRB2U69IrTzKD+5ASgRTDDMhJnsQ2q1tkBE6197arqYfDzjLPR04o7RO7VwKVzOU2G
         hZDI4rkB49iVyqfFoP+Wk3Q8s8QdQ1YZ7u6FFaDAAqOtxVOkdVXzVHZf0+uwB6Uv1pob
         g6Od6MArPBO0RUXjyA/7JNnz4YSuw9KFWYTHcYw0B/N7XZTKaQ0/9ITwYkw4M1l6Fwmm
         Ko7jmqDao84m6utgdwmzm3K2qr5nSov/4X4aLI+u/3+KvvYAnlAPt4W0j4YlghNYS/xX
         AliIYBT0YkGfXeb95PtCMRMMkA/YXnbtPkN7W4o4UxwDajOK62mYsBWIxO7oiFYckXNW
         fdbQ==
X-Gm-Message-State: AOJu0YwIvLP0XJeZa46Zci0roElPEhYtZEtrZdqASZGRx+dbBdp0BmFO
	8/dookYtnKWmUDElCFdD8IMQcSMbGtSnMyDZOtD7FlEN/h+ZVW4+Dkg7
X-Gm-Gg: AfdE7ckfT9HJpMYRxdzG92pZAe5Yqp/MbRkYLeMYgPbdkL1FDGUGnnjDchPxju0xzyh
	yqTHLfYJaJCSgUnAHFih2YdINQj7/f08du2pEweQnErIk/9VclF56yTNykJ7vSGuR9/QZJQTkuQ
	J+WJCntXoLmEd/0QkXGHsDiH2bgMekmsuXtBNOC0/J6XN4C5D/oFIEJF52LVPJOtUy8h81C9X84
	5jqoaQbWinVcJFTwAFyh0Dx2qzF8hqaZbgV0GiVrxplTwv5eNjjcIMG6QZsMXOMwxOYcs/dPwrt
	MqCV+YIDgB4QlOyOPqe4k8HCYtB+EFTUKPvUPUkbB7mLQnwx4YfBYEzEoFJw/v4DUZoirukQi1o
	KP/a20xijUi87RD1DA1bvPotfGoKj+Y8+YjM9CO92a4693STqOhu6nLcAj+I6O92/n2E8/djbAY
	d3u1pLjkgBv4srMSlvpyVkZ1zHNMdqdfaIorNU9QyjvYphC38VimNSm4hlCUdCp2Lq1L9KnLWNT
	gIdLRES22PECVdTEv//zRgAf1g3xdSlXCh33w==
X-Received: by 2002:a05:600c:1993:b0:493:b549:3be0 with SMTP id 5b1f17b1804b1-493c3cdec7dmr14805485e9.17.1782916208498;
        Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
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
Subject: [PATCH v2 04/10] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Wed,  1 Jul 2026 15:29:47 +0100
Message-ID: <20260701142953.2014895-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6825-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A38C26EEDFA

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the ARCH_RZN1 dependency with ARCH_RENESAS for the RTC_DRV_RZN1
config option to make the driver available across both ARM32 and ARM64
Renesas architectures.

The newer RZ/T2H and RZ/N2H ARM64 SoCs integrate a closely related variant
of the RTC IP block found on the RZ/N1 SoCs. Update the build dependency
and expand the Kconfig help text to allow this driver to be selected for
these additional platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated help text to keep it generic and not specific to RZ/N1 SoCs.
---
 drivers/rtc/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 01def8231873..d23a0fbe8d89 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1635,10 +1635,11 @@ config RTC_DRV_RS5C313
 
 config RTC_DRV_RZN1
 	tristate "Renesas RZ/N1 RTC"
-	depends on ARCH_RZN1 || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
-	  If you say yes here you get support for the Renesas RZ/N1 RTC.
+	  If you say yes here you get support for the RTC initially found on
+	  Renesas RZ/N1 SoCs.
 
 config RTC_DRV_GENERIC
 	tristate "Generic RTC support"
-- 
2.54.0


