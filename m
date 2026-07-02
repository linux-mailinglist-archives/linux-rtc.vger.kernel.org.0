Return-Path: <linux-rtc+bounces-6856-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HOgYDAYeRmoAKQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6856-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:15:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D026F4A82
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:15:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=OVRZlBRn;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6856-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6856-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6DF1302AF7E
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D9141930F;
	Thu,  2 Jul 2026 08:10:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F341226A
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979848; cv=none; b=VxvuVWeQV0XFfVcecA3JGUNQh/7SaVJFuA2wO9HO+NzobBRI211g8Cvs2oLFmJhz2/nfONgUGztUma0R4uxzHOYKovIRxupeEFugsfFN1Vs7WCOIHwdNNqClPE74ilicz12dWhhVDUF7uPnHBMqObdev0f9zBWq0plUeqnkUwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979848; c=relaxed/simple;
	bh=RpYgXqcHniaYUqWf8mxFhxB+KJLte7VM9Vj154mX5v4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jR6WKiIYx+iRL0kBHIk2f/PN0PIkFgzJUY0qCJw3oax3K0qXIUAsc19WbxTGPnsZvf3U9u4RW8/27H34D/hzXCVrB12PUw86VDrcUlTNxIQ+IY6TnbOcos6jFXDy9G2g+/EAuGenx1WWuKdKHliJQg+AEX6ZmtpgV1xVTElrMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OVRZlBRn; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b77b150aso12481425e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979844; x=1783584644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=OVRZlBRnalvMLBxHFuaf+SCp3WvQ4bKRb3Ti4shK785BbgngtJx2KMvAtHQA2STDcB
         DUBmuWf/VOm/EQj8LfYvaIPFq1RA/hTbKl5s/12cEZAQkXhYbl4bhk3ZyGeb9VqdjQdc
         4O/Ss6+fRLGSCf6p+jceU0n7Ax/uXV/Y76T7q6YGnnSir26qy22QoduD8jyjqgMcNV6W
         hxuvkm5YhFceJdY51MuEyz3RtZoG+wp3ZNvAyApjogz7YLNGsgK599g0HARj07RrZMPM
         b6ZB4Rk1N/09bwgbOZOwooCTjsC2sb/XOc8uWJKnMnh5N0mnEHOck4uHYv8OoNiUgLpb
         RQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979844; x=1783584644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=iOwi/9auVtQJJOZeRVXvjqyiro7H4ehve3qy+qMxVv+lpJKd/zjH5VhQa6wvZRjxQq
         wLOwz1GzbAohE3spcBmu8UywFQzZMFSv8qMeeMGhQBZingp9Sxpf0wMOJbEWK/Z3enL/
         /reHhKHOgr8XPuBAvFhRJvV2sXbMMcXcoWLCG9Nsl8KpuDHoslTfiE/42CXFVyYZiTdd
         /kfZfnG4DFEpXD+VXpojijzNFr+rYnZU7BEa0dy1xcMSXDT1R9bh+8bZ0mTCBXpR+nNp
         91X3Va4D5q620evyzcoaLaBtZ6nqzBfJJ1IZnrbEsWx7Gr0KiVHw6BXmSBwqZAUbnYAd
         4Q0A==
X-Gm-Message-State: AOJu0YxhWsXv/Poo0FfBrxj6OrkOKn2ytm7MfRIJ+ylqOmN4CI/fiNhW
	lRNogEZ6/Y2taB+DSK4yZDaoeKu0/U4ZZ0uy1SjXmPf5zErjxqigl0L1FugchBTRNaU=
X-Gm-Gg: AfdE7ckXv9yMhixnQX6F9HJ88kPvhW48yKaCi9sOXKWA22Gys8MLuWLuMMX1CiRA+/x
	/tkActrkVBtKkQIgrpQuiRyfcWOI9fokcrHwZzacCwAYSUzfixa5Y/wAXBjKI4D7dQ4WldRwwTO
	szGJLbDln0PzLhNN0j2yQqPpCev61fvDSm9q03n6JnwUOLCJtUnTBtPm2pSk4+lS7ssfG0an7iD
	nrnQZZSHKEsVpQsHzUY3G3upUbZoWNrXmLdBJAsQZjHWCbi6/8AP67AH7DBToDBY9IB2onRp8P6
	m6T2XA2H7Y3vlBe7ol1AlUH9VLTOKvw6QKf+f8NbMmnB09O4O2Z3bBFs53mlAfXJjVvmbhlziKR
	McB4fHkDLYyO2almg9dOpQ/C2BwY7pkz/im1oZNeE2Vc6ElIm6ire+3yCsG3t/xqRANrK8hj07B
	KI/DxlZgq56fs=
X-Received: by 2002:a05:600c:6c90:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493c3df6da3mr40899765e9.38.1782979843775;
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a4a09sm6872510f8f.13.2026.07.02.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/8] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu, 02 Jul 2026 10:09:59 +0200
Message-Id: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANccRmoC/0XMQQ6CMBCF4auQWVtDp9CiK+9hWLRlkEmUkpYQC
 eHuFjYu/5eXb4NEkSnBvdgg0sKJw5hDXQrwgx1fJLjLDVhiLRG1sEYpEWcvfC216XpZkSbI9yl
 Sz9+Tera5B05ziOspL3isB6JLjbc/sqAohXEGpUTTVH3zcHZ9s4t09eED7b7vP26UFU6jAAAA
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RpYgXqcHniaYUqWf8mxFhxB+KJLte7VM9Vj154mX5v4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhzxkwEf5Bdzyd27oCSpq4h7tdHUp+tEbg4VR
 Z0jNuLTPyOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc8QAKCRDm/A8cN/La
 hbuHD/kB91kHGeDducer2jqe2ndIa28Z2E/EheBjt2qp2JsoIigd4k5m5R75RIFmdlinKyJ1TiI
 0/EGurhWjxnk+ROvzRKA4X1dyoQKOH64035/X3k2ok+SSTLqtV/hmsHAr28/eBd6RyIcksBX04y
 YMGQSVUt/wJ7zlKSFV4gahC/Q7tCKyXhrVMJjrC/EFBWiERd79iAssZ9VgUWoa/j72y2mN9I5NN
 MmZQcWEe5Bco3mAxuSRa2WlHyepf76qy2D/48D2kGPXWlDrMRkVoyHN0FPIcZYD1DRzFbBfaKpS
 MZSXEL2AryzIqyTsMWYnQm5volxnyscBI93VwkKgyCTqmLNt9oqqII8TcLnzuh53v1MaXb00MuF
 ZL+XBFNGVzQHeeK7Kh8/2oicQJBRTzTPDVR3UJ9GTRtPPRWB94aunseTzQRvYiZdP9s43kNKJjJ
 WBRFSQqkOr3t66a1JA7MEcp7cud4aE0ydX1GyJ+DFIbDc7jZnJRq471IlGThknIkiYVAStm1eSW
 vYLP7PJf8DHwc/gI/3aWvidnfLbTw7HFO8q/vB9zHzzAAO+CEgfmgwbQidd6TJDwXdk6KcGuZNU
 lHs4bLtfnng8szELfr2T7oUUEjtYNij6faySFglDp+Xc9eaFgVZj1QJ5+bMQayIstSANkjs35WC
 EknFlM9LkeN26kQ==
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
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6856-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:mid,baylibre.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D026F4A82

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (7):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 123 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  42 +++++++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   3 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   4 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 10 files changed, 163 insertions(+), 43 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


