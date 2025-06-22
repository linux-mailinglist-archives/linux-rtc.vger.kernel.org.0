Return-Path: <linux-rtc+bounces-4326-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC830AE2E2A
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5B3174794
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EE1149DE8;
	Sun, 22 Jun 2025 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hmpmnB+/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C982899
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562989; cv=none; b=oJoRckRlq5ftjC5h9M1kzSf9rjZIrNL6Sn9UzFcmLoq4yXRY11JkuN489alCi7lYcS07GD655YZ/Fyit9dBnNjGGT4QDH6wTttvHJsUDVhSyYiRyBnCO3rwnWTaeD/RWcOG3+gwfk49n4tCxVf0sLQjKOgfMQA3Rc/uxvRrVSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562989; c=relaxed/simple;
	bh=reQ/ACXzC0FPxqlDRYXVLqxNB2esQfycAhNqUDmVLbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDHGRXNU5GBuLwUZ8sxfuq1oxj5pi2qgEjh6uY9MgUME4VBehC/sWlGQDrzMwORYnwQfFI8XPUn0q7qUgT6Wgcnk16mSX8ovIZjcbrP4hyIsozc7zsB5G3U4M5lvc76yL1CD3WPSUq/uBiw3hQg7BjLQGmDYUcsMAB7TUlq1ek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hmpmnB+/; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fada2dd785so39477016d6.2
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562986; x=1751167786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=hmpmnB+/0htnlBZhnKYEm/ndtv4SnPGFeK4mOk7/JiQAdPGOac3ZCr1te0PzGvxsev
         lQHqBApyz0hezG8GvPLvhV7Z1yygx2ySvInDX9MzakrqlQnt3zQux+g+MzlRF1Tt+eEe
         xb1zk+YGiP1WbMdnAfy6A1+GQSWL6DCQyYErhD2Op9fXORH9HU2F6G6pHUo/zwpH68ao
         e7QgJbEXr6KinRJwapGjyMlDiSpqm+JM8TIOmhjw1tQ/by1gwqYQrwUcTpdxalSGN//F
         m+LcM2h93xvMCDbfYb0jPlonkKkSdkQog9ZnJDU8h9oeA/VLbHqPeZlzzrqg38EP2N+w
         ymeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562986; x=1751167786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgrserUFU/DcGo28DBPZa+gth4hnjdPTKAQjzFeKIM8=;
        b=GFSQHdkq5UAsKsf/1X30kPcM18b+aDa2IcMg3d7x3s3Dm5yQUe9Hy/LNtN8CmOADId
         3+PAWSZQZW5GGEwD7+xnLSb6m+8eKssT/mUqgua04IG6Bbrimhrg0+nlkpO+qlmEnArf
         6BEc+PHzSNoe3+va77tZTKeujulDeXbnMRkTaIXrvmqMFaksGZf51mux8wRYyvhVcCm6
         zrDoe5D9BEyquQ6MYJG62hT1K7wzYBPmpe7ToLVxY+B8xH3A4juin5AisuKw60YpHSPw
         8DW5LxtV+/V1beyfi67JrtSCRwUuD7+dl9/3BGEp65kQ1UJz7u8fXUHWwLBpjTRgXT1n
         jRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZrQAxecqTvgvXfidko3ax6RFX/dzTm5i7B7VuS260bomr926RPuWOZGjY0BCVOUX2OQesXsE9yhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYccDCpYsYdYGW4dXC6nj137vN9ObB1xV1WJx3vQUQemi7VKWv
	k8UurC1yB4dWPi7MwdI9QyTQur/94Gwsza26gOYEDgPGkrJAuXOVJiJzTgUQ9wppYM4=
X-Gm-Gg: ASbGncsGWpchEpDBe8fuhVhvo1NawHMX5P0AaiQZByuhZEZV9zYvodODjfPsRuAUzZH
	2lsLUmhyHP63yg/znTlTkwwFsYuRkOMXOyE9NoOpUf9MfbCSQQ+/6OSvD97SiDBHGOK/t/bunBL
	G8wAX2+UlEo5AzNSsbhuHAmAKbZ1EiK2JEJMFzXbotNWX0zfAkJxWMi3o+Rx3tuXgrKIQzM7m/s
	hzL4idy3SyHTvfigjgf+m73rdlWgC72TfeEuraYMSgV8+Y0Kb8KJfl+/Ug9KISjlgxncjn1GsCw
	VDrjQuaMYpVhGvKymMXGIqFi6EcvSSVGq8YRi/PvdS3882lIy3hF4VtZrMxk2z4ha1Xy7S/F0cb
	M8aJQQRKtgrlMCNUhTL1HTK9hWXAtAgtFrrY=
X-Google-Smtp-Source: AGHT+IFeIAU1AkteDl39FgQydYRwtm5GM125i8YSXLkjgyUSEEtkYenBUd8CxZ/YJ2gC3UkZwdaRjQ==
X-Received: by 2002:a05:6214:509c:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-6fd0a54d8c8mr142353156d6.25.1750562985883;
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] spacemit: introduce P1 PMIC support
Date: Sat, 21 Jun 2025 22:29:32 -0500
Message-ID: <20250622032941.3768912-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
converters and 12 LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as drivers for its regulators and RTC.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v3

					-Alex
Between version 2 and version 3:
  - Removed "spacemit-pmic.c" and updated "simple-mfd-i2c.c" instead
  - Added an RTC driver, so that the MFD has more than one sub-device
  - Other suggestions were directed at "spacemit-pmic.c"

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Reviewed-by tag from Mark Brown to patch 3
  - Implemented suggestions from Vivian Wang:
      - Fixed a typo in the subject line in patch 1
      - Now use module_i2c_driver() for the PMIC driver in patch 2
      - Added MODULE_ALIAS() for both drivers (patches 2 and 3)
      - Defined and used DRV_NAME in both drivers
      - Added additional Kconfig module help text for both drivers

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250613210150.1468845-1-elder@riscstar.com/

Alex Elder (7):
  dt-bindings: mfd: add support the SpacemiT P1 PMIC
  mfd: simple-mfd-i2c: add SpacemiT P1 support
  regulator: spacemit: support SpacemiT P1 regulators
  rtc: spacemit: support the SpacemiT P1 RTC
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  10 ++
 drivers/mfd/simple-mfd-i2c.c                  |  18 ++
 drivers/regulator/Kconfig                     |  12 ++
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 157 ++++++++++++++++++
 drivers/rtc/Kconfig                           |  10 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-p1.c                          | 137 +++++++++++++++
 12 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/regulator/spacemit-p1.c
 create mode 100644 drivers/rtc/rtc-p1.c


base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.45.2


