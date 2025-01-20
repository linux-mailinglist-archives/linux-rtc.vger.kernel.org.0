Return-Path: <linux-rtc+bounces-2954-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B29A16E96
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452547A1581
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437801E3DED;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b44zenXk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE71E3DD1;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=AMA+ssazgMVdL08ZWrRfAIlHFQuL8fuW54tLmXqqS8MEcv4F8o32FgP08HVl3k5zrU+yhPd/4kf9jNo3Hf0odRTHP6PuI/Y12qHW+xxhfl4oM3h93xiuF9CJVNnoNS94aVGvadNWF1Li6LKl6OwswbMllJaAwKbVGGHGc0mOOW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=LDSCxrJ3sEs97UkYuOGchEHijm9NPMDhmIJiAVmfn+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBiXEG6wu65Su+JHF5hU48snpRuDpCZd6KV32LjA4m6riVB1eAa6+sq06NuG2iL/nh6VE7jJqKluaVgKjY0uz4Uh7pb75e8RgGCmVoWf5bJkob5VwKmUSK/x8Rlh+VBiAMgWb5l65tqAxlo95CiidAGtVzI3ehTAOiMhrSXH5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b44zenXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C2BC4CEDD;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=LDSCxrJ3sEs97UkYuOGchEHijm9NPMDhmIJiAVmfn+Q=;
	h=From:To:Cc:Subject:Date:From;
	b=b44zenXk/QYs726WU9W9BHOqoZLbK4jl+FhPIh2UaWK8odSsoI0uzU+jdtX95Lzi2
	 R3x1lKl1PtaI85mk7KVR7lfxeHwDs7T33OEL0aqW26tWKtEBTqBpw/ocYliGQ3Z7wa
	 7MncJV7RBiV1DbvzJfTJtOq0Vwz5a6SLSF9X29M0Xmp8rn65wNWnJufZz+RP+VZvV2
	 4/yK8B8UEvn3cHV3BZfBRyoNmSkIiaHVhO2PWbmKNp/n/Y/OVko8Md1o36UoOGJEOZ
	 tzSMWCOHpKZK44PrFOg67LAZCH2066DqxS8d/CiAH7N77uyYCRWQOtr6HfntvQzn5x
	 VoTHt+dtPczTw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszK-0000000037w-27J7;
	Mon, 20 Jan 2025 15:42:51 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/7] arm64: dts: qcom: x1e80100: enable rtc
Date: Mon, 20 Jan 2025 15:41:45 +0100
Message-ID: <20250120144152.11949-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for utilising the UEFI firmware RTC offset to
the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
Elite machines.

Included is also a patch to switch the Lenovo ThinkPad X13s over to
using the UEFI offset.

The RTCs in many Qualcomm devices are effectively broken due to the time
registers being read-only. Instead some other non-volatile memory can be
used to store an offset which a driver can take into account. On Windows
on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
storing such an offset.

When RTC support for the X13s was added two years ago we did not yet
have UEFI variable support for these machines in mainline and there were
also some concerns regarding flash wear. [1] As not all Qualcomm
platforms have UEFI firmware anyway, we instead opted to use a PMIC
scratch register for storing the offset. [2]

On the UEFI machines in question this is however arguable not correct
as it means that the RTC time can differ between the UEFI firmware (and
Windows) and Linux.

Now that the (reverse engineered) UEFI variable implementation has been
merged and thoroughly tested, let's switch to using that to store the
RTC offset also on Linux. The flash wear concerns can be mitigated by
deferring writes due to clock drift until shutdown.

Note that this also avoids having to wait for months for Qualcomm to
provide a free PMIC SDAM scratch register for X1E and future platforms,
and specifically allows us to enable the RTC on X1E laptops today.

Rob had some concerns about adding a DT property for indicating that a
machine uses UEFI for storing the offset and suggested that the driver
should probe for this instead. Unfortunately, this is easier said than
done given that UEFI variable support itself is probed for and may not
be available until after the RTC driver probes.

Hopefully this all goes away (for future platforms) once Qualcomm fix
their UEFI implementation so that the UEFI time (and variable) services
can be used directly.

Johan


Changes since UEFI offset RFC [1]:
 - clarify that UEFI variable format is not arbitrary (Alexandre)
 - add missing use_uefi kernel doc
 - use dev_dbg() instead of dev_err() (Alexandre)
 - rename epoch define RTC_TIMESTAMP_EPOCH_GPS (Alexandre)
 - mitigate flash wear by deferring writes due to clock drift until
   shutdown

Changes since Jonathan's X1E series v3 [3]:
 - tweak qcom,no-alarm binding update (and drop Krystzof's Reviewed-by tag)
 - drop no-alarm flag and restructure probe() to clear feature flag before
   registering RTC
 - use UEFI variable offset on X1E

[1] https://lore.kernel.org/lkml/20230126142057.25715-1-johan+linaro@kernel.org/
[2] https://lore.kernel.org/lkml/20230202155448.6715-1-johan+linaro@kernel.org/
[3] https://lore.kernel.org/lkml/20241015004945.3676-1-jonathan@marek.ca/


Johan Hovold (5):
  dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
  rtc: pm8xxx: add support for uefi offset
  rtc: pm8xxx: mitigate flash wear
  arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
  arm64: dts: qcom: x1e80100: enable rtc

Jonathan Marek (2):
  dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
  rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm

 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |  11 +
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  11 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |   4 +-
 drivers/rtc/rtc-pm8xxx.c                      | 194 +++++++++++++++---
 include/linux/rtc.h                           |   1 +
 5 files changed, 185 insertions(+), 36 deletions(-)

-- 
2.45.2


