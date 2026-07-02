Return-Path: <linux-rtc+bounces-6857-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16eGHKodRmr0KAsAu9opvQ
	(envelope-from <linux-rtc+bounces-6857-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:13:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E79476F4A5F
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:13:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Z+AyNf5l;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6857-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6857-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8823056A91
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13021420E79;
	Thu,  2 Jul 2026 08:10:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695854189A5
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979850; cv=none; b=HQA0VuLyh4LLsYE2etfsJGbX4vWmY+x9Ps6/OR+c4oOmCxW72Dz6tZiROSJmppmjm+B7IMfjoZee/x+wasJn+k3LgyOtUXMdhlWoDh7zMndikc2M383dU7WI7j5Ym+cDcVVao9p5M1JNKm54khdjfYygDAgD3mzxY+cKu4kP+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979850; c=relaxed/simple;
	bh=0RrokHtYa2cUv4xV/HjfdQdge3X2ED1AmM/T8cwvnI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQX418j3G0v2OjqH7xTJrXUUp7A1mJNg9FueMYnG82rzSdEA++u8Q16r/BoONpO+1Z/GQnt+82a0d8IjGsLdpn+XwSHBiS4949xPbpIEq0J/AMzbiXepV2xHkx4FPoJIz80Fa8CnaGcT3WLEc07kucryP0dR4FWIy1vB/G9r3RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z+AyNf5l; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476d8e647e9so1432157f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979846; x=1783584646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=Z+AyNf5lEUjIOh2cv5/Dz1beFEy7GWCRBmOAvqlTdtWQIovBobDWjO8141bekwTJYO
         VUbTORa/7csr/q4Xc4KGsCsRWYxicgYrpWiV4Q7sieCfp8nM4qpqRJlgoPLpQXjpZAZ0
         A3dA1oCGu44CjliJB3uuifKdKPviGySsQp0Uj4DI+YC1ufg+XaGNtj7vgH3uS0Yg3Li1
         GzRs6A1yoOojXaSSeqBlBvqDPfjIkm3ghMF803odZO8vZr9XvJPgVQQZ2wz5fyUEongq
         nfGO+ihuvhbb8VlYBxtZ2yHTQOipfzPZBs5sYGcwoS+6IGiqOYmgcab0UpXH43+qXjbs
         rjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979846; x=1783584646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TYGMlfq+GfXXzZc3hVZ9rsCaJpaLl9f+A3Em9EwRMIA=;
        b=tTF8VmX7vYsiTkUkVg/i1Z6YCCUosO6v5dmAd4WFYCfCcMQUdrRKIAlsGeGmaNttHX
         Jajxa4xb2HdXdDiVCx1Tua6puIphQgv2qJGTO2iRXtNkhH2CgYJTCV2rdzY8rUzg0Hkm
         yDKLTbw3acn3h2EZg3hOVvUoZtlfrQl2Z10DRAw/2sX42VtlQdOtpK4pqAcqHJ/CvWw2
         dck8PxtU/GIrWzTU4FzSgkivJ4oKCQdkODLQmihXqy+uE14gnTSz/kErKILdYmrkeuqn
         MZRITcjq9Big1ZBm2GMSPUaLAD4PG5vbT3I/Ef838h5lRk8iSKkn45DIHEiflzIopcUN
         vd5w==
X-Gm-Message-State: AOJu0YwYtOiCxGsC4CAXpZSPUVCc4o93aC96yCw3CxVZMy5qWEZMR4vp
	tospHxakZjuGHpawo6QY5PB29EM1oqbMHtLUc9gMNv/Ti/+SQkcYvsebgk3MB3lRIqk=
X-Gm-Gg: AfdE7clVpMgQcaQcqIIbrEQ3xzBwLTqIW37ctZxtMmFyYn3GTA4GW2cAIY5UT2lyMtj
	u1WyNS9NN79PctBRH5gBP88DPuLfCBfFlBsmHQCxjM74wK43hUKNO7bdUp/3komO5W4jUlZENQ8
	Uxd9SsEt0jAP7gDbeeoVR1yFv7WcWFRT4i4qHI5CqopZW/2zVHomjwHtHvJSpocIvteiiBXF/jW
	vTpGI769j+Tqd5KpKQxP3rYIOJozs71yIfxxmBhMCIo9ZVuiVyZ2RR/UKE+vKoPxLN3WzUfXgM5
	xAUgAXtQAByMrV0KkQwWKtX3kjaEtX5frw3+RcnRdTTBdxLbtyxV6rAkBK1Mp/EDVsDgu9+Assg
	imAenVpLQPkLEoYkCYW2MIFhcBy0VGpEQNPD6tAd9dIOFQAa2RIfaSHE2jcxfmWB+pToptj1Q3y
	hJsv2DMaG5xPVqi4H3YffnuQ==
X-Received: by 2002:a05:6000:601:b0:475:c578:b619 with SMTP id ffacd0b85a97d-4775bd0ecf9mr6698699f8f.30.1782979845774;
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477de3dd46asm6536252f8f.36.2026.07.02.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:00 +0200
Subject: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0RrokHtYa2cUv4xV/HjfdQdge3X2ED1AmM/T8cwvnI4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz2fMF2sbd/orrOrcVKsxCiTA6ndgnw6zaG9
 gF/0t0uH8eJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9gAKCRDm/A8cN/La
 hZHKD/9Ta2ZnK32lHMVoKaep+EmFCig9bncFhk9h9fFDao10aAE8gADLH1+PGGugqeUWMjQqMEm
 AC+KCbuiAbunDWvJy7SFsEIg24VljmT1jCYsb1Pb2zIcNCvmIevcWSEG1mHYPZFLVvtNC0FGaE4
 U8dfpLU8EVw4V9CYpYOHJL5h+m7OQuj3XmhOCrt9m9h5AQ3bJ0CjHhZ9G7vnXcmI075jZl9PctP
 nhj1RCC+Fn9VPOEGBdBuM/ck8l6KKzu64UCJ67YTWch2/STBZMvdhjhLpr7JQgOih9K7ZQbX3QC
 b0Re9Wxuy6HqmKb+cCBASAuFEnOUEXW8ErKD9/GDdH7KIKcZy8PNlgrtcbicP31Rx8EDCme0ndR
 TzuPFzT6iuVJ4+WyIJHLwypT4Q/VKl/3iOrB6EJ07PC81E4GSHAvUQ1xhAYs7HuTUMjviDnu4lG
 iHRlgi9rKfnXjQRwH4ZMI7cd4oF4w24b0bZW4gdb023lqmtml5TVHGw51QgShFWaNYsIaNV33Rf
 b4h7ldNt1wZrf2lynVLBMs4iVD+Z8k8902KQ5sNQpgwpxFxWqmBYsHjN71NSY4OCh9gTk/GKT2+
 WFefYnLwMEdOO6L4A3LXeoY/1UCryjYoOPm7YzQz/2FB9t+z8CHv015xBiQZkqVtedcPcujP+a2
 xRBrmiLz4T9INZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6857-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E79476F4A5F

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3


