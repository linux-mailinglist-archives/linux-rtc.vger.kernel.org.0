Return-Path: <linux-rtc+bounces-6930-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tq3XKgfuS2qWdAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6930-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:03:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF37143F8
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:03:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=I+MxKqQh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6930-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6930-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 248193040F27
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE30434E44;
	Mon,  6 Jul 2026 17:51:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AC399011
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360314; cv=none; b=immE0EgN84o5DR9tSQ1WrbQ8tCxkysSRHZUhlvKT2OhuBdOD+XQ8Tv8gaA2Kvgs4/Xzmncd0uYOTda6Rf4x8k6M2HZIr9hqfYq6pQGq1wsygdLfQUz26kyiKPprOtUREjKRZ0gxeKIfd3qdWfymKVb+PmEv+rbmqCUhLIjUcn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360314; c=relaxed/simple;
	bh=Us3nB+m00XhH8cWc7W1acfoiO0j9gY5xSZ6vdTG1GQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKNWxMolv1ToL1ClC1+MrAUs30w661tKO+AoL++vwT7i4eiIR0qQdd650tgG/2gra7/TwrXur8zETuioOC1TirtHHXP2S7DfGZyTXO5WgvioIqYCqmLc6UXMHJ/7EkoastefuzCVYbxm8JDk4NGn9+Zj16xBtv/SeyA8+voVCVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+MxKqQh; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so18379765e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360311; x=1783965111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaY/L/tqsPL4V6P297f/6o8QOFru2yz0N5j7fKHXKvk=;
        b=I+MxKqQheJ4YDq7qYDn0lSFj4NVCrK266qNF3l1WY0+V82UM+eMolsDcIhPyxIWvbQ
         pS8Eq+pgUoSXQYhFPsY2DNprVTbAcxDgNK/Jl4TZbc6xMOof7YDRUo/AweITvu2GpQtm
         pQe4CA24EchieXVtO2baZmoH4suPcbUeZlDONWYrWxX7CztVTuiABxOVaHiOwLu+984w
         NYNJrPHcmEVW5sg5VGQaHe92dW4b/sRQr/WUoTHzJFpkY1QclBuetXSLdlm9WCodqWj0
         7dWj6ekWcai3UBmeEIJMESYpKC931H+wlb4kX0O8sb6/9RKihoEu3omDkilw6QfFrMIb
         tiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360311; x=1783965111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaY/L/tqsPL4V6P297f/6o8QOFru2yz0N5j7fKHXKvk=;
        b=L5KjPRcvI1wJMDrcAZQ0P9ThLEFwknRktm2C9S2Zik3HCdKwn+kJLLoIcxWPgtxqjw
         77seQdpkGHdp+5ty4sBU+xQXsD1dMth9BVuIIbAnxNnH0muZmJoYFzBY6+2FnjhP9WCq
         0EbEwhqfTus6lCdvJDOwVaMk0BV/J/8LIiWLXN28X1w2EtCUDHY+B/XOm0sqs5HU+9cO
         6hW6Swky+Jg3zuaL5IpYd9leFPGe/raEAWpnRkr5Vyu5BPbWCo79yhfQbzURJmbgquLe
         AdaFTkKEne8SnRDeJ00YGFkkdtnFL0pZvA0vqfA68ViYYi8rVC7vGvqtViCX/p+1vVtV
         KBmw==
X-Gm-Message-State: AOJu0Yz8jnMNJg2+wTxKzs/E7VS7PXF4TEnbrnGRTAy9sOTpEzRVBsJt
	adJoGO7shQvbEGcUe/BuWv+bs6U/jgnB8ZEBjW1+YUo4mJ2znIVaZ09n
X-Gm-Gg: AfdE7cmJ1onHsE0xRmHb+XXMM5yny0WcR6Ft5KrKWOqpKsAdDiMJk/+JVOmf0J5m52l
	Jxxys1IVhX2kC0jQW+cugvmKgy6ObV0b24aCCNupR0+wxf40HM0roGw36srvB2V+iZtjHIsA8yc
	+PYBjUIL6bqziGWmYfFFA4ZAPV2Nk58hXjSl9bmu8HG1bgFWVEg2kGrf74yNWvccxW1HKEunlIZ
	8xmmtHW+c/xGQpfnKZKo8uHA0EhPaHDJXcXB2B5KbJMHIc3/sxkyux4AkaTE67aRA72fsCTwaOZ
	N+FXcV/WSp92D7eDndsY79xICEBCw/THuf3l9xL5ywppScjJ7xH5u+2vFHx8WrQimoW9CdiS/C8
	JBjkJaB86v5MCKKVsHeIbneRzg7z7rtMNJsLNjWIAfhdOOAPkFCUg/1nSGB2th498LcVMtxeo7F
	ZG4iIjj5jhiRxR3w4mtvI+8LEv9UCYV18WZhkrabQRkpbM6UcXQZTmfVS3r2j0khSPz78qsPHo8
	f3+Q9+ABGe4KELWy4igsVFbwx0QHH8R29CDKQ==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493df04a9ddmr18480595e9.13.1783360311257;
        Mon, 06 Jul 2026 10:51:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
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
Subject: [PATCH v3 05/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
Date: Mon,  6 Jul 2026 18:51:31 +0100
Message-ID: <20260706175138.12587-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6930-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4BF37143F8

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
v2->v3:
- No changes.

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


