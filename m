Return-Path: <linux-rtc+bounces-3-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126367A9CF3
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Sep 2023 21:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EBF5B211C7
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Sep 2023 19:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F363179AC;
	Thu, 21 Sep 2023 19:26:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A6D1772B;
	Thu, 21 Sep 2023 19:26:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA629E0615;
	Thu, 21 Sep 2023 12:26:20 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6784380569;
	Thu, 21 Sep 2023 21:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1695324378;
	bh=ArOXDNPsb39IVP6ABmEdM4JTh8AaKHgD3I00MBg//Zk=;
	h=From:To:Cc:Subject:Date:From;
	b=hAcjtQfU0uoSOqvjECKJjvi6D3XuNBmzdZkRu4GBZ2DJzcuEUR92foF2En8gbsx4F
	 U3NGJIVYQ2yHY0GCPFqQ5eF4wBp8An/s5vl6+6cWwP81ov3jbAAIrScbbkgv7aoGVv
	 NfROykF34xmlgLfC3ZX9dcpGp+CKWJg7pKwvoswN2ruxFa059x6yQBGHycMWE2aSKI
	 lediHULkXhqK2sEQgaP3PN6QawyFlJ+wYlAs0VY0lEwjFld/3x5C7uiKlRRHMBNN1h
	 4FjpWbAbOfNADEt5n0VLF1VpfFZi6FHmGIkxD1mRzgZ7c7QfiNVq6cjw61xDr+9dNr
	 D0MZwgFRAQeKw==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: microcrystal,rv3032: Document wakeup-source property
Date: Thu, 21 Sep 2023 21:26:04 +0200
Message-Id: <20230921192604.70944-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The RV3032 can be used as a wake-up source, document the 'wakeup-source'
property as allowed property.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
index 27a9de10f0af3..7680089d1d926 100644
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
@@ -38,6 +38,8 @@ properties:
       - 3000
       - 4400
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.40.1


