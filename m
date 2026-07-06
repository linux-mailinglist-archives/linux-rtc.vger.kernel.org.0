Return-Path: <linux-rtc+bounces-6901-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4UxXGbqAS2ofSgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6901-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC670F0DE
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=KGVSC1tN;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6901-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6901-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F23683157437
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66786430CD5;
	Mon,  6 Jul 2026 09:32:37 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C824252D3
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330355; cv=none; b=ZRcBMQVtuO9xiXG9NCTIRHIsRVEGPfjVv098ix4ZbKBo2yJrmlB+0EZ0wKj3k/n/sT35z3frFPwCf7lXAOz5dFZ3fMTOPPQNHBkwEOW3uclvxf7Mm56LHhZlxMO635Fp4GkPIDXfhzm1+TvNbWQVVlsb8fXrKRuWYK/sXWLFQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330355; c=relaxed/simple;
	bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxwP/87toYgZMi59MxrWflF+EjGwdmzuZ5M5NFB/yi440KFeMdLdap9pXygA2BvLzEHsnvC2jwd6FiXzG7SCZBhYyFzHzw78OyKyO8rTpdVkAcdqpL8L8FXQf+UF5dQRcgmODaGgN3+7zpTdBXKGUewJ6ye+T3yTgecknuHkbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KGVSC1tN; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso28947095e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330349; x=1783935149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=KGVSC1tN+8gP10+03qB+OMQ6eQux1yX3pR80elByKlQTEWvRb+UZfw+/h5oCKPCAfO
         LUeFkNS5HiUPFiRN6XLYd0fWgRjv43LqHtOHkdy9m+XtHPthcwXdO6hyBNDK0KvBWJ8x
         P1B9xWXS1RF1s/Qiow4AwEdgfEfV97qLo7ZzroDXd0Kuie1xwDAvbBxHYYMOyojdzBr9
         u68WcC1H1KVqLz6jF5Gvl3ETXj1Q1h9LB9RgFrRul+1BkiFUXFhKQo5izMJn/HPgiDwa
         qPbkQiLLjf7Tqni5afJJsUvYCk92gQR3yaI6m1j8m8aou9iGmbnjxBxEtnpDQDRdEFTb
         +Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330349; x=1783935149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=GeNa6eD84Al996QbY9gWeEx/UZNr40W4+DTOXea3AJLdzaN+j6mnt008JcJE1ax4JL
         7vUN+DEaZVMOJzU7G6bCXYs+92/WdaLa4/dhDx9F3dfch3LA8nebBaNk1rXs1IgHQERq
         iulOgQJhNwh5Dv+ja6GqAI0ttywEe8SeYnFMjv4l/Va6Pj/RCQVQIcDar7glhcxkOXGj
         IJ1CzeS/utuoDUlF5/LuEz43vHe/ojGJUuLVQqaD538PV2+scNoI61JkayGg1zii64Wn
         MWjA5DpJSn1VsOnWmO1ljmAY3pg3tTZSkkRYsZbZftm16eJFEg9UbY63dAEcSVM2V26j
         2VYQ==
X-Gm-Message-State: AOJu0Yyrbw4fbOnqBFXxqMIGnzUT2Idb4F3kG/uxY3XHY/U0es3VwJqf
	iAP3tMpH0mYlDZNQLyIeBUFJfJHji2kN7zbTZSNGp4kf3oKC7kYsW5ey5tvEYLZIGYM=
X-Gm-Gg: AfdE7cknJ4mRsxxlmdgQpJSj0Z4JcT9YmGX5SXsYiMnPv/USAAnyQoXBUrh943hkjvW
	PvKgrkUVjKKMrFYycIUwnuvrrIbC7QrtgpOG2QFXhERz1M3D3hU7f0YPmSK7qeRSsOI0k3N1e0l
	UkFtKFQ3giPSw+eD2crARACvzCfB4+h3Jhd9HRcU/3DMjvSrjfdeX1Dilk6aksaoxNca14wz/Vj
	pwyZ63BDSgpVzakWujpOxAbDdN5Kfr03aL6dUy/Ly77PZbQXb9KyrpeYOhlrExEyXHoKnaZgowE
	5Cn1tk26Eoleob1ItiuzPsa/rLw8UPBqwnb05nIsk29TYz1en8UKVxxD1u3OGBhVNXsntCUXnsg
	gGHQQlj3feacgEzssUTP1KNrjHTGZJFklvFGbSH+X9lCFGShsPJX2EyRnuZ/+gnAt/A66kmf3zQ
	07XHPenMUFH40=
X-Received: by 2002:a05:600c:524a:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493d11d7fecmr118661335e9.13.1783330348753;
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm20505835f8f.34.2026.07.06.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:09 +0200
Subject: [PATCH v4 1/9] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-1-f330728db3d3@baylibre.com>
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
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YgZ1kmVhbAFJg++nhyvscPyVSYf6qHpsfzf
 Q5jILv6M+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IAAKCRDm/A8cN/La
 hS2yD/9JC6LOTzoSad/DXBsiHV19K0GF3iopYtiTD2yka1JwfFAt56fW4Ql6js+tCDHjIR/8dNl
 ZCcQ37QX7+/ncxfGw35t5noFVL4eEv+HD0mAHkuiruSHXdtTQcc3TtTCtFdxRdg0WfjEIPUjCVl
 ecRZ3eMUxmbWUPEsSh6keNgpfZbmb+fow923az1r05IuTJZPvHCrp+h7kMHfAUfQv3jBW+Jitn2
 z1mXPL3Gp3GYRKAlruc7+fiwvN2dTZyzAH3v1Yzz+fLxz37C+XyK0djx/bbXdr1fLifB5rkCDSB
 14rD40d8cmUaKNROMLYfXMRTclaPfpxDyXldQLSn+0monEBssPO/tacKg32NUKJZ60Pc6oEKfYc
 tYxLDc0BE6z5jWxIC77CfkVuWwZULNDFT2BJPAKuj71gyThxusvr9rMIHlRu80ZFQY1xnZnOv52
 PBXVB9zZvmQkdbA7vZPwVVF7Rokh16UAHovkwZe+qOU99rQlDp+VaJSqXqYYqvxZTl4YE9Yf3N2
 AHiykcCHHT5HwgOsR/UlVThdLgH3dAvBJVF+7dnb+/e6T46AhEnI8WmeR66G8k+XgfXFh2ot6Lz
 wxebV68uC56VToYtAcrpAYtv9FpCPDy3HxCM8xErN232vbr9iAZPYICXQbCYACoOJTgIwdI/WY5
 /pSukiBC+wiN44Q==
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
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:conor.dooley@microchip.com,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6901-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBBC670F0DE

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
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


