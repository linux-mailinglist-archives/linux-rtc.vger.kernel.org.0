Return-Path: <linux-rtc+bounces-5141-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5866AC051CA
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 10:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55488565328
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Oct 2025 08:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6632B306D50;
	Fri, 24 Oct 2025 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nn4OSvKD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA15B306B31;
	Fri, 24 Oct 2025 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294811; cv=none; b=uqIV5OEZARrbESjWq++QCVVKTvxgvKQj1qXwp82+Hp+7xHQTAbfBImgZrfHV/H3x5dpeDtnP6Ngi8WTfL8Qi11oAKVZalFlZHQa03HBvhd9Sl73CHdsWuJaVSqmJjUjbC4wrCKrTTksu6FhkJ79CHeBhqfX8+1g+tFXmcKPojYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294811; c=relaxed/simple;
	bh=nsRGIDtKYjLrHN9FUa+g9NCVrzhagqwv5Q1qaeBlALI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkQa2MB92psRZ0adoKYuL9WGK8Vq1iG/m2Fsh7YBK0l/t5/lFts+qjESkU12sBuc9+CuHP8cdMXcaQT/pp6kpEwB/1CwFgPLIj8esf+EIQ18BTV6lq6yh/zZOMpEJoO9DpCVJURydXKON0UCuxSTJVmUfAM/TR+OzpJdUKE4ST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nn4OSvKD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294808;
	bh=nsRGIDtKYjLrHN9FUa+g9NCVrzhagqwv5Q1qaeBlALI=;
	h=From:To:Cc:Subject:Date:From;
	b=Nn4OSvKDiMa+9ew5TM2/Yk9hc6DQDOujDWW1jt/vYQk5/D3a2DrdtCm3q6NjObBEa
	 uCc1Uul1rX5mIfaUvERjMx4m4EiylvDrfNMcBXM7TZJxNAcaalwSQNXlcdKpqGW+In
	 7VynKZA1+ClH2DsvkWoJgl23ZA1Le3ShEw1US1sy8PBGDP4zcX5x1bb4V26Gk2/vU4
	 3thF7bMHpSai/MRWF2lGi1vWL90we2LHdrKfD0Q0vhN0vjIXg7ZkYELHpSjzZ+nfCa
	 QYueOTgLJTVpswRo0GY3G/IABr46eLw/rI8Ues9lkGBPlC6CQVYxlC0q0gp7RazNyr
	 nw5sghyPXyQBA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A202D17E1249;
	Fri, 24 Oct 2025 10:33:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: alexandre.belloni@bootlin.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] rtc: Add support for MT6685 RTC
Date: Fri, 24 Oct 2025 10:33:16 +0200
Message-ID: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the Real Time Clock found in the MT6685
Clock/PM IC.

This chip has been used on a number of different MediaTek platforms
from around 2023 to the latest ones released in 2025 - and on both
Smartphones (Helio and Dimensity), Chromebooks (Kompanio Ultra) and
Genio boards.

This was tested on a MT8196 (Kompanio Ultra) Chromebook.

NOTE: This series depends on series [1] "SPMI: Implement sub-devices
and migrate drivers"

[1]: https://lore.kernel.org/all/20251021083219.17382-1-angelogioacchino.delregno@collabora.com

AngeloGioacchino Del Regno (2):
  dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC Real Time Clock
  rtc: Add support for MT6685 Clock IC's RTC over SPMI

 .../bindings/rtc/mediatek,mt6685-rtc.yaml     |  33 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mt6685.c                      | 472 ++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
 create mode 100644 drivers/rtc/rtc-mt6685.c

-- 
2.51.1


