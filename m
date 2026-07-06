Return-Path: <linux-rtc+bounces-6929-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/8uOlnrS2qFcwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6929-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 19:52:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3677141E4
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 19:52:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N/TxWyXi";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6929-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6929-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 572663028B02
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDDF423798;
	Mon,  6 Jul 2026 17:51:54 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FD3FA5DD
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360313; cv=none; b=OSAR/J5jQv5YIX+Ih6jyQIl/DT7i5PdJQ5TeD/XdeScNZ49ULsxQySZ1hqyXCjXuhYhZZ7YDXHcCxrjDFNBezU/owE6kGhkx30oil+JQjSix2INkMIvSML2NIXxiFDZcPuGtZpFUrMDeHPwRXA+vfLtYspJ0LXnn7g/3YKg7Z/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360313; c=relaxed/simple;
	bh=e5/5sHmL6JjVT+Mei4iKzqoEh5okE89N+VpCFX3rIM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+iBiM1Q+935YxGye2BxPBKHQmMJgZz6sfarYCzKXMxKrXz0qeHpbBxSb/I/T5zokHaccpyH+XzpI+hzijSINiu43s0KqtYVQ5/GLnNP/giszCty7GrvRwd5LIUUvyeS1HeKc4SN5bbYOzt0vvjRVkbw/gCFRg+QJr+LUzMrK2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/TxWyXi; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so828875e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360310; x=1783965110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=N/TxWyXid+AmUF2eG2TsXzuL7eg3ekyouTN+Ud55u/5ROD8YZh6Q9QTdrMenEfs4gg
         cd1uwX06QwicD6HEoKzrd0IIo00OGHMoxzRiqtWlk9xhjTz6a7z/9XJqgfKkyJF4m/Kw
         jJFHs20gtnM/m93VIq9pMOcIxiiGqhEobYy7aLIRPkEgfLkeaX1GjGko7aYPUEN6isa8
         EmkiLuvTGaZY+swnGa2VM3iBhLCM0otASqB5DkCgtyLr2jANlCnmA70sJ7ULdAX6lhf8
         0z9OLiIOgv9oclcMewq/cXGhtAVygnxejZXVJviRH/tvTS+epmrVBOD4dC1y12HMgVYJ
         CSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360310; x=1783965110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H05lYk1vPsppXSmFPZIXLWTRe3vdv+ynA12o6Ofyqto=;
        b=XyeAiz9xx2u9OEpbDuQyrviQiAA/OA/NOETygauIH9h78XxehGGxJXbn7rh3ywALwR
         1R724haRSLzEmIX1Hsi6vGseUZVhRZgYNqjQJtnZpzN9FFgBA+IP48E6g+qYT0dtF4p/
         i0FrVcrTmJ/Gcd5DD6WfrnwvSeVDvUTrCy2N2Pdq1ArCBSBJYfh4Ds3W5aEUXJgO6ALc
         3O7vF+HyFVEtrYb6qQ+2C9xYblKep0L3qACz9LUtJWaB2Pd+0BIcdNjtlt+CHsXac0y4
         ZlkDTfYkP3hct5q6QQN2q+MY+0sYMEa2+Ym7MPQPfYjRWQbKFZ2/rGYcLdsKu2u3oy5W
         459w==
X-Gm-Message-State: AOJu0Yzn1f0pNHdZm993dFSI42JlrCHLG8+usTfvOYstFB9v957cgtqa
	rrZUtnuMjJUnm+CWoQNBMoOMU7mmKT0XBy9tD0leiIhYfqm30oFZcfg+
X-Gm-Gg: AfdE7ckoRvu83MEHVJN7ODsWFUBskkHL4wl96DsdHNP+8fwcLcow4Jw54yHIDCY35oc
	jx+t8dGAdYH01l5AbF/M6HVcEWR2chRv0k09vyqYOnV5YYRapLVKKmpjrGs0WdVv+0HcTcj67WT
	7SoQ/FW5oc8o3TEWN2Fy3GYD4972AYLMIg96Kun0w9ierUvaB5+Ogj0HVfbXnEFzaeEm1svsrJF
	GgLbf0V0w7h6L3mQxWF/UfJHUOdTKLA3wBS2qIdm2fSfTiHi4RT2TXsCPlbB5gX67mZJvTQGpM6
	Sk2l6UPh6a+oERcJM6pyn3uqYhR4d0xo4Zi6elh/L/mHOhxTu1vICWD8Z/H/nKweQMRrBnp/FQU
	71jRFVWV6vUJUgEqOOrGBiUbKN2j2snQYftHV27N7u8UmQX1RFjG/5HfyhDx0ubGkKGrna5g7w8
	/S8GHqNceT10Om+/LNm/w2kUl1rjzHOR9SuB9JvL+kUvLbUkgDJKsFbCkXTXhc5RPeHEHCouSGK
	vQm+QtbYM7UiQeMMSiZO7BjaUsS5ANyIM+tFg==
X-Received: by 2002:a7b:ce08:0:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493decf58d8mr14260175e9.17.1783360310505;
        Mon, 06 Jul 2026 10:51:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:49 -0700 (PDT)
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
Subject: [PATCH v3 04/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Mon,  6 Jul 2026 18:51:30 +0100
Message-ID: <20260706175138.12587-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6929-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,bootlin.com:email,renesas.com:email,sang-engineering.com:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C3677141E4

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 3c83f95c18c4..2a0f0362dd52 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -517,6 +517,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.54.0


