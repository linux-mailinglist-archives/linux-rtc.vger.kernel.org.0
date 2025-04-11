Return-Path: <linux-rtc+bounces-3928-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34825A85D26
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 14:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7190C4A0D47
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 12:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4A629B22F;
	Fri, 11 Apr 2025 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nR6QMYZQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02229344B
	for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374985; cv=none; b=KQw9Nq20UFaCxqqLt27UV5pgRlkNWpGPCqBRqKm27xNL3MMQ5dsg9M7UISKSEkeYS09Shes/2IwPKNqJvppKfyBu7MYsK3AKjd6d0P8TVc+IO0k9g1ASF1VBa8G2KJ7dTSJmRfpyPHErJttLs8k9DX3RZCYnVLj2yXSR51sdGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374985; c=relaxed/simple;
	bh=TeU1qtBc+lGVT/HpCQKfBJRuhD/X5cT4MzAlX7BxgrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WkvS+pA5tXQq9WR8lacsZH7UPyYKp8dpyW7p0uyXucYDgHigf9ONjiADeeMj7fjE7Dw1Ex1srQCPBnjpHVVpRBeSTmaLdMd1VEhWAyee27N90IeVNOgaEXKajKoFNQ015rXjzTTUGD9EZsG9aUY3ltj16zHQMCZ39KTQi61uLQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nR6QMYZQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399838db7fso1926447b3a.0
        for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374981; x=1744979781; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=nR6QMYZQIhl0Trv7TQpmR8tFLDbb/lKSn6ySm2DOjViB1SU4lZaNEwry6kDEzYFjOM
         CN+dHg2tUTeKpEGCgVxdSqZrF2HzyO2MaNSP075jenDMSrXfWNhcE2Oi5z2nRL26vuHx
         xKi/2jj0JMdngtLdbMJFx6orAwESWjzqG3e/Y7rC9wTS2IlPLAGYXh7JmAsMStd9b23I
         BMxrrDWWSvgfNYzO63nQl2w0pX5Oow/C6QtPVy8HKQs+0TK0ffwHqZu+0qnkUL9n0ED8
         ++0ZKGu/XNuBlYU4JxYtrmRDqf1nu2SdoFbgeocjYXC9Zp5J/KycYG3pNHO4OwleK8pH
         QWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374981; x=1744979781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=dMtyoD/psRZhOa4dxDtL8EK+k7SDEA1Z9XUvb8LMbSZdAW+wuGbovUmhk5hiL1DuG+
         qX4BD3gHT2Vg3w4Wly3xdtpx83K4VKVxUtwbIdOe26FarFo3uJb8j0D/nML7DWhOEe4I
         +XgcIWfidAquDgRal44zkfHIj4RX0G7+Wm7l2opkR5XVqZ7X2PKiiaNQnVtMB7/LaWwK
         IS9G+pTTfOIC3aCmvyjpdYvR167rXzFRfTurUOU1cGY2v4v9eajWSHbr9VfmAbM2xjkr
         /0PPEtH/0bWa+LsrvKV8LkaWTeI8NZVmBL5kdKOgg8sdoM0pVWW/g8cMswEkV8Fyh/8i
         J/+A==
X-Forwarded-Encrypted: i=1; AJvYcCWdtXh3HgdPohX1i88EsB+xvwpy08LmHr7cYiQjK7BsiqbG6eSmw+YCAaU84p7G5ZUptgyAgfLQNks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxzkp4K0xw/tCaaU75jDdh9PBWmN3exlOWrqVjL8LOhnoOLjy
	5EQHrBMPg07LGhKn2FIiQ1m2i9s6dIJT/MiZD6w3OaRvZiNkBFJJl10d5eKAJqM=
X-Gm-Gg: ASbGncuH3Ik436XqIhLpHmNVyjBzzJYFeVUTdnLwgwRqy2nbGRgH2k3FzBzRLLIjvXW
	5iTaDL3PjVJasOCRye5yaJ2mXLQpNeijpTOhnuPe3zLBH/VFQCH6AcMFRnZ0MMM0ZJ3Kp8PRxWt
	yl9k1FNbngcd1FohomMveTSEQshh79u5duPKe28AzqsZXmeZEwlerfqtfOivjft2gkrx/56Y8cc
	g7gpczm3NuA/mDCEB2VPoO26S13Zo/tq2nhNSQyGVkDdBCN15xgkRNWcrGFw5eUtc2aRzA5NeKs
	BZR02MgRaC2VTUMlrZgPEmi0x9mprQ8kbOLBB8yAzzg=
X-Google-Smtp-Source: AGHT+IFovmGyGMQj3bymdOLN01PpdPyLZzWvo7zsQfRwoVJ3a92T1FSTenwoChm6y8KulWHfihn9tQ==
X-Received: by 2002:a05:6a00:1809:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-73bbf5db4c7mr10560474b3a.8.1744374981364;
        Fri, 11 Apr 2025 05:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 0/5] Enable RTC for the MT6357
