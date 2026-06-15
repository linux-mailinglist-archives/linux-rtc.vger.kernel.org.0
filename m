Return-Path: <linux-rtc+bounces-6669-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5qYzBB0gMGqzOQUAu9opvQ
	(envelope-from <linux-rtc+bounces-6669-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:54:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F0687EF3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 17:54:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q4MnCh93;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6669-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6669-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F2F6322474A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFE4409621;
	Mon, 15 Jun 2026 15:48:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41870407578
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538513; cv=none; b=cGrdutWi+rwzYAdZqfyMxgljZLb4DBkr7d6Vy04xvXd0k6+hBaFfgGTyS9bxklqXj9+tkTlFKE1lcGXO2hF6JNZk4n4h4clp8bTcYvQiD0RF4daAEtQfgwyX4biixpdzN23/5kBAPK2V55cDK/hAwH+snn6uGrUsJ1XvcdFzmmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538513; c=relaxed/simple;
	bh=Gk/cPNPTDZkAWNymipz74p7wZWq4X8OMsudl9IitgbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuekYcuTkUrtb50ZXx4CH7PoXXA8LaLIhEliGB7kp3riR0+VUWiiM1QZqEtARmS1VMnT89BJ9pMxQRExlEZiQUp/gpOWRNWryVXZOdI2P4aZxefnrlh/UlXKAI6KiPz7hHyQw+7TQF5nbznR8up26I7Vmpx7vMX/ttBvKEk7AfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4MnCh93; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fe59255beso1881869f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538509; x=1782143309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9hQG1QLJk/k6gtdHr4QTzx1kFxzhJfLJZfPoGCSsmc=;
        b=q4MnCh936TEEJ4mH4z7asgg18S3Zd2MzhZ/pKPKK2s8/sAD0/tMe16++9sQ2kg2lgN
         o9QorLYaSnvFzc+7ly/g85IL8nJrKORdalExnLqYJorVhc8VTPILqRiuceQWruWKG7Tn
         79UkSZeQif8TmXOFQeHp2DOfJsZu9FJcZV3z2VWv6JXzvaJMrvF9HkgKalitM78ZeDih
         TbTZb9b3+RZrat9eBlNBJowcmqaMbb3zKs/Ybge2AKW90k+nO8kgCGCTUqVkpLGtKPt9
         9VtaAJwCARTley0TdoIJmeRSDjciLZHayeTOsaItZnLRrPxS/ZTDxJDZMCwZzZh9hURA
         aWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538509; x=1782143309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9hQG1QLJk/k6gtdHr4QTzx1kFxzhJfLJZfPoGCSsmc=;
        b=dtFdmwm2xqUN7eis+MOpJ/R8Acb7ouTqenFz8XVYFmMS+Y6ZeJZhamKaSeJyrhj+p3
         7OWoPoGgUFFCvY8UPJ6pB0+DQJJwfjX5B9wVqdp1+80K4MW3rOue+rhw7/l9NyVedQGr
         p6b5ElyhfEiV9P0p4fsGcPRvQu/LEwOX4z5zgxoWRyKlv0HucIJ0HGllgvkD1BKlnB5u
         cqkmuMCJ/RjtaspvbPO5jOJlumlgoFqa3VJVOIzsq+vH/puvfN0xk0eTH3g4/hegcb0d
         9PxD5TrF6xG2p8WPRhJbb6vELH91rmzZ4EhZ605v0z52+reLk9IXyYseRnJHtbOGqGsk
         EHqA==
X-Gm-Message-State: AOJu0Yw5DdRWXcd0x6GWPiRv2kIDz3tH87Y3E3DAwh1JOU7dymPJkiQz
	xZhDA3jk1BO3Q3xmp0hjB0klgTxK2P0N9szYN4Eh2GTCGQMoxEC+g9hU
X-Gm-Gg: Acq92OFK/aaNYr17doc5JLrHcRvJLzORdlsXeFxbCTnC3H1WpgeMX2Z+S0xJN2TZx5v
	xqWA7rgZnTXtjPy2fSC4crFNngP40OjBDYc0cj7fS2Wb1ob/HMgzDbg9AUCxKaA3MHn49aO9P59
	v+zVrHjR674Ai348NyFSvncjOieA1VbX5HAsQRZUsNQD2yWFPEsKEVC2Gk/lh8rN6E/BtzdLoHA
	2anS6xMsMOeA6X3LuMtCkrZOvat+SAmOV153CGV4AxzQu9dfenWUxYU3GffPGrArn9pB2rH+qAC
	0mR6UF4DkpzjGvGNNeraNylWkT7xCYIO6wQTnNRBOSLKl7QXLdef8gBJiWNw/qY4jgu6896gcek
	OqyFQlpK377snH4YYimXJApGCcbcnpsq+WQIJWm5V0hs7LqAdjCJ3qoEkvvfSHddAzI2X94HXJZ
	x9pWr9M8ZY/8Ofbp6CZ+gooKGv/HEn9v0cng3VaJoZm4VOIItmD0uxj4g8tnyEIZhG6hNnJty1/
	l2Ef5tUoTSijWuJ9sHlImexobk+VXspPujWBeK5ei552/o=
X-Received: by 2002:a05:6000:2994:20b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-4606dba453fmr15655433f8f.34.1781538509590;
        Mon, 15 Jun 2026 08:48:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:29 -0700 (PDT)
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
Subject: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
Date: Mon, 15 Jun 2026 16:48:03 +0100
Message-ID: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6669-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 683F0687EF3

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 25cad9213147..c7ef3c81180f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -477,7 +477,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
+		dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
-- 
2.54.0


