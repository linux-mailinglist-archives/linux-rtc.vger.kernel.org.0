Return-Path: <linux-rtc+bounces-1782-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E5965A73
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 10:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6202C286D88
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 08:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3969416D9C0;
	Fri, 30 Aug 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzsIgzOr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CB14BF90;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007005; cv=none; b=McqC8G+lozym48yU0wutYm+VtbHulFLkvyk2NVXeZJ8n3lc/ZIvpcV/Aw+dClwN7rugWWhhEMCoG7jwoXm2eH8BkZkuCHJvNfTBXi9bStXveN5CuMCiQX+yiv2yxd8mA5mRqcrjGdiJAKp08HUpXa2y5ib7ea23ltzZ+AS3+6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007005; c=relaxed/simple;
	bh=2VzWr05VElbVqIIujZIuQJRexgBT16cu03gaLgfE40Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdJTKWSlkOx2QsN5xXxhrcW69LxJ7qaq2QJ3+cWXWT9dCzOMwhPY4ZFuvgi9tog/4Xx87elJCS17ysolMh0bEvge0PghyA9WPrgq9Fru+iIDYIm6M7iVknmBgXBnBSGByLAcG8PTAWAtXXiN50JNBtyapZQyiCvgXlZtIZLOZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzsIgzOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C39A8C4CEC8;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725007004;
	bh=2VzWr05VElbVqIIujZIuQJRexgBT16cu03gaLgfE40Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hzsIgzOr3FXKeFPaQFB/oWFvA69PfSW7QSjkIopOpTiprwl4G2luqLxBKnOFWcpDq
	 l838vVySoIWMFZPvlolv77JptiwQEcqBPp7ZfazTwwfNzmBDAMni0pWvMrsV40Co0S
	 a5BTrPiusHplkIa7wgR1qny51yMVc3w3StLFIMoUbOtb4UDf8rh3FD0slWW19VA5L3
	 xXDc1blixnktDK1wbamt7tr11zbnM6fgYfuKfKFknPAd7j5gKOyKvEbjLshAgcL8/X
	 9bF1A4RKZwg0s/rupN5TctBCi6PhUG31vvpjegnHP0UAImAGCJLaffNJxOGpxebpTd
	 WogQ7L1mFc8XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC46DCA0EF2;
	Fri, 30 Aug 2024 08:36:44 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Fri, 30 Aug 2024 10:36:41 +0200
Subject: [PATCH v7 3/3] dt-bindings: vendor-prefixes: Add DFRobot.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240830-rtc-sd2405al-v7-3-2f7102621b1d@gmail.com>
References: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
In-Reply-To: <20240830-rtc-sd2405al-v7-0-2f7102621b1d@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725007003; l=804;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=ncH4Nose8ybtnpgQlMcSo58ScS7tXEPtFaOCy+e67Ts=;
 b=Hz6d/p862molA2KSGaZs8bmNVaTxxf6kUPq7qIl4lrAdbhzNJA/3/7iApn+1vs4xl7+GBVQnp
 7+4/E3iRneuC0EjWrhGsee84n7kH3SqAmxOmgZz5eRF3/GokhzN/o7T
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Link: https://www.dfrobot.com/about-us

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tóth János <gomba007@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a70ce43b3dc0..bd8b279a5152 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -368,6 +368,8 @@ patternProperties:
     description: Devantech, Ltd.
   "^dfi,.*":
     description: DFI Inc.
+  "^dfrobot,.*":
+    description: DFRobot Corporation
   "^dh,.*":
     description: DH electronics GmbH
   "^difrnce,.*":

-- 
2.34.1



