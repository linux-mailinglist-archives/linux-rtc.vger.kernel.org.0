Return-Path: <linux-rtc+bounces-4240-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18111AD154B
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jun 2025 00:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C185F188AE56
	for <lists+linux-rtc@lfdr.de>; Sun,  8 Jun 2025 22:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1830620FA94;
	Sun,  8 Jun 2025 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="At/yWD8z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ECB1D47B4;
	Sun,  8 Jun 2025 22:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422578; cv=none; b=WgLfZtTetHqCamuglMtLPIxnpIXR47uGpNWtzOoOuN1arc+PFWPA3vE26YoATiOVQK40xhbhOCHBF0TymsCCDcN4G9QIqaxdWkwtL5qgRkAYPUk6zsiGOj9Wery+qInc3SDjlx4mSdVS98o+wCKxLIo+U392HXPMU1QF/Is779U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422578; c=relaxed/simple;
	bh=+Ow8C5IDyvj7h168sBfQeN9yDKxNW7U1c0diPxjACy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDgIoQW0mMMM3OoQFTWmMKtQ0TXOqmZCgkuoe4wlu6HJpTKJrUxoMiGlE3TOyMhHGp4Wm8wgl4prb+v5YJnpwZof4jxWY13O5AXpUhqr3hvT9jFkr9WEaWPjjsYZwNNFOpRdz9BAWHzLX+VIeF0lb6io0d/KbEM6G/Kz0UCuvFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=At/yWD8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A258C4CEEE;
	Sun,  8 Jun 2025 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749422577;
	bh=+Ow8C5IDyvj7h168sBfQeN9yDKxNW7U1c0diPxjACy8=;
	h=From:To:Cc:Subject:Date:From;
	b=At/yWD8zn/DyP6c3CHHI5pK+CKgjyJU8SwVXiL7V8F3s/OeoVg5V428lBc0ahyxs3
	 7xVOaOFJDFv0td7SbS1GwgWQLXKDXJ4dTf+V0cREAN48wlVQ/ZkW5dw/Arcoj6dFbw
	 2R5LJTo/n9KYKHuuPW0p5JBaQFb5rfEOuTszmNaPC9AMjAHhuWuShc6DlzyS+vjwIl
	 iuTnWjTiuB58EacNORhPo6EgBp4ZbjmlNvQszi9bIz3EUrlPwmh+op5YCGTP1KJmTf
	 +Bn3dxleOLqRS5tINJFanfiI4iT8RGgIK9uNCzvf4h2lmJc3w3lQi9EmER2DA/nk3A
	 /LmKBQ9x2DHMA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Date: Sun,  8 Jun 2025 17:42:51 -0500
Message-ID: <20250608224252.3902421-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The $id path for the sophgo,cv1800b-rtc binding was missing part of the
path 'soc'. However, the correct place for RTC bindings (even if it's
also a "syscon") is the rtc directory, so move the binding there while
fixing the $id value.

Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
rename to Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
index 5cf186c396c9..c695d2ff9fcc 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
+$id: http://devicetree.org/schemas/rtc/sophgo,cv1800b-rtc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Real Time Clock of the Sophgo CV1800 SoC
-- 
2.47.2


