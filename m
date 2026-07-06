Return-Path: <linux-rtc+bounces-6900-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3uTIaqAS2oZSgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6900-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF870F0C3
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:17:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="T3Jl8/R4";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6900-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6900-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C045310F2B8
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 09:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD1D42B331;
	Mon,  6 Jul 2026 09:32:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39873FF88C
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:32:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330352; cv=none; b=Jw20xNbNDnfnih6o+IRo/6PlSF1t5Our9NZrlVyfZjI7xZk+ON8BxjdBX0QOBdYi5sJkv6btKaQygelKKLJylmpea+CegVYNoPNbGSdHTTUjE+XG1XBpVv44A8+lnrAsQlabMMktbRGh2aLmemDHQkSM3V6Kfwyj4jjz/NdqZys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330352; c=relaxed/simple;
	bh=7r6e0BxSzZOlBZqjxDeJNnpI3oGS8Amus0XcLy8TcCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIgQHpTBiCej/+xPnEGEo57GTZ74+07E7lckboor5b5t38HK9vJ6AbeR4uq6Xvg4YKyRWMYqlJtxpOse8X93sKoLFz+AUUf7sQGTmYBdy/yPWvzcBO5Dt/XM4LLtXjsJy77CzYTMV3SHFdM1GmIF8eyQL+2MZ+aqAq/RCCyMUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T3Jl8/R4; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1676433f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330347; x=1783935147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=T3Jl8/R4IPLr5Tw+3SBVP77UpW250ACk3oHQtzsolpf2a+aEmQtMNsNMf+5PKtbsmh
         7CrcL02SJ9Rtvp8zdUk9XEY9tV6GPadfOQXSfjxoaBYeyTUQlnU8DYHm7LOJqEt1H/od
         rZM1jkv7xDeX05VjEX84f6yynGHLucnFlDptsYtCeBkl4fP2RIlEMADGuOFufqpJr3Jm
         r1Kxne6QHNy9KvS8OlpDFNxwSS48hAittmSQ0Hv/YWZRQXM6LgcGZZ2lH3jkwSgFsHlw
         PeBG03fvkKfdGGHMmcFWDPt02ezf7/xKIsrCCWG1FMfJtKgMuI0Z8nX3DGC/PbNR3Qzz
         uU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330347; x=1783935147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=ic3SBFjJLT5uXWb6o3cUbE2XqY85nihE+vrsESaf+7Va7dkNK+JDfrxxGfxsDDfLab
         Zz7RdmeuPJjw69RSqRmd+jSjc6H7BrA/cVLkdLslgLsLQXFFpLCoDBOp8oavrqAcMjVM
         YZTNDDwY/Y4nfxl23GZwI/CGsr7Q0KcPDhHvEKFz2BdJfSAYR9kEBCrTcfBPsF8JnTBn
         dhfgxTO6zyE5/swsfiNKgM7QttbgSwwjoh9ZWo8VNcyWFCMcYeimt5ZIzwFjdcsTGRbg
         Y3yf9LR7QtrnN7mR2v2Uu/5hwDuy0FXrH16LgLz7Yfnngqxg339xCucr9ECYbY5qG55s
         yIOw==
X-Gm-Message-State: AOJu0Yy3A7cnYUcAfDtSriB/FYreqVZtKE5hyR7Vmwsd3tBDktrn8tbt
	zpjbBwzNR2BBADSlWC3QkYWa2uLlTDRVrd0XLm8lBG62rlzCsGWzdzpgDBmwEJTkdm4=
