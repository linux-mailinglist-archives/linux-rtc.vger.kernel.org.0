Return-Path: <linux-rtc+bounces-6773-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A8KtLRJvQmpM7AkAu9opvQ
	(envelope-from <linux-rtc+bounces-6773-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:11:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA586DADAB
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 15:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="G/3cVPky";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6773-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6773-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD4C533788B4
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2026 12:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DB2406827;
	Mon, 29 Jun 2026 12:42:33 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315F40627B
	for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 12:42:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736952; cv=none; b=o8nKETArakwysO1rnfWFv8FIsk/EDgWIVTHTmk4OwSdKXIjHxFh9+5YTmTXnpo8ZHWlmZQXfASj+ENI4oXGvssswAAgAET0bxlPVH23JhUOaU6qqb/Eu4r1QPqBrLUpglja54plY09c4fxesGefDQyfLutPS3df/ae8wqD1NmUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736952; c=relaxed/simple;
	bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5kazBTIjzpbIQZOydIy8pMNUnZuWlNpMdRi4WabxQ098gr2EKAa6ZvErtLzF0O31ANcn6QWKn6jeGegoRGDUysYxsViJ7+8eLPJAaK78m/YQfISeMieaI8hKc3bE3t/ihlwXkp3WatscboekvcXAgWqaqELh2SkCbxgEYXszjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=G/3cVPky; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493a287b8c1so10298695e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736948; x=1783341748; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=G/3cVPkyWAKic6W6iUWDAxwyTWSnVSxcsLDtj1wbmJRP2N2OE1KYFsRBmKVv/ae37M
         TQI591kLpEwVSb8n9ezKEsdLZiQ4AKwyenBHMNar21P2WGHtEE5CbLoecsPb4x7yQPP0
         CsTVCdhYJ0GAjpw6hEWgCIKfgfP1+EG34dnjH4Uhen9xTfU3rqGHGpFajNoTrPPtCJy0
         iy3PkTMUEqI3JpZsrYUvSCYQY2YAzUJ+dzBfH5WEYeKcSAynAhEcEioeq5vlt/Asat2K
         R5f7Ukm2OUIcjjDzIg9xWFhzZ6Fmz/uBn2WuE2r4ALlOK+WJVbbkaFIVIm393hPSTeTz
         XofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736948; x=1783341748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=Za57MD/4/7ryD42nuUe8ASYUikWc2Ry7KhCftmsYOGxnahhAsfBRs4XwIR9sBnrWCW
         p6p0IBYpLA2lkwMwwbY1Ir9Ulf/EUGwRLvXuugRilPuv7wAXOWXcDKc1Pxu2gHnzCaGP
         wc5sP5TaWk5RXpDpSKyY+cAKZrKyx4LFYxuKrP4obMb+2xbccibNx8ydGs9kSHe/45Ih
         8hwlI29Sp021b2fj6ZaJOd9ckK7bRlYq65Isx+13LYx3HW8FaS6FaZpvG+X/jUPQOUwS
         iJS05uNXV06W/sg38+XoPIXkiOpBV7Br1zcBbYQCGrOLwYUdh066SVAlZ71Wqt3VtwbG
         tgWw==
X-Gm-Message-State: AOJu0YyvpWDAOQzLLLRkyGFy4HWRWCCrYgkQOsl4KxmhjbfK41Gme1in
	doH3jrX7sxvPZo4Icw6BJRmJbGaa1sKgtf4vJNzQ+ZJeuPC9iZlMMtM9PWrK2u3Fk+4=
X-Gm-Gg: AfdE7cnFOk8UW6gIrSacj4lMj0vAOZvN1dBhwwgvoOwz0RJ83OaAwTpo0XqJDy6lxd2
	qzzG2nGmS+2frUSKRqh6eoQxxvGjOXjIKHOwaqCxGPE+N1vJwbkbp4ECmmaYHXf2qDjEIZKpYJV
	K5n4KJiV1EqOdnPG1ynj3O2rQrXU6fHC/cJRbQ7j78z8GLXdVidPqiGJRE4q4fCyXYC4oA9lvuu
	4YUeBDMZMrNPeDOt/YOd2wOSs9BgNrYPq0qZxedCc5yeX/cgFSi9V9et5Tpl1UtTVcZ4KcCm5vg
	iSEv/gJ9M2NRCUKz7iIdG7ifGDGdjYreoYNH9pQtHE6qT+G830BOmH7SP0Ld4wDMTKkmavkV6c/
	DvP0RUvpKYF5WOF2QZHRJR8i66n3VdA3taVxh/PZ25kW7xtUtmBUdgYufpbPrcVYZQgZRSAJ2pF
	jZvxg7okA4Qrk=
X-Received: by 2002:a05:600c:5298:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493b71ad007mr9854285e9.16.1782736948492;
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276368785e9.12.2026.06.29.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 29 Jun 2026 14:42:04 +0200
Message-Id: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1oQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 8LVc/WgAAAA==
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
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgsLZoWjG/cvgZlCtaTSQlyh40bTtBK3tPuD
 /vjZphmkpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLAAKCRDm/A8cN/La
 helPEACuIP0X9qjYFDqGAzbzDm7fgzSYec6JBjtuY8SIhaIYa+FNc9lGF1OgsEkoQzgfbdkOP7L
 zI+/prvEt2N7oqAaLUTLfEW6LGKu+bcrYgmFudS/f6O5MqMTUYzHm9/j36vQLvhydzF4f9Y1Pne
 mZZ8IoXTrAkhvwsa4JQhR0k2qI1wLA0yHyJY32k50Pfqvvr5UG8GDsWkCfLQABKIboBiolOpxQ8
 KTDpRZH/G145BUKyyagMGkeVJjIqHPGI97EieDJVkl4ozgdKCGPUbW9jKEkBbO8UXq5odYObgpx
 +g4ZNaU81kT23qb/G1MLK8wPSFSEVO3qP/JGIIrGMzbKcUrYISZHERVQmdnwuGDWetI0M9CdX2z
 g4Ls5cXglJRTatUUltpxUvfiJBP8UZiX/tPpfCsS1fXIWRRg2rsz3wHgegXmlO4YSkulE/8AgmT
 8jg8MIJ4I1EZj7OD7ZeVRrwCwpmEAC9ZanJpYpN7k4rgtjOcLgE5ns3gtuH2nKdi9s4LNzIPUqX
 FKIm/DC8C2DUEP7bUd+6P9M44r4sf31b/c61qZ3Tu+wqxYNjrCvJIdR6zl8bOuC1JRfKoyIHlwY
 YSpRwTACAPjGg8h7icf7N/6/xOe+3B4gBFtqLpqloNeIvlYEN6wkpek8vLlxSHunLzuaLec6hv5
 yTkIJm/l07vOsMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-6773-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BA586DADAB

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
Jerome Brunet (5):
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 124 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 7 files changed, 109 insertions(+), 36 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


