Return-Path: <linux-rtc+bounces-1750-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2C96223D
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 10:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 445B32848B5
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2024 08:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA5C15B99D;
	Wed, 28 Aug 2024 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbFVjOwN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441215B103;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724833403; cv=none; b=DNviizlRJ44zKEV7Y8IBi+bs5iDfyG7MX7KzcfSfUwjtR+l04v6/OGDKWCadSNMYmxybybOKDusaRUw53b3YXLdXnI4iWPE+vDiJlQK383j0inHLXVbTEqgxAaEFKgsoRWTxLjzGnMsjUcuRcEiHuD2GqLnWxU8/hiX64ONU+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724833403; c=relaxed/simple;
	bh=IiljpLloT97HqWcGsG9aafFxUMyCRiNYJx09CbMWlVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caVbLpXE04SDJJprUvx12iWuwCyTwPC0mUbEc+jMmfy8pSxUsJtPPJI8orIU/P0TMeatXKaYXaWdPdvMnrngH/M73fP7uSW8cS3qUWIOioMYJEYpNnFwxux7gBOjM6hg6Nto25dQrzBciwKtOaCMPXQaXl1j8WohHWrybitcTWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbFVjOwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA9DC4DDEF;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724833403;
	bh=IiljpLloT97HqWcGsG9aafFxUMyCRiNYJx09CbMWlVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fbFVjOwNXIKthQDLgtFhA5G8b9UxwRfHBBEQ25eqXCDrI6XAsdtXZ3vtf2DRgUwiG
	 L4WFVFJ3blv+MApg8XLVTyFlpfBmsjJ0Y1FArKxVUuAcDYAH8D7KTmxt5r0ZHdJTxQ
	 eT2ixE6Hh4i9iw+0bVzao7nzP+JGkNT4o3spOGXn6vYiTWihC1f9gjxEiiGivycx/v
	 9up5CbEh2WUg90QM9SesW/YGVHZ02PuAiwz+lLrik8jr73/hrgZb6VOM+M6Ifj8qTW
	 2udk9PbP2G+DF4cGzzQGM4piAEJgBBkZznwxdDRQl+i8rmLOsrUpa+j4lixpO5bZpw
	 PU/zdzYonY8iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71149C5474F;
	Wed, 28 Aug 2024 08:23:23 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Wed, 28 Aug 2024 10:22:55 +0200
Subject: [PATCH v5 2/2] dt-bindings: rtc: Add support for SD2405AL.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-rtc-sd2405al-v5-2-9e3f8fa5ea6b@gmail.com>
References: <20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com>
In-Reply-To: <20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 csokas.bence@prolan.hu, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724833402; l=1442;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=qWxaAf/tRWvCysvtbxfKQdSTKlzQ/+oIz5nxFjiPb0k=;
 b=dVtCyoRsYzXhzwdFpP8gv2+0cTps49SIPVnIkiULfeZ+fdNLcf8PKk42qvnwuncl4H5lD+xVw
 X+OVkyBDiyHCwSJqKKbFPpI6GLjziqzdBgd3lUIn2g2Uj5rk17x1dlD
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add the necessary documentation for SD2405AL.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index fffd759c603f..dae594626b2e 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -38,6 +38,8 @@ properties:
       - dallas,ds1672
       # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
       - dallas,ds3232
+      # SD2405AL Real-Time Clock
+      - dfrobot,sd2405al
       # EM Microelectronic EM3027 RTC
       - emmicro,em3027
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..eddc91129a2a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -364,6 +364,8 @@ patternProperties:
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



