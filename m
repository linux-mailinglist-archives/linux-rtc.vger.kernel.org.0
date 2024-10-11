Return-Path: <linux-rtc+bounces-2162-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D899A0C4
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 12:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C99286799
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BD021018E;
	Fri, 11 Oct 2024 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jC8jiq+9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776C210182;
	Fri, 11 Oct 2024 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641189; cv=none; b=fSALJFZOUDvDDTvOJ81oMOIynTe5xWxuYZEO0lEmC1In0Xyqa0WXkdYDSElvGxpLgeHU+f0OpQLmS6mkrDDg95lWs2Df+4PFzpChqOSqG7gi2myoRRN6tg+myyMbOWK2AOh99LAgWnmD/FNQ7ktFptnr9ly6E61QVyKUMAkyTws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641189; c=relaxed/simple;
	bh=ot4KLXxpVH1GyNQkw3EICpCPCfdy03J3mg1Eh5iQbwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rljRxc3xU1eYzrCSSQFY/PQr7y9aApqdntBGaArVQo1VI99d/vYS9DCbLRTuQ+aDjQnWgkPyKVp4seHsrhi2djbN+6GrTbR+U2ykqy4BLEQMbHy6N9scpcRjew0gtKZL4VchS/xvoC2FeIq05xQCicaSR8akp2/GZRhw2io+jrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jC8jiq+9; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4A56240004;
	Fri, 11 Oct 2024 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728641178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QJes2rbn2pJz+0Oi4GVIkquqy9jeHRdMg66UuPtATlM=;
	b=jC8jiq+9Sy50LXD4a29Ebf36Ig3hQl08AcLZBQl6SG6UAa66DJGS7+dwNRV0yaHHgXM3dY
	WUsZYslOVI16jHBOTjYyku+B5nyqQJurBond3xDbmk0Z6aEIl+4s8L1qztv8DIA0HBFlzs
	v42GKFQitMsCVdsgLhR5n9z2KR5DWFL2SuY7j4l426dA8f3U1akKD5jr126VgF8Tt/JsmJ
	A1DWjULQIxF8Tq2fFNNnOG+UbhXAVMLEli0b7aac7yHP62a/q9NbxseTayXL04LGISXG3J
	er0iWrpjbghkZF0Ez2maJjn17PIVJ73AmQ+MfdVdk1ePenM6kmUBTR0od65OTg==
From: alexandre.belloni@bootlin.com
To: pierre-henry.moussay@microchip.com,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: mpfs-rtc: Properly name file
Date: Fri, 11 Oct 2024 12:06:07 +0200
Message-ID: <20241011100608.862428-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The actual compatible string is microchip,mpfs-rtc, not microchip,mfps-rtc.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../rtc/{microchip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/rtc/{microchip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
rename to Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
-- 
2.46.2


