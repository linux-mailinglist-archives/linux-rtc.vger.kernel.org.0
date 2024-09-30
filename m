Return-Path: <linux-rtc+bounces-2074-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC175989EF0
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 11:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 679A7B253A0
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 09:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAEA18FDCE;
	Mon, 30 Sep 2024 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Xvc9BTvC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE9F18BBB0;
	Mon, 30 Sep 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727690161; cv=none; b=AlQ075Db8OmHsjTkUjMySs14cTFhOOe2vXrolius4tgtTuCZt9BEJlahb79ALR8Zf79ZH4pMdWgBv5RhFfTPkvgA4dCmCyGTkcGET7cy7iYvt3rzFOQ0L/f73lBDf/+nxGMB5tXoSlplkYGIMYMj2Lqg9cPklsSjGfPw4oPYhz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727690161; c=relaxed/simple;
	bh=eXthGSoTrnAT+PlIWv4WCCHmRkDe/EgJuNj9qj5f/fU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVN93W4iHTV0TxBlNmrNtCtPcPDR945PmCamNwUa4QtZkzPmYTaa9D20mXZ8WkgBFNQe16yP7ya4FGovjgLmPy3mN8xPm0PjFRE4oSsWzp4q4KfJ6k8QDw5ZD2zlQ4xXqNO6j46rspJJD8lc9rvglH3jaUv8vmxMrpx37t3YfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Xvc9BTvC; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690160; x=1759226160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eXthGSoTrnAT+PlIWv4WCCHmRkDe/EgJuNj9qj5f/fU=;
  b=Xvc9BTvCkti2JyRUcWVhNuFNGFYX956ml5/cxW3S3Bzz/0uPsQcQQtFr
   6P2CPHlrDwjB2BNuMpR0aB9yTZHAloA5w+d4/KJ1fV4wMNICj0hQk3gde
   cMiVFHb7ToR8og/x2spfudJ6jes0EcLLC8bozGL9LXVjqf7QPyK4TEibv
   1WoKOOUI1Hmv4zjzJaRy9065dKABkhKSyw0JXDlnNcreumDgaiZNmE2kb
   jdnA2TLYZtSoUM1GlzgdmMXrrUhwQSp6mGfyfhxLKTyladUvKs93/v5Cx
   dL0vpOFdEKNXgHMkqKOMiFrozyxj8qlvRoR9FELesY6GvlpN1m4PZQkop
   Q==;
X-CSE-ConnectionGUID: jBRUFo6rTUOCd1OoCerG2A==
X-CSE-MsgGUID: J5ZxObUESzSvp5UEBt/i1g==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997914"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:35 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:33 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 13/20] dt-bindings: rtc: mfps-rtc: Add PIC64GX compatibility
Date: Mon, 30 Sep 2024 10:54:42 +0100
Message-ID: <20240930095449.1813195-14-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX is compatible with mfps-rtc without any additional feature

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/rtc/microchip,mfps-rtc.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
index 7742465b9383..ba602b1c8799 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -16,8 +16,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - microchip,mpfs-rtc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-rtc
+          - const: microchip,mpfs-rtc
+      - const: microchip,mpfs-rtc
 
   reg:
     maxItems: 1
-- 
2.30.2


