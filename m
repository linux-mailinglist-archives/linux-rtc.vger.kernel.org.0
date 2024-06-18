Return-Path: <linux-rtc+bounces-1355-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF490D73F
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 17:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD6F728AC74
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446CB22309;
	Tue, 18 Jun 2024 15:26:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC7C1E895;
	Tue, 18 Jun 2024 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724411; cv=none; b=EXj+8zapcdxkHPfXfX5BjuLSmkJ8e657IlpAayTNWrfoh9gUKmfn2Mq43SWnKuvOIbzpbwr8uxeNDIxBFeB04CIdM5Y36lmkg0d3hLhbJkOiG+1690eC3aZK72lWvrRBoZCFsJWeGW12Zz/LpTUzls46AyqHUZUwSjmtu5QTsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724411; c=relaxed/simple;
	bh=nQhEqavArIQ/hs+sfgW4QyFhU59OZMb6rIk6RRvZsQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oxKmLfWv45fZzPChZk2YvmOu1mR734PxJXD/eyHIOs42AuHVGIzzhaIRtKhKvKxyjTuEa4ONbNYP2fvve+/Odaq0jsNAxXS2EeK8HOpAc7QhPzpBXnMtM0K+Tf1gO0xqTC2qImphFY75IV7sqVqaWOzX1FTa4t3SbonpMCQ0AgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,247,1712588400"; 
   d="scan'208";a="212384983"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jun 2024 00:26:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2CDE14006A90;
	Wed, 19 Jun 2024 00:26:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Update correct procedure for clearing alarm
Date: Tue, 18 Jun 2024 16:26:29 +0100
Message-ID: <20240618152635.48956-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per the latest HW manual[1], the INT# output is pulled low after the
alarm is triggered. After the INT# output is pulled low, it is low for at
least 250ms, even if the correct action is taken to clear it. It is
impossible to clear ALM if it is still active. The host must wait for the
RTC to progress past the alarm time plus the 250ms delay before clearing
ALM. Apart from this, there is an internal delay(~250 microsec) from
setting ALME = 0 to disabling the alarm function, so the user must add a
short delay of greater than 250µs between setting ALME = 0 and clearing
ALM.

Currently setting of ALME = 0 is done after clearing the ALM, so just
reverse the operation and add a delay of 275 microsec. Also add a
250msec delay before clearing the ALM.

[1]https://www.renesas.com/us/en/document/dst/raa215300-datasheet?r=1506351

Biju Das (2):
  rtc: isl1208: Add a delay for clearing alarm
  rtc: isl1208: Add correct procedure for clearing alarm

 drivers/rtc/rtc-isl1208.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

-- 
2.43.0


