Return-Path: <linux-rtc+bounces-2047-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79397E939
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 12:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C92E7B21254
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A073196C7B;
	Mon, 23 Sep 2024 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zs9LwxE3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC7195B28;
	Mon, 23 Sep 2024 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085618; cv=none; b=J9TmqD3LTJ0sbyfm/DEGE/ikSOJRA45WxEUwwUfG2qkMFjjBOJKwOludZ3WhvNdjOoLxCp/iYKWBsJqLIHRp3PLlEYEAneHnQN8v5sM+cG1tInvSNeAkgTHtcfq+YA1nAkylZ69sknkenj+nFw36YA8LWDt5uzIfMxst6RLavzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085618; c=relaxed/simple;
	bh=snK43mCmJ4Ga5wLxzmBewItLUFUZkQuI8ynxqK/sO9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orYU82mooo3naXVLcjSMLhwmkq4xNkv0DmAYYqpc3TECty6cxv0DMLy7miUwVFIKZhp94afcZFpbgVpRxvTKpgwrIisx+JWdIhVtQqOXNGnuzEb1ZMtC/548GL4aGOUIsVE/uWLCzOZ80wxFhH/10i3NUsaukZkwOpZ/fVzpo0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zs9LwxE3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085613;
	bh=snK43mCmJ4Ga5wLxzmBewItLUFUZkQuI8ynxqK/sO9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Zs9LwxE3N/eT4wW0nlGHI2aBTWIeWrFvW3ZIskTTWwkUGn0RjE86IokAOGuqq0v7x
	 VHGCWti1VchT5tMyjGGB4nvn13zzpG2P8NjbZ2cMVA1LUFq45N5pW1qww3ZfcP+7oz
	 vsG3nE0MwxCnTL85/o23QXeEtKu8TAl1r6EvRGpXk9Isa8xvhKkrQDNzWcr2K8EjLb
	 KBH4TX+WdpEdFzKMSOV8caahCNp6hSzM6RtAbjxK6Pt7PVqFP6w0RQzSEL/jM+LvPv
	 EvKXwOAkDxdquA+L5jGvaOLjUUPyI6Ze1oFo2ONg48BFlxMnMQDTLopTLuO7UTZqnJ
	 VidUgMDIvCfqw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8900A17E10AC;
	Mon, 23 Sep 2024 12:00:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eddie.huang@mediatek.com,
	sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com,
	macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] rtc: mt6359: Cleanup and support start-year property
Date: Mon, 23 Sep 2024 12:00:07 +0200
Message-ID: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the start-year property and removes the
custom handling of the RTC_MIN_YEAR_OFFSET (which is, effectively, doing
the exact same).

The start_secs timestamp was set to match the previous one from the
custom behavior so that there is no time drift on any device after
applying this.

While at it, a cleanup to use the Day-of-Week HW register instead of
manually calculating tm_wday was also performed.

For the bindings commit, this series goes on top of the MT6397 schema
conversion from Macpaul Lin [1].

This series was tested on a MT8195 Cherry Tomato Chromebook.

[1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/

AngeloGioacchino Del Regno (3):
  dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
  rtc: mt6359: Add RTC hardware range and add support for start-year
  rtc: mt6359: Use RTC_TC_DOW hardware register for wday

 .../bindings/mfd/mediatek,mt6397.yaml         |  2 ++
 drivers/rtc/rtc-mt6397.c                      | 29 +++++++------------
 2 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.46.0


