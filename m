Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDFC37BB78
	for <lists+linux-rtc@lfdr.de>; Wed, 12 May 2021 13:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhELLMu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 07:12:50 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:62181 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhELLMu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 07:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620817903; x=1652353903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2mMEcWBlHlrWU8bjPsSiCJZUDcBVw7uO2Zc306a3VIU=;
  b=Yr1v7uI7rHLkTng0mtBgJQC7E9yREXBMUU/ILq3Y1gfJnuBdjKvNF6Td
   SB6ujnml18VU4RuldXIgnDjgs6EriDT8Z7Vgq6OJo4BzdQa9NJ72245c8
   GgURB6Vg14eg+Vl225wtyPuFqAKFf8L/iH4z001ebGcJ1r9rmFyPqL7HI
   AqulnLzsUC4cE/2tN618mEoAww/8mfWE4+PU2eLOVB34m1whEulHsCyPp
   t+EQPO9mYBWoo4u91qptKCgiyOnFgW+SdqOG/xTclZj3iQGBfU5j1tC1z
   wxtAp2FoR8/djAAe6Cm6gajHNEAiBh/5EQ6dI6sWGHFcpEoow03wM+RVT
   A==;
IronPort-SDR: gBNIov3OB2gCbdDZx//iotF284mdkQs9qhbkZ4Bq99UfzRjQLSd6Mzsb0qw5hVXkF92MFhjzb6
 HvSMPeYAA5kQS3WZpoU3MED6DGBtAd+QzaTW9J/cBaJ0ewHBAyWC/GYXakwT5LnEy+n6oc2oqx
 d457Y2i7Xq/785fzPZoZtNL8E/EtGUZgrOQ2cUcxYIELnul61mMLka/UlESI7HOamSt36sFlJq
 QFtTsTZT7Es7HzgT7BVYLkgq7jt6ddZwYp/tpm9aPYoxMEFON2DcTtE4qiSoY+EIVHwIvW+sHU
 ywk=
X-IronPort-AV: E=Sophos;i="5.82,293,1613458800"; 
   d="scan'208";a="120801165"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 04:11:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 04:11:41 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 04:11:38 -0700
From:   <daire.mcnamara@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/2] rtc: microchip: Add driver for PolarFire SoC
Date:   Wed, 12 May 2021 12:11:31 +0100
Message-ID: <20210512111133.1650740-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

This patchset adds support for the Microchip PolarFire SoC RTC
hardware block.

Daire McNamara (2):
  dt-bindings: rtc: microchip: Add Microchip PolarFire host binding
  rtc: microchip: Add driver for Microchip PolarFire SoC

 .../bindings/rtc/microchip,mfps-rtc.yaml      |  61 +++
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-mpfs.c                        | 449 ++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 drivers/rtc/rtc-mpfs.c


base-commit: acd3d28594536e9096c1ea76c5867d8a68babef6
prerequisite-patch-id: 6f7f70120adfa8e938b97517f0c664e43e8745a0
prerequisite-patch-id: 4ea37008d23838aa2e0658811fe15462f6cdbd87
prerequisite-patch-id: 378c9d7495e56454b7bffbdbc430185dc4e36b90
prerequisite-patch-id: b547bbdf0a800c652cdd1a542b8ce725dfd6fcc9
prerequisite-patch-id: 98fc35868a9b0e284ba666422770fb3a4fe27ed9
prerequisite-patch-id: 28006f331625d755e92cc87ae194e05138f26909
prerequisite-patch-id: 26afc006e51cf743902bf609b537e1558e70f69c
-- 
2.25.1

