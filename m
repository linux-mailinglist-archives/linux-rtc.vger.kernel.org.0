Return-Path: <linux-rtc+bounces-2193-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A7899DEC0
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 08:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4121F24FDC
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 06:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AEA18A6BD;
	Tue, 15 Oct 2024 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tggnq0dM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBA34D8DA;
	Tue, 15 Oct 2024 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975220; cv=none; b=s+j8wpwRu9RYf9MdqBHX2Vm+6ymxbYOo0ts1YsieouzRxm0EyoZk1RPGy+0j0ZEyN/+27FCYC2xQkAMC4fsqBPxF80uMI6/mFSXxWJHIMzXQzKObym/AHfvjUMLQQLytTS9HzZ14md6762luhLN6KqAmKrks7wHN85i4ivY7KK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975220; c=relaxed/simple;
	bh=Y0hLA3/kNh66v8rXi2L3o39hA6dsPBl6ysnS7YrgzjI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YlUh/1pnocyPhYKvJ0SUFzoJQ2+nDaVzyd/vg53UC7d1rjaXRi34yIa6UY7UnNfl69hzKYBsksdC53r+f/IXX0tJyp4QGWiHM0jW4juiedxeYGbNLf8xgaU2aSmcl29J8kNJkqU4TZqwkwV0hVqCX+fJAbNpYAyJ2tcXFl6P0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tggnq0dM; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728975219; x=1760511219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y0hLA3/kNh66v8rXi2L3o39hA6dsPBl6ysnS7YrgzjI=;
  b=tggnq0dM9B13BoT1d2ZzKmxb63KIjc2seCDf0EdXxdijbrsZIrd/XeM+
   3viPY8YCwN9eGQbCFmj3RwKlkj9LjjdscSayS+hxOApen6/juIPPG6cqY
   2sLeOgnASTA1G3QMgRbLIzlXRJB1ePRM8F/9nIMllbCPtbmGne/7OnCUh
   1C+caioVylS8O43WtoVJqK87ctqOSqRJcMpe1FGG/0QcXMsDKT6QZUi2l
   J8tZYbnN2m9Na5n76fvnUJeRh2WTTWsYEci4pY5fLbhhdrtZP8F8qoHsD
   FHdRiT8Pno14REky3SFLvXvbPkNGD98KApdmJo3enD5ziO2cKTVJtGJkI
   g==;
X-CSE-ConnectionGUID: yCv4gCQTSamF0+7By3EDTQ==
X-CSE-MsgGUID: 4Be8WNoUR6SQxl8RV0RJEw==
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="264095707"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2024 23:53:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 14 Oct 2024 23:52:52 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 14 Oct 2024 23:52:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers
Date: Tue, 15 Oct 2024 07:52:05 +0100
Message-ID: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fWpxN8K11bJ5x0YC40mNtLQgQ9o7Ar/G2CczGbAX7fQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl8giJ3M4Qql96KTkq8rHRlG9O7yeYuTMu3NkxVVpq/mbup ak9gRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSs4Phf/a1v3eecTycs9I8tW+54y vjM20Ljpguy6r58Ph6a4/miSBGhsdZzsl+pTdzOH+YGKmWbboZ8s1mp5//ITu3J6b799fPZQAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lewis hasn't worked at Microchip for a while, and IIRC never actually
worked on the RTC in the first place. Remove him from the maintainers
list in the binding, leaving Daire.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Noticed him in the CC list of your resend, figured it was worth removing
him.

CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: linux-rtc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
index 7742465b93839..59919a3e1c46c 100644
--- a/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
@@ -12,7 +12,6 @@ allOf:
 
 maintainers:
   - Daire McNamara <daire.mcnamara@microchip.com>
-  - Lewis Hanly <lewis.hanly@microchip.com>
 
 properties:
   compatible:
-- 
2.43.2


