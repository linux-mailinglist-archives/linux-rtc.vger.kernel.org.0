Return-Path: <linux-rtc+bounces-6858-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4N+nIkAeRmoMKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6858-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:00 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 235AA6F4AA8
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=nQlvWCLE;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6858-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6858-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AE8B3035FE2
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1678A420E9A;
	Thu,  2 Jul 2026 08:10:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD741C307
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979852; cv=none; b=U4UKAUjKI1gocR/nHUJV92V19JteunX1hpQnwDa2zWT0v233i56oM1FVJ7hfX7p2g8WM1v5MYr3i/5E/ZkwRQUclggSE8d/1AhiGGiSCzc4ij0mgNHEyJTFIYRxF9msmlxNZYqjyyDa/zQuWaGNvRuxdT6PJu6kyPe3Zq7+Xf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979852; c=relaxed/simple;
	bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0bR39xxgwPAlG7kAzjBHQNNf13t95FVvfGlY5921O6D6baMDJ4vUjybyprlUfYFePz5rDdd0HsChBj7c0FfM5FPu634AoKp1Qg2TtKD7FnaMMg2za5xpVbxWXpwLkqv/RcYTnVETP5Fn+Ed35gNiNXbdLg4JKN2yCyXx4H7vvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nQlvWCLE; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so1101487f8f.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979848; x=1783584648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=nQlvWCLEPlHDW/pUxu38mncdVLzDn6n9Pv/pyUqEW2loAADwDYlLTS82eya7dv1b0F
         1LnxN43oXYC5ygOn/YdX+f1VALXJo2k8QQf2WnUfz0JxbbfoxV1xJFQU/iAhMe7d9gEB
         LgwIw3clh1kJtsrcGsgCa3P91j4zQeOy8+IOWJYbQIXUSLID6BgyAIrMDLa9Ikk+Tnvo
         Kjl/KqhHnZ9OnHhLRTgIlKvXKrKzfsrs97AncHGtOmRqxCs5gbngLjrvPNE9Z8Pi9V7R
         azaccBga62+15UXUarzY3RkAqFz4BwYqLUhZjp5CWwOZgyflyYt0P16b6IiiFOh1bYoF
         zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979848; x=1783584648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=cinxr+tCEv3Qgj1uz1TRNAPEKyHuVF3phf6sU7YR2D5BR7VnpCNb3pflW/i62K64bN
         asgm6X0kPA32hUH3sD2OcQHvkSbVLCwT3ljfVJYkqwNfHdb32Y4yyB2Acx1SHyIraip1
         OpzGNMryuVgEgx+vMS8wsnzttFFBfRfuge5Iee2MvHrnKC4GRYNJzA57e1Lifi1iC/EV
         Yi3Y9rZf5JA4vxhQKePd6zRc6cFUCKwllphkV8ptPtIZICnIvwzp+GpvODWHmVYtXGt6
         KoZe8fZQbBK4jiIHxtk5Sb5pwdBu7QiswNZuYoJf1maDZ0IFGlCYEI7qarco0CG3u0Q4
         kqiA==
X-Gm-Message-State: AOJu0YzO909iKfY9IUAxhY/Ar8OlvSFR9aeQOVyTkZxlZAZAuyDko1GD
	YcBl+uEKH1ofm96un7YmbDwlVasSTpHwr2V0p7X9uwO3Z982wWKnDUoo7Xg2CTE15To=
X-Gm-Gg: AfdE7cnanpxE7HR7VQEHs0j/euLdwSrZEgWueF4hFSPrCesmAIHdxKD1yvSyHIJToqM
	DkDZOdwtWjtmLGAn30UE/YDlqOnMurA/DJHdzNDXj6cVsENl0KX5lXhRC9hAIj3ps3jnealCc/o
	RcK+rS4ss+jenYG0A8/EZ0NFFsbVsbbZJZ0rxPN7cxGzeFVbQ9jWy++xj7PlKBLCw69fFm7W0Hj
	kMYr6kgKpXD3HRj6/UHSOKXxyEPS1ExeN84RxZcdHpMEJpxYETf3vA4UPC0ehZCU5HqPpZQfwJq
	nNRVV6EhhiqrKP/YgNSa3nDBeypND8+4zf0jVqm76gMOf1o5+i6sv8O7oOn3Rl3N5qpO1uEbDSm
	Hvf7AiQw7CUIyhsyBLJu5wjLCSc8C81WBdRA4uKhFUjhlxLprjGRRa3hZ7OOUftpejD0uQugPx+
	IS3+bhHAHahxw=
X-Received: by 2002:a05:6000:18a4:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-477588e7d03mr7472094f8f.23.1782979847883;
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dd94c829sm6374826f8f.24.2026.07.02.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:01 +0200
Subject: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz3c3Z+CDWtJbpQmgihyGCywyiqoUE3JkQyt
 6xSTIHXDA6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9wAKCRDm/A8cN/La
 hev+D/9qqaYp4+SX4EN+QRwhZL9SKx/Rjuxo5TLCmPxSfNWP/r82A0hPjW8lkiXBaHr0JFpStVl
 jzHLZcQ93NroFjk9JyixfEnW2GKdPE/DADdhVBQBRnB8rwQxJHJWFuWFL6JrbU1MW9Wj48laRaa
 6cmou7Koc4vN+e9OClHXcB+Nw8NQ1okWbDUzwmbsZfMypkIyQnIPsvc/HX4u5tsUDCfVbU3x8+n
 iyPB2URXAHkgLi2muc2ZWr2FTnuSYE7rFOjsax5ymg7+CQzHWLED0nz8JFxqd2BaraF+Qeg95T/
 +fCm1g8Rjb4/vkW63foqIcmbd4PdtFdq5SPpcG5jWN8PXRcU+PrZ3gng3z2/Yl9+lSZtxJHplnG
 rM7K78UOnSYxqV0XZb75pVHjQSkgFC1JNOk+XtV3dTi1Oc7o21Twp4ct6qLAeJ5vV+WWYivLCPR
 t9TGq2qozq7pQPVtqppeCAXrgwi3U4O2bWOu3CYOv3ZJrVvXScRmFujVs8Gr5p1N5y4w2Rf9p/a
 3PKVMaOyiM1tf8rUsiCGqyl8HffUlRS/Ih34/QYfrutYr/EJfx7lTzxu6Guntcq93hoEVXn7vsy
 I69t0vQV7mb0t2d+pLhEXvDPk+OaCQ2lD2nOrPz0aMGgCg8r/ez2P+dYIfEpxKh5fqfbk1zpoqw
 3YvXKzSzMXDUKZQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6858-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 235AA6F4AA8

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

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


