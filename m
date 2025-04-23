Return-Path: <linux-rtc+bounces-3975-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96BA981B9
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 09:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4982F16A348
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 07:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356FA26D4E1;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3wP0MK4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA726C3AC;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=PlW/SKkFvMILd6pckHRtJ1xIX7ND/KUXGFN3qqYoFBJtVIe+GkIFHsRYjXww7dDsJ8dOaAl5is3x96g0l98HIlatG9uVHm5oI6o0w/tDtfxqQmdFrd+CEtsOjsaXBeMfTLORUI6FWbdkr8Dvll2GDQlIKxikkbsiT2iGJQYqu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=w3N1b5wUaWGFT1fCSk/q4Qs8p2Hl8Jq/47UGxXM5li8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijibjzFNAmTzGmI4PnpIsA+hsbDKCoN3CmszZPa6wczc/ToNPcCNbNXqP48Y+9LvWvCvTiEziMuP5xztgFYvUsMOCXMRl5c/fjd35g5OFZ73xHf8eEDj/CHLNJgXEjfiTvpeQtEoR/I5PlJ6C+TJHVoBoAMexkVDqnt3q3uVZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3wP0MK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC181C4CEEA;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394840;
	bh=w3N1b5wUaWGFT1fCSk/q4Qs8p2Hl8Jq/47UGxXM5li8=;
	h=From:To:Cc:Subject:Date:From;
	b=u3wP0MK4FEDGfkOEOAmbjKjRknuKSNmzGC2pqAMfl2hLmtLN166yr6TgGT31Q5+7i
	 2BCdI8a/BCmC8QoSTBAl+Pu/LPtueHcBYS7y/Xa91JYKXbQ/ixo8I7/zYu5sLPjkKO
	 dDGphDs0/HUbZKJxcc0m5jE0afllZyMnhVT9XLOIeS3oAZJdoQfTZMVAyN/GwMKx5Y
	 avn1UHPnrrD9KjTxjiiRP5gosqafiaTFwWlYyOZZbc5AMRrybvQjQ7fpY8KCfD5cg0
	 IuqQ9CDFyiI1hOzvvo4ACZM5l3349TuiS/a1cd88GnePZFSI9NSfOjjW7XhexU7Seb
	 CBffiP+SM3d4Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Uve-000000002xB-2OFB;
	Wed, 23 Apr 2025 09:53:59 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/4] rtc: pm8xxx: fix uefi offset lookup
Date: Wed, 23 Apr 2025 09:51:39 +0200
Message-ID: <20250423075143.11157-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

On platforms where the offset is stored in a Qualcomm specific UEFI
variable the variables are also accessed in a non-standard way, which
means that the OS cannot assume that the variable service is available
by the time the driver probes.

This series adds a 'qcom,uefi-rtc-info' boolean DT property to indicate
that the RTC offset is stored in a Qualcomm specific UEFI variable so
that the OS can determine whether to wait for it to become available.

I used such a property in v1 of the series adding support for the UEFI
offset [1], but mistakenly convinced myself that it was not needed given
that the efivars driver would need to remain built in. As Rob Clark
noticed, this is however not sufficient and the driver can currently
fail to look up the offset if the RTC driver is built in or if a
dependency of the efivars driver is built as a module. [2]

As with the rest of this driver, hopefully all of this goes away (for
future platforms) once Qualcomm fix their UEFI implementation so that
the time service can be used directly.

Preferably the binding and driver fix can be merged for 6.15-rc by
Alexandre, while Bjorn takes the DT changes through the branch which has
the DT patches from v2 (which unfortunately missed 6.15 but may possibly
be sent as hw enablement fixups). [3]

Johan


[1] https://lore.kernel.org/all/20250120144152.11949-1-johan+linaro@kernel.org/
[2] https://lore.kernel.org/all/aAecIkgmTTlThKEZ@hovoldconsulting.com/
[3] https://lore.kernel.org/lkml/20250219134118.31017-1-johan+linaro@kernel.org/

Johan Hovold (4):
  dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
  rtc: pm8xxx: fix uefi offset lookup
  arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
  arm64: dts: qcom: x1e80100: describe uefi rtc offset

 .../bindings/rtc/qcom-pm8xxx-rtc.yaml           |  6 ++++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi    |  1 +
 drivers/rtc/rtc-pm8xxx.c                        | 17 ++++++++++++-----
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.49.0


