Return-Path: <linux-rtc+bounces-2046-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7C97E935
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 12:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A851F21B4C
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Sep 2024 10:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E7E195B18;
	Mon, 23 Sep 2024 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HAIVGcXg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60AC195809;
	Mon, 23 Sep 2024 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085617; cv=none; b=OV9FVW6iiOu2d5gCLNc0APrIM41Cw/sYlHXutj0NhhitoaGcQj2KWLPfwMm7hutA+9ijfHLDPzXzDTP8pv7RyLI1QQMrk0JglE7DZG7/u+TwxOnA8tAJgYJvhjYadZZ8D4o3RBQhFPtor9Gmifxtu4/I4XjbxWpXIRXFdZ+yW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085617; c=relaxed/simple;
	bh=7ECwv49t0WFiAx3RhC+fh1v+7w6XzbPg4STX+u9qe/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZ6LLX9ZI0+6nDfFHoaQ17cXYxla00Ic3VzDFQ0vNvVDYe2bHWFV6x/pqgp5jVOOmUTw+BOU8MBGxafeBs3jsVJo3EcEzTPEAtnqearOOdQIF853JjEQcR/ozkhPubAXvcuDlk6G1EUc0KYqcGLfrxgw5VPZ0Wp0knaqjMwcR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HAIVGcXg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085614;
	bh=7ECwv49t0WFiAx3RhC+fh1v+7w6XzbPg4STX+u9qe/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HAIVGcXgONpShgBWkyfL+ym8Jj4ookW2rEdYeDNvI+hsmFDEuKbmTVhk3gZsR6VwX
	 oH/dC78n3lvf/ujs52/q8fZtEW1QxndWkKDEipAyUqgf13JdfBUFyDDqsxTF8gOlcx
	 gSJj0a5oIGFTz9ATPhpVSyHaMU/HFAhxRecFGwwWFlP2bhrbBnifjHhXAK4RCwhAdo
	 ejvAEfKZ/iyj4mYOPmoUMaqFPMGznqPkNSQjWO02LrbqcZZNL3yrQ/vJis6rjbjEZK
	 978tgdjkz4D6e5d8FPNz0aF1TuCp6vMIpIDDdFSYsIS1bfChzpk4xDie1ODWRvWhkq
	 Cr1IpRs3Hmcrw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55AB217E10AE;
	Mon, 23 Sep 2024 12:00:13 +0200 (CEST)
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
Subject: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
Date: Mon, 23 Sep 2024 12:00:08 +0200
Message-ID: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable evaluating the start-year property to allow shifting the
RTC's HW range.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 953358bc997a..a83cc35f51f1 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -71,6 +71,8 @@ properties:
                   - mediatek,mt6366-rtc
               - const: mediatek,mt6358-rtc
 
+      start-year: true
+
     required:
       - compatible
 
-- 
2.46.0


