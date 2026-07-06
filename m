Return-Path: <linux-rtc+bounces-6937-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EeQYFaPuS2rIdAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6937-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:06:27 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC4714465
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 20:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ViBF7r1V;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6937-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6937-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56183303BA49
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD54D43B6E0;
	Mon,  6 Jul 2026 17:52:02 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A3438476
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360322; cv=none; b=bczMrkjulSAqlVATGqg++ZQp9+1Qdzr96amMpX7dvY/an/2r9Ih5yNpTep7fj76mSwSeoJYZ0kH7hXH7dYV6wHm2OGQ0xoWoBwl0Oafpq/cQHAa98NCmovlXr8twxk3n3mgrczJT/JPhXZTNHfuRdezW4wumSVZc4TMUb9e0PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360322; c=relaxed/simple;
	bh=xfryxhlFXv/pRGHJApGFT7aCI/6RDj6FSvgBXPrMglE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6f/VuC8S9L4xCCae04Bo1OLQY/z3pYfEJ752udnzDwZJp0prtVuPHkG1QxLGNujLWpcfwl3HTTgtQLLQQl7mzQt+RmeLTm3l5aYqb60A/rL4NKR/nVcV38U+pQCP8bVG0Vw3gI7T4QwRC5t18kJLw7fUInuc9JvH6bmxBoEiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViBF7r1V; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1875000f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360319; x=1783965119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=ViBF7r1VlZquGSr2H22iKYAf5mk4q1yiS+3/QjHDsf4asxbenhz1VBtIUKA/V4eou0
         dHeE9Aow/tz7JJrmXDVplmT+zxPgxyI6k978swN5pzK6sDoWBFTPQjpWqn3L1E3YD1Cg
         YxpGo524pnWpMJHJrkizeQCgI1eBPRgWO1knuoIU7z8SvPPCy1JDvjhr42GMJflWIwk5
         6gj5iB6yIZ4JqXGtD8A/hSqKPVUiuJfJnqTiOSUHHTNKdAsFvYV9c+cUGH2K/H8+Oey+
         YSIq4ejlOpo96zSxOc8YXRPrjbXemjwNxKgtvSmHRzNP5Z3DW4h1algMCSOZ3UtzduJe
         F9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360319; x=1783965119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=GQf6vUTb11CqtqfIqZ58IOCSOj3hSYw/6a5e723boXBG9oOg2sPxoEHkx8doqXXSGY
         k0r/LlBztr6gWSFPsouCO7havW0vZG/C34c/l5w6rwXeLdV/xojWrxdlua+n/XR/Frfx
         q7n3vJMupwlBl78f9WtFvd10WeW2394d3d/VBllIgFN/Kx0nckDkF6lHGo6NhRzcDrWe
         UUX2GeZk8eWYP13uPZC6gMOmrgB4AFBNr+HOQl3JjS71OELz7RgOsg+3ljm6aaO8TcCS
         QL+xccTZAYDhc7tt6oWoQeMYraHAz2rIeKj/jVNMf6IXvYHBt+q8EtHzXOMMHe+RoJPs
         BIDQ==
X-Gm-Message-State: AOJu0YzAUKy6R7qcgzL2AEj+AnP6sWFaEMJhVJ7+zqOG59eZWPsVPrJl
	TR+jgPXikqEocXpcAIFHRpDqdw6rgBucmuqIhvAY8fno7wNgnCHsQtgR
X-Gm-Gg: AfdE7cnHSsMfpb9g3vlnoe6/Lx38sv1zouKXjTB+9uUMqGk0pEoEYAyGcpze744837d
	Vkrcf8UdVrvJWpy4POc1JxYN1woz2QEdDsQ+hRgr/atqDsidS4hSeb593s270CiZg7pYp1raDMh
	8ZouvJAEn3hUf7PB9MM6IqdRjPd859I0d57eqIMYzi18ZxTm5xXWDO+UPEOFhrpB1Ejee3PUGhc
	16tdhiSQ5k6ZvnQfclfdlQrIpXXFTDiw5oa3s8vSWS+GGn0J8oGDlpSiXNhoPZWFox0jDUC9sYX
	MH1juLbyBqMzO6jG9+dBFp0ea0BYfECIXbbGKC6hiEeesfMLoNjNvu76G+sKq8Vw2hxJPpJJE78
	EDZYAFjVFdy9wvkrCRUGAl36qE4UsunCKA6bsgl64YLjwwiaOldVZCwjcDWm62OTQOCcyrgKSGk
	rOzptzbOQPzFm8mR1z3hd7dH51PC4bEumV9VkgcsNm5pJ5M7prdvjR3IsILYaGsvfoxElmM9+s1
	Dl63o/WSraG3zpchkHBOrtbKJo=
X-Received: by 2002:a05:600c:3143:b0:493:d800:204f with SMTP id 5b1f17b1804b1-493df0a7521mr19475945e9.21.1783360318961;
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
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
Subject: [PATCH v3 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  6 Jul 2026 18:51:38 +0100
Message-ID: <20260706175138.12587-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6937-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,sang-engineering.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4ADC4714465

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
v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2c3c82f8c693..2a6ac98a206c 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -507,6 +507,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


