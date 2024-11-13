Return-Path: <linux-rtc+bounces-2544-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226359C6AF8
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 09:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDCA31F2360F
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 08:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E769189F2F;
	Wed, 13 Nov 2024 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="n9TNYCPV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4F175D38
	for <linux-rtc@vger.kernel.org>; Wed, 13 Nov 2024 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731488066; cv=none; b=UgZF2P6xNbSnG2MqFmDmAUGQdefZYeDoVYsoGqKI58ND1BzsNAtLAEC+nhQA4/uHUfFPk1PH0dfPlboc3hutCHSMAHXCy7q/N6d4Wlc2oRqZW2Ffp+0sbrUgJm0M8HZUBGr+XxA0vv/B/8jW5MEXet2sIDSwq+q7vU1jCxaPZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731488066; c=relaxed/simple;
	bh=OMu7yCjpAroOuiiXCD4laEc0OX5J6ToINom0HQ3AlUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGDAHLtO8POSKWd3/7Nx50O+5OJTjjSLoMM1OpBsjIuIGdfnxEirHcsPcROFeUasBupkOB+3ynP1sOUeC5LKjuT0fAh2GlR0KF4ccN3AUBGWQH5X10Xeqpw6bOIwWNDW6qOKFHvsYZQQls7VXdxsK/hCVbLdUabY3efJmcOZ8wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=n9TNYCPV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso5407732a91.0
        for <linux-rtc@vger.kernel.org>; Wed, 13 Nov 2024 00:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488063; x=1732092863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=n9TNYCPVaXCWdunHwvWZpx56Gv6ujeiJ0TV9MwaLiP8SFAyn/7QuzVASU6qI429CGj
         QRAsbYzX3aeedO4fx5YrcNYUUV9H4/Og214wQiAddsZ9KMFO4iu/XDMrSw9Q0HS0fqZV
         82xL3rbdbfqWxOppe5tCnGzSu9sNCL3ADHl6xtnMYTKm0AEZ/N7JwmVPzVCvYERMg6KN
         4R66nao6zVh9c/kjCU6BWmscd2GpDD8uDf4aRFb6vHoNl7KeR9GbleHKKSEbviCs/e92
         qhVktW/ouvEyjlQh13D6ef2inM3YNR0zG+MfTOuCprzlirP8reURkKpaBZei4J+D5VBC
         5pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488063; x=1732092863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=ChKgx8gVKYyFseZXZ6LJNcAN8iIMXNPvporQv9p9m/k2od+OxiP3eOrhdjOUGqjt9x
         4t+5gN9CQYjzuQtULeRMQTwAoXcx/dxnA+7ZRKjB+Yuu1lMDvI7U9Z5XuqOCWdoZADru
         m1uAAZ4kCfTTdPRaAbCLgALTPWjiSWLQokNDaN0VPBhNqPgGkj4MJhonXU7fl7J437uT
         W0dHPESlHZo0tWKuijFXkvRgZ/yWr76o3XHkipO5h88fyWOEJBYmnX/1V5mGFnvbVPGL
         Q9YvENXFycPhLXp5aCGk9aw9L5Xr3MFudyaIqttDmrdFwMerRYcUuwyz8JiuirVN0jpk
         7aOA==
X-Gm-Message-State: AOJu0YwN6dRxBzMr5fv7mF6UhUs8EMB3v8Fg5bA5XH7T124kzpk7HiOF
	RTszrzm+h0al51/sskt8O00l+cLiCPzzpW8+k8LzGX6ZlCYkwb+sxdRS+MIoP1/8MiWRExy2rA=
	=
X-Google-Smtp-Source: AGHT+IE1mBLN35IJhMVQm6eou9wLzp1bNB4yK6xl5v6c0Y8AKWezVqTcxycvcqArYyozh6RgCMxn9g==
X-Received: by 2002:a17:90b:248e:b0:2e2:dd25:9b00 with SMTP id 98e67ed59e1d1-2e9b1741130mr28464867a91.22.1731488063521;
        Wed, 13 Nov 2024 00:54:23 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3e952e8sm953160a91.7.2024.11.13.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:22 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Date: Wed, 13 Nov 2024 17:53:50 +0900
Message-ID: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
operates with the same device driver. Therefore, since we do not need
two drivers with the same function, this merges HYM8563 into PCF8563.

This series was tested with PCF8563 and HYM8563 on khadas vim3 board.

Nobuhiro Iwamatsu (5):
  ARM: multi_v7_defconfig: Add RTC PCF8563 support
  rtc: pcf8563: Add support Haoyu HYM8563
  dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
  rtc: Remove HYM8563 RTC driver
  dt-bindings: rtc: hym8563: Remove hym8563 binding

 .../bindings/rtc/haoyu,hym8563.yaml           |  56 --
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  18 +-
 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm64/configs/defconfig                  |   1 -
 drivers/rtc/Kconfig                           |  11 -
 drivers/rtc/Makefile                          |   1 -
 drivers/rtc/rtc-hym8563.c                     | 587 ------------------
 drivers/rtc/rtc-pcf8563.c                     |   2 +
 8 files changed, 17 insertions(+), 661 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
 delete mode 100644 drivers/rtc/rtc-hym8563.c

-- 
2.45.2


