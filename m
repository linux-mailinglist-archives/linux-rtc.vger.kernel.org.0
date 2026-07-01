Return-Path: <linux-rtc+bounces-6823-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YUwODvIlRWpM7woAu9opvQ
	(envelope-from <linux-rtc+bounces-6823-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:36:34 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 871936EED39
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:36:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qW7MGtno;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6823-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6823-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471D731591FA
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BEB3469E7;
	Wed,  1 Jul 2026 14:30:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11277342C80
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916209; cv=none; b=bFu9A9iuKTGzaZKbSzluXpEWaGZuFD8W9wnH2JaJBsVeuGDeMmrubap3Vh4Xt8FgoKPTJ9A+ne/XtlzRi4yQeLMps6pl6UOVt6vkdBp1fpRB/bxc++SUVDHnvBScjI1bYN5q6h3C2R/9Qc8f6BcUkzcKyLObIgfZVpKbB9WsdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916209; c=relaxed/simple;
	bh=2XW1YLWJizNQohpYXEK8jt76PjghRUYJEyG+o9IP8gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAcO+pq27ZM2+wz4iOPJxxTOYugcx/CaRx4PJlNeIZo03xr/QTbaESlLsgPfRRUd1IqClIPbcXTgz5Ktte+O73MlSkFH6O7JSnm760tlm8E3g9wlhgweBXjjSAoTjJ7XdcBGdVJLAZ5nWrH0tk6++/inL1QT70SUSwHolFM0hHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qW7MGtno; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso838929f8f.2
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916207; x=1783521007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d9xc1hK1wDKpjmJn7eEG84uycO+0Cq+uemYlSYPoc4=;
        b=qW7MGtnoSIRnZdpZE4EDjh7OoNiVkiGpHPxUsrF8tOeDC6iafI3tXWBWFNpapph4BV
         3yjigcYRCz7NAjkGQ53GBkS6HH7DZ3PHFltC8xl73yW8G0aQUQPVCe1N8vz2rSRvmumC
         Osf7QRZINnH6uauawljRPz5LCEoyz9+3bweasrXuLvyYQQZDFF9phKStbiC84SOrEmWs
         cR0j5wzEie2kl+A3oh8pJEIWMMNemgJUhOvzrtEorZw9OYmDWGWIWgh2GL8KbxLid4/9
         O6I0TNG3AUozBacBLrZ79GJ2inP0lVbQwbkMgK/mhDdywHEnYaHZnofG6vFKcl0cWkqo
         EMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916207; x=1783521007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d9xc1hK1wDKpjmJn7eEG84uycO+0Cq+uemYlSYPoc4=;
        b=IwR2++GxtQll5BsqxKN4zs2OQWozvrHxMHoWGFtyQY/39CKv0tlIxPO/isAyA7t02p
         IW90naPn95JDsC+dl+rnfpEteQgkf9eml/b6WU502b8RrhXr8eSY8D7r/TqlEKCJ/yHP
         jt5koqehrYNHy5OYKFcwrH4yRQyIptEUd7szhuPvNvqqFhKX42pDkFYrrI2mXw6/RSyA
         Q4tZ6Q6jPy3U2EEGXn/0E2XqsqukjVfAl11virM60s9bu101MP/XeeDXipt7fsZI2W2d
         bhS7CJuXglMGDf+SdkUKpATkZD3XnvXMgHrzFe9PNHvTDPFMw6taTZhfEjxJH37a7cTr
         Vbrw==
X-Gm-Message-State: AOJu0YyCSnXgmwbCRnztMXaaZcyGqGUJf53nlCYd5dSwVYtq4izn4G0Z
	5P4l2GO0ZWzPpx/8hu/WDmlC+cIduas0PTsvDZPKU4R5+IreJjBHxOtS
X-Gm-Gg: AfdE7cnI0eFdz0gxpE4eMDF3q5gAnxuIKx3jWWp0aw0TjgbRhMnaOQR1TaWU0BBa+c5
	OZ7ix33wk7d9g4iuLtE3ZTObOx10ruvjyRj3wyTxEnjrnUWUWPpb+55lkd2n1Z5f/Adv5nJMnI9
	LJ2OCH5a+Bwhu+d394KCF9PsQdpkwy9mlAF/XG57Xl8QLomcQjoNFVFLR6W7wMj8ptrcj/7164u
	dCjGL2K85L6EXafJ5nzayDzVvwR/ZqOTyZvLH3+qQhNF2k0JDqIhTyk8S/GeJt6rdWQw+U/rCRc
	qPmRdNGVEu2umeULkw9ONlfnkb/n8dr9k/nEtkVFxmVElBe8MyhGVDopj9E94YS9Gt7ttIo+/+U
	yQwqDQZolfVxV5ZD4J0Gs6tGSEpDlehdLahVVBj5Wxj6HYvfMTdNFbabsfQTMMQj7A2HjSxw2mJ
	erx+CQfvo+FOhO+zg08Pw8VJujIirIMzbpmkiwnu4CiMZgzgtoguF0DD3gATJAfZsVXHbfN9tui
	qngJJn9Zrb98WYuYxl4ZMpXqdk=
X-Received: by 2002:a05:6000:1788:b0:475:613c:c9f2 with SMTP id ffacd0b85a97d-477b34b0313mr1284809f8f.5.1782916206537;
        Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 02/10] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Wed,  1 Jul 2026 15:29:45 +0100
Message-ID: <20260701142953.2014895-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-6823-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 871936EED39

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
v1->v2:
- No changes
---
 drivers/rtc/rtc-rzn1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 305f10a8a85b..aa27ad7f5941 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -464,6 +464,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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


