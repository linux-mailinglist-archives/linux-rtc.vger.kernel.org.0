Return-Path: <linux-rtc+bounces-6824-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5t+UGt0oRWoT8AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6824-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:49:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE76EEF6F
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 16:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AFkntzGQ;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6824-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6824-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A43B2317BCD4
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 14:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C416346FD2;
	Wed,  1 Jul 2026 14:30:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014663446AF
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916210; cv=none; b=nz5ItmoEMcrW+ljC/C7HjZrDcTNmQUZ/BP8hJGwb1dfXMVCnPXM78DhzpnolPozw7Kx3gu9bgEfKPnH/p5w63OA8q8snM+4jDjJjvKyGA5UUUcHv1A8Z6144xXv0VL4+0VvL9KhOI1l5mgeWQfd9bo9hPVGPkuApG9N13tQvfrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916210; c=relaxed/simple;
	bh=0T8cC/hFFANyEgdwCbRvmlXafTxrOhEQzM04Qi4pkfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ST//ydA59FmIOkGPEXGTChVJIV/1LIZfrGFoiegxijyDLCcMGH8gXDF7av9H+SB56ILnavT/jYjtCA28MJyE+A5FRWNfxgb64jBTc0gn1V5QS/qiP0KP3vdzMOl/JzgUmSY9kdDFCnYAo1lVP9oA8+K9Zd3O0EV8Ou2kUoWEQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFkntzGQ; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4631679f204so1126636f8f.0
        for <linux-rtc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916207; x=1783521007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2n483I/Rl9OTXPEbvmmm1+9u73ydJ9A81WZb0oLTQhI=;
        b=AFkntzGQuqoAOTkq4wK4Xr1nknY7E4SNrN6CB9yCceiWtqCc/GcHE0YCgzDw+M1/bp
         5SA69MPitkHmwfI2TdSzb65IjoqMs/V+QbLARVpcd8eIXmswj5L0TBBMIVtDPM7yptmU
         tYouLyRXxI4V05+59cWJ+BKRxtPXn9UAzWa+VS1P77xwSH59PC78qnCO9tiLrtk9CTf+
         KdL7Ep4/he7Mz34HzSfhd8Pw1TdHtG65Jx/vD3JWj/vEoS7kzFzJqFHSAkBtVn2CCMxJ
         jqd1zm9yMHE+gMEgg0a8BhODPRXqr2gpCFVujwQiaym/wjAaOfFD58VbYWPrN6DlTOg6
         E+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916207; x=1783521007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2n483I/Rl9OTXPEbvmmm1+9u73ydJ9A81WZb0oLTQhI=;
        b=L3jm6lEvYMWlYkESTlI3Z3y+YJjzhN2WjWdYtMcwplZ71PCXQMrUm5ks0tlzSqk3im
         szZKrnGWOk7C7ta5oSlXzrJPNsR+cTCGHsZVK5YK28L7D8qQTrTVhq4r1OCHOTKVmgdT
         D+6q5D7eDeh6ML0SRQNIzJ87lX5NLkAUzP73GdqTrkQjmUwi3sTgpF5l/VD8WRvWLh+n
         c19St3spRBXK5msUO8HJXYkUOIYzL621BnkTuMoWm2dy0vJTYI/Db0TCwJb52G22iH0L
         DZstpq5kDcaqMIwn88bh93oawFazFT7zbcMaU0u5jPW7xd+AuEkmuh6qi4qP5WLeQm0h
         WyWg==
X-Gm-Message-State: AOJu0YzIMmiQbOXsKXOkBODYeVcpfYFGf4EcbvJRCfVt2BKGukZ000TJ
	shN3mLesJWY+NZUH1d8Qldwh/rtx27pvzOuZ6YljxsUCj526vxNE2rsc
X-Gm-Gg: AfdE7clvVY5U0hJJ5m35ekDBpSyHgV5UEg73sVuQMaUAypGjCxJkTLK6S/rZZXGZylU
	e/achKzdyRGT+BoEaw3m0IHMxobaAScUIkElavAgHb52b9T+ptY0IM/cbZjAERfllReajR0Q/EX
	lngPAwNUB6dMPcsvV4Q43hPKtbta69G6oMJPh+A23CyoHoXSEu8xHWHth9Ggl7APtzoBQPrYBAl
	mfIez5ejbL4k3Ddi6MHyMFZeWWFV2mFFMaXFA1zEnc8TvVO8oNSR5botO/oQrfMaK1oVGXws+vC
	gBRFzqPrnhwNTtDNhfnNgGyJPY/3tjUHEo5vOQ5uzcvj5xCXW2IXEu+3aI6EaCY2ieAiMcf1Ypi
	LqaoV957n2qFDD9C0gL/Ko6+BLMYV4XROB2G39KsGCLfeyAaMQb9elmDCL3wB2e/IMbLUszy+v7
	GOzNEum5UftGriCykIDKTB4guEMH3EMVkOj8KWKRPfr0jX5yHsqcm+4OKxgymhw5xCMqocSkp0Y
	T1hzo50vRWcGCXoceoeIm/aROA=
X-Received: by 2002:a05:6000:178d:b0:463:b7f2:cc7a with SMTP id ffacd0b85a97d-477458acf56mr3073152f8f.17.1782916207400;
        Wed, 01 Jul 2026 07:30:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.06
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/10] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Wed,  1 Jul 2026 15:29:46 +0100
Message-ID: <20260701142953.2014895-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6824-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9DE76EEF6F

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index aa27ad7f5941..d56be7314a91 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -516,6 +516,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0


