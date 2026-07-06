Return-Path: <linux-rtc+bounces-6927-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EhJ1DccATGr0eQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6927-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:23:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB818714EB5
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:23:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ANT1YiiB;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6927-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6927-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D8A3388074
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B00414A1A;
	Mon,  6 Jul 2026 17:51:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544BA3BBFB6
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360312; cv=none; b=MHiYoWBhlJe2AY4iquXuQeIOea5GTqtwDj6oOxun85b+IMrm3860p7utMBmEaEtLfnhQY8ra+dKNuwpKUE7zqGmO4tKwZqYetNWuC5Qzo1LSIl1sgz0/vk5PncZU+e5TCbw6nAO/uMh4ZJDuW29909VkeZeHxz99JIj8TyuPs7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360312; c=relaxed/simple;
	bh=YQQ0swAPlNYOtdSZVBJo7dYA9mdh1pilQAEGfbWdZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmvQER8jdEHJBCwK3zFJ4q5Z785istKrGGRMNQeArJmCGcaTfLTpzgMx5itQlNCSzwoJs7HHObQzcGEBP9SGYEP2MEo15A5YY93AHVmtKiKLUsuT1rzLxo+KepUsATh619m5AOnVw+6NkmAAre8mXgyQC5npv9oyrqjrVRjBgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANT1YiiB; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c83474ddso30174235e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360309; x=1783965109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmxkW83CI8zC2ie0tepZoqWs3zkGn93Bzp7pmV6Q/wI=;
        b=ANT1YiiB7h5Lev2+khVHRrYkZnBrcNOFPSYPOPl5cjasSdfYe9QdMD0ZqDqiYZeIk7
         0Fu5FyBVkLhfLlM/JvfgHkbrd+yQr02ek2I5Fkftaaxkdbweiu14ttOOymHbUyiymX1M
         6Ee4lyvaGNFRcU0uUL1bk4Kdl+hgCpwQoJZBRWtMUVm49zU5x5OkPJUZ4XnmQzHJ7F/J
         11+7cOh/QoT9Te9RvUHlv5+ilYEUXzVl8kkPJZ5BfUW25h1YKuAt4Mkj6mSEKAt6deAQ
         eiyXIidGjEpQxw4ex8upbWm2DVb5wQHFcYZMKGLJ38G6DD0yx6S9wMp+DmbEt+CFf7cO
         R2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360309; x=1783965109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmxkW83CI8zC2ie0tepZoqWs3zkGn93Bzp7pmV6Q/wI=;
        b=LnnF/QhcqkWGHKGsEaFDjztSADJl3fGBd4pPbkyviBVBPi/PY9H/cigprZR4vqivPb
         mP4E89IrlXBTU+0EVEUxngE3Kg9tq27+jbFzJyt0o9gyX1cja0dP18hdL4EcOCz9rLkI
         85q+sEi/7A67N2ArOd0LEuErsCS2HNRsF++XnWSWXT/OpkHbgbq8ZhKYbx4fRw++uxma
         Tsx0RUhzsUh6HqwiFmDioobpfsYVffACfHe5wZwNQjROzuu9depr2QwlpnKxUiLDGIBT
         kvqw6Slkdyer0HoqdNRsz8VrMjpKyIjmECAj3MDVWvmOgmd87XI13lVLn6hLooNMc1g8
         i6hQ==
X-Gm-Message-State: AOJu0Yx4Oc9oMhzhK9DXguA9rCQHlQPSNlPpmRsiswctMS1wLkBfYZwr
	uCg6ceAG8be6dPsFX6Job4KK38fvDl25vKomSYuLqkfJm6hSpKUFir0z
X-Gm-Gg: AfdE7clcoyV+5QJeVV4hNztYnifLaLIGuT597PjIDeh2rpHf5nUCm40iiBiOBv5bTKv
	emvRH5iWpIK+Z++wKYPyFdxGxqcinvI2JLboEFwGBpHVpsDrXo3uVtPn8gTzVmLaa3KKv7Ivz2G
	+mWdJq9l7Ge8RgQ/ynaWDIGSn0tjAxGLRYM8T1VSMONHeL+vyomcdeMxFAGWJ8fR1HO5E0t64yB
	WnBPSfekHVesT1n7mN4yJgLhVMsbb+EJkohvgU8CLZbDmOLuPWtTm0FKbSytXrHi/Rnxhh592Do
	LLr/w+uJ+RIgkSqaogc9reOeVDkL46XkaB4npS3X1EZiIGad9QKvCyynQcnkR4Zf/uRPPLy55wb
	TV6W+EZV4CxIS9g6yXGg2aHebIqoHBm2TGgs9Y0+hViq6x7+vz0Ra34yTu6EzDYvnzlqo5eE6xF
	/j9JrETeap+WoUWSwVkTEC3HRZ36D/WfaumiWTAlievRG9jazF4WWpOdf553hhP+90XCF6QbvBA
	IV+sY3tbHIo0/1Glv0j4tN85xaHo1ugb0K6eQ==
X-Received: by 2002:a05:600c:a011:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493df063da1mr19180125e9.4.1783360308698;
        Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:48 -0700 (PDT)
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
Subject: [PATCH v3 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
Date: Mon,  6 Jul 2026 18:51:28 +0100
Message-ID: <20260706175138.12587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6927-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB818714EB5

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
v2->v3:
- No changes

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


