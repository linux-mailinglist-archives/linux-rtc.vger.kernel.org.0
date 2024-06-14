Return-Path: <linux-rtc+bounces-1295-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B4908452
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EDE1F249A1
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EEF1482FD;
	Fri, 14 Jun 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eZIGcjT/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836814882E
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349593; cv=none; b=q/PIvE3wuQHazWqIz2rkPP+owoNHKhRAtQ5MzuWqrAJ61QDcDxc+b94WKVmnU9iDLq6UpJXgnHzgMB+F00OyMkTjRzL1LBuPHR2HfHNH8Pp5q9JETMxS9m8YuxV8o9ILh5JauYdOb45JNgyJrN4SuYp1DYsD9S0Qmkp5aBp8NtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349593; c=relaxed/simple;
	bh=SV8pS6B5PnXgvU2BmDoZgip50Vyfq6zDGhgylSFBbSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BiFQrWreZGBUs0UEYUsa8eurPiRVCX2E1Usca+DGq/p9ptm/+6ztgKIK05z4UBNQn6ZyEp4xZA7WMhXqW7VrLGQUXZqnL5DVeBqtvEcgVFhV6uW58IHDxWcALdQ73OTzf5u3uf3m3vnK07hIglzgndJXVARNpWmN/otg71mSjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eZIGcjT/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebeefb9b56so21136611fa.0
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349590; x=1718954390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bM7IjO937X8gnabRpqjs0dK731L6r6PD6s0e3tUxWg=;
        b=eZIGcjT/tXBTDpSFbMnJC7vtJRadnEyPfiFt+suPXtqHaZGkRoFqt+dXBfdZ3rf/3l
         +zSFJMN7oj3l+Da1XccgzmTmV8+/OiH6B7djTevGYIDjEcEpATa68fWgGztyOYMBUHaQ
         HNjd+XjDvgKM73ds/nZcRv0J7ZWhHAqq34cScvuXKWdno00CgXE158OGNmEOSOJ22kGA
         QGk7kowgmlF+bZWoKa/lL7dot9vz3v3CYyS2ANMtv7wyBRc6gdWPzNVxPRrLdk4BxGR0
         dkhK0RQ3QZqYANI2HuBVUqefNTAogejC9LrYHjWb7+IEwj6+8AAXYSQZbj1T+YfoyUBI
         h2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349590; x=1718954390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bM7IjO937X8gnabRpqjs0dK731L6r6PD6s0e3tUxWg=;
        b=X9vwH4mUZOyPx2A3suA3GrbzLPxkonznnh5DcdA7riZ8er85qexjowVgvWJ1dpddKX
         BUaq7zIC5+aiaWEJF+0yULRWFApqjYuZPAVyPxLSxMgIDBATz3SzPlWvYzcUFUKYjnWH
         xmCtYbpqe0hV2krBTOE6YHcbH1HYp4j3t/EO+aBqKSjzIaHof+LHY+sz+TLpd76byPMO
         R07rNwqI+FPFQ8eFTjzqLgtxnH88MjLuvpOHpCWxHuah1qKd2qMuyznpwjsaEjzXEuX0
         UgC+VopDD96nS2HhLDxwr4gb79ej94RA155fho/CnJx2L9qI++E5MGjRh0ymafi1KQVM
         vFyA==
X-Forwarded-Encrypted: i=1; AJvYcCX8jWRsQuiDy3b1QDXw49Jk2TqjqE6/C6l5T6pT4B99co+3RjyTiN6v77fMP4Cstut+C28XXkZl5m6LQbBH07MtbTeSIHg2IOZp
X-Gm-Message-State: AOJu0YzwaKutxa02OHpUQYw+Y2nB0tyU0Q3y5/bcweh9of6jFgrMqgZi
	/Y34lGKriTa+NC0hcI7qZZ4NPvy3wmRTl3MuaFQeYoEXSHpYjxi6Sn8c476p014=
X-Google-Smtp-Source: AGHT+IGl5Xcj09+EojoDFnxVQ2dpJru5796oMr1E1gs027Gp3zcO1lUHT3o5+u878fcFaZ6Msd17pQ==
X-Received: by 2002:a2e:9894:0:b0:2eb:e865:494c with SMTP id 38308e7fff4ca-2ec0e5d1179mr16614831fa.26.1718349589467;
        Fri, 14 Jun 2024 00:19:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/12] Add RTC support for the Renesas RZ/G3S SoC
Date: Fri, 14 Jun 2024 10:19:20 +0300
Message-Id: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-04/12).

Patches 05-06/12 add the RTC driver.

Patches 07-10/12 update the device trees with proper nodes to enable RTC.

Patches 11-12/12 enable proper config flags for RTC to work on RZ/G3S SoC.

Thank you,
Claudiu Beznea

Claudiu Beznea (12):
  clk: renesas: r9a08g045: Add clock, reset and power domain support for
    the VBATTB IP
  dt-bindings: clock: renesas,rzg3s-vbattb-clk: Document the VBATTB
    clock driver
  dt-bindings: mfd: renesas,rzg3s-vbattb: Document VBATTB
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RZ/G3S RTC
  rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S
    SoC
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB clock
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock flag
  arm64: defconfig: Enable Renesas RTCA-3 flag

 .../clock/renesas,rzg3s-vbattb-clk.yaml       |  90 ++
 .../bindings/mfd/renesas,rzg3s-vbattb.yaml    |  99 ++
 .../bindings/rtc/renesas,rzg3s-rtc.yaml       |  60 ++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  44 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  17 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   4 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 202 ++++
 drivers/clk/renesas/r9a08g045-cpg.c           |   6 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-renesas-rtca3.c               | 891 ++++++++++++++++++
 14 files changed, 1435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rzg3s-vbattb.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzg3s-rtc.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c

-- 
2.39.2