Date: Fri, 11 Apr 2025 14:35:53 +0200
Message-Id: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkM+WcC/22NQQqDMBBFryJZdyQmjdiueo/iIhMnNWBjmUioi
 HdvdN3l+5/H20QiDpTEvdoEUw4pzLGAvlTCjTa+CMJQWCipjGzkDShanAh4cYDK+6s21qvBiCK
 gTQTINrrxUHJbNxrYtcf3YfLhe4aefeExpGXm9ezm5lj/JnIDEqhTSqM3BrF7oF2ngEy1m9+i3
 /f9BwGfd+7DAAAA
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TeU1qtBc+lGVT/HpCQKfBJRuhD/X5cT4MzAlX7BxgrA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+NoIYjXj+o9tBSbe2ubQIPyD5kfY0YF94od6r
 MU0pleCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURVN9D/
 4k3aK0aGww2YNwHcKCp0TO1UivbsRrZwQC1+ak/Uk7UU7vYjLfAYE/2Dn20O2fUDmSLz92un+oTBP4
 x9Fhdg9CHZkQaaoxcapPvvG32aI2Aau2SYnny8/WhV65oCkofNgsmj22b3HHWSq1voe7T/kWghKUIo
 INAdePtn/XBWvyNNt5QUKX1fFUYxG6TZgTF2RryD7y91yyff0QE/UqpzsbA7ZOriIrfCC6MkQq/kcI
 Dfi6huKX79Aij45TnVutEJQozpDU839t4r1hNIsihIUXI0DkMZTUKdqftJoi+dhwpQGIQuyb2ilDlB
 izI7ZCeZsnnCW91AxhA7MitBvFdHdmoWyrzKUoQak+rNfMdiSYD8EIXc6SQlFG2L2hDkgnvpSAji7K
 jIU6dnaUKFY1ITVHzLGxbyAvgKrdlfUMmkeaHuRW9yNxoYVsd4Io2LJ3V9hk9PhXESMr3CRl6DSEI0
 nlJusBoAibu3rFd9TW/yKTlC0L7eqDgLxRvgLVClSZeUDaC2YJIxMnRrEqH9ffXks2uF6bMftm/Jt9
 lAhBwwVAHSGS571K0h9uk8QmQvOMSPTNu+/uVbx/F8BAO5bJjb6Yi/P6nCGHFUZ+7FuF4UARR7SXXW
 BkZJsK6teBtEffDviuxEDEwPAh9/YTnJJx1ClDIfZv8AaVBXbpar7T50Es/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The RTC subsystem in the Linux kernel has long had issues handling dates
before January 1, 1970, particularly for hardware with base years before
the Unix epoch. This patch series fixes these issues, focusing on the
MediaTek MT635x PMIC RTC implementations.

The core problem is that MediaTek MT635x PMIC RTCs use some defined years
before 1970 which are negative values after conversion. These differences led
to inconsistencies and bugs when the hardware's native time representation was
converted to the kernel's time64_t format, especially for dates prior to 1970.

The first patch adds MT6357 support to the MT6359 RTC driver. The second patch
fixes the fundamental time conversion functions in the RTC subsystem to properly
handle negative time64_t values (pre-1970 dates). The third patch adds
explicit type casts between signed time64_t and unsigned timeu64_t to
fix comparison bugs that were causing validation problems.

With the core functionality fixed, the fourth patch removes hardcoded start time
parameters from the MT6397 driver and instead relies on the start-year
property from device tree. Finally, the fifth patch updates the DTS files to
specify the correct start-year values for all MediaTek RTCs.

These changes make the kernel correctly handle the full range of dates
supported by the hardware. This matters for embedded systems using
these MediaTek PMICs, which may require accurate representation of
time across a wide range of years, including before 1970.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Rebase on top of rtc-6.16
- Added explicit start-year property in DTSIs for MT6357, MT6358, and
  MT6359 PMIC RTCs to ensure consistent values between hardware
  registers and the RTC framework.
- Removed hardcoded offset and start_secs parameter in mt6397 driver
  in favor of using the DTS start-year property.
- Fixed type comparison issues between signed time64_t and unsigned
  range values to correctly handle dates before 1970.
- Added proper handling of negative time values (pre-1970 dates) in
  time conversion functions.
- Modified rtc_time64_to_tm() to correctly handle negative timestamp
  values.
- Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
  pre-1970 dates to be validated correctly .
- Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/

Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (5):
      rtc: mt6359: Add mt6357 support
      rtc: Add handling of pre-1970 dates in time conversion functions
      rtc: Fix the RTC time comparison issues adding cast
      rtc: mt6397: Remove start time parameters
      arm64: dts: mediatek: Set RTC start year property

 arch/arm64/boot/dts/mediatek/mt6357.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi |  1 +
 drivers/rtc/class.c                      |  6 ++---
 drivers/rtc/interface.c                  |  8 +++----
 drivers/rtc/lib.c                        | 38 +++++++++++++++++++++++++++-----
 drivers/rtc/rtc-mt6397.c                 |  3 +--
 7 files changed, 43 insertions(+), 15 deletions(-)
---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


