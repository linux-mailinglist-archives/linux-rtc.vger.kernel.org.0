Return-Path: <linux-rtc+bounces-6902-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id San3BQZ7S2qMSAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6902-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 11:53:10 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D570ECC6
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 11:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=JcbKcC0i;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6902-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6902-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4426931DC729
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB654432BFE;
	Mon,  6 Jul 2026 09:32:39 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB615665C
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330358; cv=none; b=RxIMM4Dg52ABXnNAr63Or3NvuUfgIRxxi184Wr7CEjG8NG3Y0JoYlbKzYHZ2ddIcQqZkWYr0xLk1W5CtTHrfR5Ojtmhn99QwU9He0gA/mI8wq03aM48rwjoU7+J5EpzRFpmk6QMxxF+Zip99QvHADdCWf4ZhKmrVsnGpTwYyqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330358; c=relaxed/simple;
	bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+/SCjM5JoSwLmxO0mne7K0A5QWGl47IaeYrgJNu6mEEB0R/2WlWAMa4pUP3+KvW4UGgb/tNdlDIJ+QLSq6vIAulE9X5nJE2dPttwPnVEJHxuGFaWM7MZkBpVm+CPuzkxTxKBMJ+9i2jJUcLnt30adt+IMUpW8vpAuVxVf/z0mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JcbKcC0i; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b691cb44so19170605e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330351; x=1783935151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=JcbKcC0i07tG1RfyQJRF8IamZIa1Q+qCphPuDN86KHw35CBvvxXXuifVdvtlM7B8EJ
         jfghnhREBgD0a3gpzvy3CSC6loHpWQwnCib35owio8ALvtq9HyqEnSZDToYW7+Ucw6ug
         KyOWX2DRcuPh/hDhHwxI+x0wqf77hRVbz1U0Nv7stvg7krI5sWxd7iHNi+smDuVAi5mL
         lAy8o8WKDo+qloRzo4w33BAnCST/utCLi+mVDtstP3mNhhtUFMEDAFhQjXoUe5QbizoP
         Qc4Y49m7NjSwIGT511VddIRkdSCBe5cYZwCULPXp17EhoKRvpn+3i5hTrZnuy+qoAC1p
         VSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330351; x=1783935151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=g9C8DVMDHNVHEdwko5YQs3YOmLOvVVz7onzm8B/Bd4ptLcCwYpCeWVyHdyhcX454fG
         xDE50utKowe9LzYQvrigqi9/Qg23ryrB4e+QVtv7mVi+jdXe+Bldg1EBb4LIB02sa0J2
         MqPBmKVq3lpn2DiXsa2sPJQwueeBCntR/cRL+X9VgZXs9vF7gkMo8pNjTmsUd3JxEUkA
         EsxcHonyyMgbaTL7hx4pxP3JkuUKEd40iOdX4c8a2uINwyr7t6/ZRO8tyTGkn4OR5ftO
         lJnG5T3xmQQ7+1yj1UlMJ8WdgVSYlFTDHnGvNvXhtXz3TSlVe97M9NQ0EY053mJN7rdD
         COjQ==
X-Gm-Message-State: AOJu0YwGRWbzdmfIT07c/TLDm7dE9tNXq1qwqTIkDCWz3vgxJDJYWSMI
	ZmVJ5SWn8sDCP5Q3VkUcAlbIzLpOh002ZDMIOv1s+q0+isYJEXKXXO7fK56r4pWLDxE=
X-Gm-Gg: AfdE7cmFb7BisFZWE48jHeGQ0s42jHdxwf5Il75c3D9duT71/niRECHkOBASPCogiSz
	jrBGGfztFnN6WotNr/UGIvKt88xnu88uzbi88QnxLDkO3naVY0oDZQfBrDidq5sihyAv0OlfhBB
	dmh2UvTzelsJ2SsqrZK4FatGh6vH5Z0LQYLAHgbPsSVVruPJu941ce+Ybp4gOFBi1y+ccMsck5s
	6yXF8CQJAH4S4bGrIs7GgO8pyZG4EWxRDdlC76tl+FFRPviDtvJKnn5Lep2FpBdBqeePNYXNDsn
	LReq+vBiNHFtKDT1FO+/MjSCjZ4J5hU0TCKfBG1cy5hQ8JI9lkSMQaxbTOgiTDPKnDYuqR34JJ0
	vYMw7wWnT1OQfFLzpr0qaCkl1pMwnYtsFALUxxbpkG7dmBbvRDW+2aoE14LME/DruRI0B1SXWYZ
	V7vGPs1UtKBGk=
X-Received: by 2002:a05:600c:5489:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493d36ff89emr92048885e9.4.1783330350698;
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493ccdabda3sm274734015e9.5.2026.07.06.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:10 +0200
Subject: [PATCH v4 2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YhNvBcU+zfPLvtdyLov7LJ7ChlSqdXKOljM
 f4B8XMKRMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IQAKCRDm/A8cN/La
 hWYsEACIFKlVSVDxBi/xG8qljHYAcE+Vzkna4KsPA4H3Ghi9EhylEM/gfbNWGsdllumwZ0XfWsh
 G1Ym4aKkaadVriafjEMoEu1YTpCn5Lvm61eurZlkuWSbnw9cN+Ri40dA/MYxE2Na+MtQuDDJS+A
 GHRMZTGV+jxAUV2S+XCKaW/76TBfA4Bynhj5n5CM3fAsMdFUnlNoDc9btLmhXwyeVdGw/Caklfd
 MA1rVBuk9zkXDvmCXQbADSU6FGUj6qKNiLhgh0EpdU7xEaYq+fX/sTDHikjVAALxinGgs9qBT/q
 gtpMiD9mEiny6oclVQrLq0aS6dO34I2pt6Jsei8og6PyOqr0UMS3eKG8qtdx9FDk2ELORkR3kZB
 MJeXEqf0t1Xvt0fm3mYn57mhkkx5YhG3ZHmNQCTPGhL0Dt74Xoj/L/KcLZlVdhjyBLDBpz24GAj
 Mh50U4K5jDu6b38CSuWTm5V/kZ+p4OOU8X/PYg7pPhiK/Gp5j2YDo+DgAggzypTL2au/IJqYKAH
 rSioah1LQmbn2/aWV92ExcoKRLb6iwg87taBJ1keRyHKUVROjuCrElscmB51xVYZ/v9ahWWKEFn
 jI0YS8JdTMWVsvanDYbcg4BhEJPk+IlAMltPsgbQ4TmGcYzACxhMNZZ/UBZ2l180d4q+lWJLIWW
 PfbSdXBZmeKO0KQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:conor.dooley@microchip.com,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6902-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,vger.kernel.org:from_smtp,bootlin.com:email,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C9D570ECC6

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3