X-Gm-Gg: AfdE7cnjPKO06iZxKRb05qTf1vzcIn4cSblbvn4quIoxG7HFMiZ+ZBfFkOFyNEbNWYC
	RbqZvhgWuaWJhdxGQs1blNc0F/blixCF44DHch0Lv2y7Vg91S1a5pRWCta4fI5ccpRpexpG5Wq+
	0uk4lABXwaDed+s+GLI4XWjqSHrsS7EiFvayQeN/j6zRXPG9mIOHXQ5rvuZ1exqDUEp+Wcrq3lr
	vzcbvG56gA1XjHLdq53wBTM8eTyQhFOUFPqalEbRjGksphpPPv9EihfML68ZTZ7hB/vz9h/Ho+G
	scN7RJGEg6AvFPGYPbDQoqIza6H4D76siX5toqJMiFyaaHE7Z3Ks59ydYZxQcYHtHddNBWqXrMD
	8VRyX/+AUrDFI7nZATmYKrS+6qz0yoZ4DVAiiq6H4tcPPncqQTD9lKwlLwY22ai6eeS5W40kji1
	17rrgIFI+BJtk=
X-Received: by 2002:a05:6000:4288:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47aaa60fb9emr9104104f8f.4.1783330346835;
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d91bsm27289985f8f.4.2026.07.06.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/9] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 06 Jul 2026 11:32:08 +0200
Message-Id: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl2S2oC/12MwQ6CMBAFf4X0bE27LS168j+MB1oW2USBtKSRE
 P7dwgXjcV7ezMIiBsLIrsXCAiaKNPQZ9Klgvqv7J3JqMjMQUEoAw2urFA+T576Uxjat1GiQ5fs
 YsKXPnro/MncUpyHMeznBtm4RIwxcjkgCLrh1FqQEW+m2url6fpELePbDm22dpA7XCvhxVXbRQ
 VkJZXWD5s9d1/UL1Jg0Qt8AAAA=
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
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7r6e0BxSzZOlBZqjxDeJNnpI3oGS8Amus0XcLy8TcCE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yc0UHOfsE1Xd7pmqULYPfQpfhgD9Q5xOmEN
 5uHJa5XDD6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2HAAKCRDm/A8cN/La
 hYKDD/43rfDQ7Hhrw7gxzzrVsf1tZVz4a7BRQskWh9hyhtC2hSRxXyIZWkwuVHLY5ADWStB5wqu
 J8ZdQoEyZ3h7XAW1X49mRdaOQNwtXrI7tBgpAE1diKd23we1YKiala5pNFLlz54QG6q/h22M7zh
 tUt0eX+na3K+FvaOQq78QJyoMC3+egZZ+szZdBu5DdbwxoFwM4bw5TgfNQ6pLO5h/sPpDv4nAtS
 /Se293weQK5PdqjxPKtEqThTC5H8G5tLkxNj9cQr9/VT0c1Ix+5H/wyrBWpxrHs5FyO10BKp9Xf
 zogld4MWweZ17X8TsyHqcT/DnUmvgMHze520cGE7pliJYnv9cwlZfMy2hYwFh+a6KSUyYUWB7pH
 +KR4ju6NGz5rrad0bKpFXuc53E1KG34PwP/N4fAjnT6c9vTat4VOrwLZMGACEzCS0bnv1ecEfKw
 PTCfEeJVG7FYr6SXJzdBoEjm5gsy4DYWk2PBq+23Oid71hbBjv2nCnkwLOM2SOPLOuLjvNfx3gd
 71+MnfTMoI8RDBbl487hTBn4i66guUOJ+uOL61VDlcVdtPPzYTIH5rx/GrnNTGL0NxA5+25+uvE
 rVpm4ZQXHLxU3w/IVvdTUaNw/igOiuR1bqg+pmGW5bSQBbNlvghzwsHg1JNwDu5ohWx+c5gvS0G
 RBMfGm+SxJt4caQ==
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
	FORGED_RECIPIENTS(0.00)[m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:sashiko-bot@kernel.org,m:conor.dooley@microchip.com,m:jbrunet@baylibre.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com];
	FORGED_SENDER(0.00)[jbrunet@baylibre.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6900-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,baylibre.com:from_mime,baylibre.com:dkim,baylibre.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EADF870F0C3

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

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

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
Jerome Brunet (8):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: mux: remove unneeded export
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
 10 files changed, 162 insertions(+), 44 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


