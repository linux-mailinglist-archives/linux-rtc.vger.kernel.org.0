Return-Path: <linux-rtc+bounces-4137-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B405AC25EA
	for <lists+linux-rtc@lfdr.de>; Fri, 23 May 2025 17:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867EA1BC4BE8
	for <lists+linux-rtc@lfdr.de>; Fri, 23 May 2025 15:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B0129614C;
	Fri, 23 May 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Wcqn5p1K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141129375A
	for <linux-rtc@vger.kernel.org>; Fri, 23 May 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012764; cv=none; b=O4Be5Mcortd4zyB0xekT+6BJIGxYp9hX+6Q6Gc5SsPinLlaDuVXfhMtTJ2Dkw2S0zu6UovJmWqAWmamK41lGVG7/dHp9aLpMj5yWTa4Rk4XtV415GN9M1SVEnh30c8h8i4acW8+ejAIQEtlJ90NLv+e8ZfpHZ4Y48+6/90VRjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012764; c=relaxed/simple;
	bh=Zp0t0gQ6zql+cFVYTxXqEnlb1HEvtlvL8MztF4/90kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vf+hjZv1C6ZwO6JZMQwolVjQa1orZ6noXwTUPgQfPk04kC6y+Buz3WY0/3GM1GkXoAb7/iUa/TI731s4rKfXaV9zMn4fJiIQqdXHeRTJSVTzAaXiRVJYQcvczBHwGCrBtol8PpG6w+TPqt187ydCLiE9x7xGnYVUhNh7frKsPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Wcqn5p1K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=X1MZQtiVYV42gbzU6x0arb0j058JD95C+Gy2A3dJf1U=; b=Wcqn5p
	1K9wPLqR+QHdx8ZT3MyOlXLCon6qdlviAYnvQMkGSJgkwWZVc9QumfcSFCMYIdTx
	V1vcmWruXs2m+ip4bjers88ivUY29aQ0g8yJVN62csFZScBvhE7q3FvhBI7/NTC6
	d+x2Uy2KVc1JxihzGcI1R5glyCJ2OFS32JWAMGxGYdi1278YJNmqhRqBnO9azPAY
	J95dVF75ln6bdidnFpgD7WnBM7CEMAOEQLHWkZdTyD9sA0insmpZPB6OpIdbl08t
	I4X6Zq4jI0U0+bSa50V3Bw93VdqY1RrNANbvpnALcoUJTuiYeR6o3EfaFdx2CSs6
	nKFrwc+pdTvrfctA==
Received: (qmail 4082957 invoked from network); 23 May 2025 17:05:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:05:57 +0200
X-UD-Smtp-Session: l3s3148p1@ikBv7841YhJtKPAL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: rtc: rzn1: add optional second clock
Date: Fri, 23 May 2025 17:05:38 +0200
Message-ID: <20250523150541.8390-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
References: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external crystal can be a second clock input. It is needed for the
SCMP counting method which allows using crystals different than 32768Hz.
It is also needed for an upcoming SoC which only supports the SCMP
method.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index f6e0c613af67..f6fdcc7090b6 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -33,10 +33,14 @@ properties:
       - const: pps
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: hclk
+    minItems: 1
+    items:
+      - const: hclk
+      - const: xtal
 
   power-domains:
     maxItems: 1
-- 
2.47.2


